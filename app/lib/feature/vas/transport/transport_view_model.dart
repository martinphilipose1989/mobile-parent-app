import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/model/resource.dart';
import 'package:app/myapp.dart';
import 'package:app/utils/common_widgets/common_radio_button.dart/common_radio_button.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/request_manager.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class TransportDetailViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final GetTransportEnrollmentDetailUsecase getTransportEnrollmentDetailUsecase;
  final CalculateFeesUsecase calculateFeesUsecase;
  final AddVasDetailUsecase addVasDetailUsecase;
  final FetchStopsUsecase fetchStopsUsecase;

  TransportDetailViewModel(
    this.exceptionHandlerBinder,
    this.getTransportEnrollmentDetailUsecase,
    this.calculateFeesUsecase,
    this.addVasDetailUsecase,
    this.fetchStopsUsecase
  );

  BehaviorSubject<List<String>> busType = BehaviorSubject.seeded([]);

  BehaviorSubject<List<String>> serviceType = BehaviorSubject.seeded([]);

  List<String> onWayRouteType = [
    "Pickup Point To School",
    "School to Drop Point"
  ];

  BehaviorSubject<List<String>> oneWayPickupPoint = BehaviorSubject.seeded([]);
  BehaviorSubject<List<String>> oneWayDropPoint = BehaviorSubject.seeded([]);

  BehaviorSubject<List<String>> bothWayPickupPoint = BehaviorSubject.seeded([]);
  BehaviorSubject<List<String>> bothWayDropPoint = BehaviorSubject.seeded([]);

  TextEditingController pickupPointOneWay = TextEditingController();
  TextEditingController dropPointOneWay = TextEditingController();

  EnquiryDetailArgs? enquiryDetailArgs;

  final CommonRadioButton<String> radioButtonBusType =
      CommonRadioButton<String>(null);
  final CommonRadioButton<String> radioButtonServiceType =
      CommonRadioButton<String>(null);

  final CommonRadioButton<String> radioButtonOneWayRouteType =
      CommonRadioButton<String>(null);

  BehaviorSubject<bool> showLoader = BehaviorSubject.seeded(false);
  BehaviorSubject<String> fee = BehaviorSubject.seeded('');
  

  final PublishSubject<Resource<TransportEnrollmentResponseModel>> _fetchTransportEnrollmentDetail = PublishSubject();
  Stream<Resource<TransportEnrollmentResponseModel>> get fetchTransportEnrollmentDetail => _fetchTransportEnrollmentDetail.stream;
  final PublishSubject<Resource<VasOptionResponse>> _calculateTransportFee = PublishSubject();
  Stream<Resource<VasOptionResponse>> get calculateTransportFee => _calculateTransportFee.stream;
  BehaviorSubject<TransportEnrollmentResponseModel> transportEnrollmentDetail = BehaviorSubject.seeded(TransportEnrollmentResponseModel());

  int batchID = 0;
  int periodOfServiceID = 0;
  int feeSubTypeID = 0;
  int feeSubCategoryID = 0;

  Future<void> getTransportEnrollmentDetail() async {
    exceptionHandlerBinder.handle(block: () {
      GetTransportEnrollmentDetailUsecaseParams params = GetTransportEnrollmentDetailUsecaseParams(
        vasDetailRequest: VasDetailRequest(
          schoolId: 1,
          boardId: 3,
          academicYearId: 25,
          courseId: 1,
          gradeId: 5,
      ));
      RequestManager<TransportEnrollmentResponseModel>(
        params,
        createCall: () => getTransportEnrollmentDetailUsecase.execute(params: params))
          .asFlow()
          .listen((event) {
        _fetchTransportEnrollmentDetail.add(event);
        if (event.status == Status.success) {
          transportEnrollmentDetail.add(event.data ?? TransportEnrollmentResponseModel());
          setData(transportEnrollmentDetail.value);
        } if(event.status == Status.error) {
          print("Error");
        }
      }).onError((error) {
        exceptionHandlerBinder.showError(error);
      });
    }).execute();
  }

  Future<void> fetchStop() async {
    exceptionHandlerBinder.handle(block: () {
      FetchStopsUsecaseParams params = FetchStopsUsecaseParams(
        fetchStopRequest: FetchStopRequest(
          schoolId: 10,
          busType: radioButtonBusType.selectedItem == "Non AC" ? "2" : "1",
          routeType: radioButtonOneWayRouteType.selectedItem == "Pickup Point To School" ? "1":"2",
      ));
      showLoader.value = true;
      RequestManager<FetchStopResponseModel>(
        params,
        createCall: () => fetchStopsUsecase.execute(params: params))
          .asFlow()
          .listen((event) {
        if (event.status == Status.success) {
          showLoader.value = false;
          List<String> routes = [];
          (event.data?.data??[]).forEach((element){routes.add(element.zoneName??'');});
          if(radioButtonOneWayRouteType.selectedItem == "Pickup Point To School"){
            dropPointOneWay.text = "School";
            oneWayPickupPoint.add(routes);
          }
          else{
            pickupPointOneWay.text = "School";
            oneWayDropPoint.add(routes);
          }
        } if(event.status == Status.error) {
          print("Error");
          showLoader.value = false;
        }
      }).onError((error) {
        showLoader.value = false;
        exceptionHandlerBinder.showError(error);
      });
    }).execute();
  }

  void setData(TransportEnrollmentResponseModel transportEnrollmentDetail){
    (transportEnrollmentDetail.data?.feeSubType??[]).forEach((element){
      busType.value.add(element.feeSubType??'');
    });
  }

  Future<void> calculateFees() async{
    exceptionHandlerBinder.handle(block: (){
      CalculateFeesUsecaseParams params = CalculateFeesUsecaseParams(
        feeCalculationRequest: VasEnrollmentFeeCalculationRequest(
          schoolId: 2,
          boardId: 3,
          gradeId: 3,
          feeTypeId: 2,
          feeSubTypeId: 25,
          feeCategoryId: 2,
          periodOfServiceId: 7,
          academicYearId: 25,
        )
      );
      showLoader.add(true);
      RequestManager<VasOptionResponse>(
        params, 
        createCall: ()=> calculateFeesUsecase.execute(params: params)
      ).asFlow().listen((event){
        _calculateTransportFee.add(event);
        if(event.status == Status.loading || event.status == Status.none){
          showLoader.value = true;
        }
        if(event.status == Status.success){
          var amount = event.data?.data?["amount"].toString();
          fee.add(amount??'0');
          showLoader.add(false);
        }
        if(event.status == Status.error) {
          showLoader.add(false);
          print("Error");
        }
      }).onError((error){
        showLoader.add(false);
        exceptionHandlerBinder.showError(error);
      });
    }).execute();
  }

  Future<void> enrollTransport() async{
    exceptionHandlerBinder.handle(block: (){
      AddVasDetailUsecaseParams params = AddVasDetailUsecaseParams(
        vasEnrollmentRequest: VasEnrollmentRequest(
          summerCampAmount: int.parse(fee.value),
          summerCampPeriodOfService: periodOfServiceID,
          summerCampBatch: batchID,
          summerCampSubType: feeSubTypeID,
          summerCampCategory: feeSubCategoryID
        ),
         enquiryID: enquiryDetailArgs?.enquiryId??'',
        type: "Transport"
      );
      RequestManager<VasOptionResponse>(
        params, 
        createCall: ()=> addVasDetailUsecase.execute(params: params)
      ).asFlow().listen((event){
        if(event.status == Status.loading || event.status == Status.loading){
          showLoader.value = true;
        }
        if(event.status == Status.success){
          Navigator.pop(navigatorKey.currentContext!,true);
          ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(const SnackBar(
            content: CommonText(text: "Transport Details added successfully",)));
        }
        else{
          showLoader.value = false;
          print("Error");
        }
      }).onError((error){
        showLoader.value = false;
        exceptionHandlerBinder.showError(error);
      });
    }).execute();
  }

}