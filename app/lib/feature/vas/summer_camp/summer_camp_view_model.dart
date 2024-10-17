import 'package:app/errors/flutter_toast_error_presenter.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/model/resource.dart';
import 'package:app/myapp.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:rxdart/subjects.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class SummerCampDetailViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final GetSummerCampEnrollmentDetailUsecase getSummerCampEnrollmentDetailUsecase;
  final CalculateFeesUsecase calculateFeesUsecase;
  final AddVasDetailUsecase addVasDetailUsecase;
  final FlutterToastErrorPresenter flutterToastErrorPresenter;

  SummerCampDetailViewModel(this.exceptionHandlerBinder,this.getSummerCampEnrollmentDetailUsecase,this.calculateFeesUsecase,this.addVasDetailUsecase,this.flutterToastErrorPresenter);

  EnquiryDetailArgs? enquiryDetailArgs;
  BehaviorSubject<String> fee = BehaviorSubject.seeded('');
  BehaviorSubject<bool> showLoader = BehaviorSubject.seeded(false);
  List<String> summerCampType = [];
  BehaviorSubject<String> selectedSummerCampType = BehaviorSubject.seeded('');
  BehaviorSubject<List<String>> summerCampActivity = BehaviorSubject.seeded([]);
  BehaviorSubject<String> selectedSummerCamptActivity = BehaviorSubject.seeded('');
  BehaviorSubject<List<String>> summerCampDuration = BehaviorSubject.seeded([]);
  BehaviorSubject<String> selectedSummerCampDuration = BehaviorSubject.seeded('');
  BehaviorSubject<List<String>> summerCampBatch = BehaviorSubject.seeded([]);
  BehaviorSubject<String> selectedSummerCampBatch = BehaviorSubject.seeded('');

  int batchID = 0;
  int feeSubCategoryID = 0;
  int periodOfServiceID = 0;
  int feeSubTypeID = 0;

  BehaviorSubject<SummerCampEnrollmentResponseModel> summerCampEnrollmentDetail = BehaviorSubject();

  final PublishSubject<Resource<SummerCampEnrollmentResponseModel>>
      _fetchSummerCampEnrollmentDetail = PublishSubject();

  Stream<Resource<SummerCampEnrollmentResponseModel>>
      get fetchSummerCampEnrollmentDetail =>
          _fetchSummerCampEnrollmentDetail.stream;

  final PublishSubject<Resource<VasOptionResponse>> _calculateCafeteriaFee = PublishSubject();

  Stream<Resource<VasOptionResponse>> get calculateCafeteriaFee => _calculateCafeteriaFee.stream;

  Future<void> getSummerCampDetail() async {
    exceptionHandlerBinder.handle(block: () {
      GetSummerCampEnrollmentDetailUsecaseParams params = GetSummerCampEnrollmentDetailUsecaseParams(
        vasDetailRequest: VasDetailRequest(
          schoolId: 1,
          boardId: 3,
          academicYearId: 25,
          courseId: 1,
          gradeId: 5,
      ));
      RequestManager<SummerCampEnrollmentResponseModel>(
        params,
        createCall: () => getSummerCampEnrollmentDetailUsecase.execute(params: params))
          .asFlow()
          .listen((event) {
        _fetchSummerCampEnrollmentDetail.add(event);
        if (event.status == Status.success) {
          summerCampEnrollmentDetail.add(event.data ?? SummerCampEnrollmentResponseModel());
          setData(summerCampEnrollmentDetail.value);
        } if(event.status == Status.error){
          flutterToastErrorPresenter.show(
            event.dealSafeAppError!.throwable, navigatorKey.currentContext!, event.dealSafeAppError?.error.message??'');
        }
      }).onError((error) {
        exceptionHandlerBinder.showError(error);
      });
    }).execute();
  }
  
  void setData(SummerCampEnrollmentResponseModel data) {
    (data.data?.feeSubType ?? []).forEach((element) {
      summerCampType.add(element.feeSubType ?? '');
    });
  }

//  VasEnrollmentFeeCalculationRequest(
//     schoolId: 1,
//     boardId: 3,
//     courseId: 1,
//     gradeId: 5,
//     feeSubcategoryId: feeSubCategoryID,
//     feeSubTypeId: feeSubTypeID,
//     batchId: batchID,
//     periodOfServiceId: periodOfServiceID
//   ) 

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
        _calculateCafeteriaFee.add(event);
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
          flutterToastErrorPresenter.show(
            event.dealSafeAppError!.throwable, navigatorKey.currentContext!, event.dealSafeAppError?.error.message??'');
        }
      }).onError((error){
        showLoader.add(false);
        exceptionHandlerBinder.showError(error);
      });
    }).execute();
  }

  Future<void> enrollSummerCamp() async{
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
        type: "SummerCamp"
      );
      showLoader.value = true;
      RequestManager<VasOptionResponse>(
        params, 
        createCall: ()=> addVasDetailUsecase.execute(params: params)
      ).asFlow().listen((event){
        if(event.status == Status.loading || event.status == Status.none){
          showLoader.value = true;
        }
        if(event.status == Status.success){
          Navigator.pop(navigatorKey.currentContext!,true);
          ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(const SnackBar(
            content: CommonText(text: "Summer Camp Details added successfully",)));
        }
        if(event.status == Status.error){
          showLoader.value = false;
          flutterToastErrorPresenter.show(
            event.dealSafeAppError!.throwable, navigatorKey.currentContext!, event.dealSafeAppError?.error.message??'');
        }
      }).onError((error){
        showLoader.value = false;
        exceptionHandlerBinder.showError(error);
      });
    }).execute();
  }
}
