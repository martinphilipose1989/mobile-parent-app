import 'dart:developer';

import 'package:app/errors/flutter_toast_error_presenter.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/model/resource.dart';
import 'package:app/myapp.dart';
import 'package:app/utils/common_widgets/common_radio_button.dart/common_radio_button.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/enums/enquiry_enum.dart';
import 'package:app/utils/request_manager.dart';
import 'package:app/utils/string_extension.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import 'package:collection/collection.dart';

@injectable
class TransportDetailViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final GetTransportEnrollmentDetailUsecase getTransportEnrollmentDetailUsecase;
  final CalculateFeesUsecase calculateFeesUsecase;
  final AddVasDetailUsecase addVasDetailUsecase;
  final FetchStopsUsecase fetchStopsUsecase;
  final FlutterToastErrorPresenter flutterToastErrorPresenter;

  TransportDetailViewModel(
      this.exceptionHandlerBinder,
      this.getTransportEnrollmentDetailUsecase,
      this.calculateFeesUsecase,
      this.addVasDetailUsecase,
      this.fetchStopsUsecase,
      this.flutterToastErrorPresenter);

//  BehaviorSubject<List<String>> busType = BehaviorSubject.seeded([]);
  List<String> feeSubType = [];
  BehaviorSubject<String> selectedFeeSubType = BehaviorSubject.seeded('');

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

  final PublishSubject<Resource<TransportEnrollmentResponseModel>>
      _fetchTransportEnrollmentDetail = PublishSubject();
  Stream<Resource<TransportEnrollmentResponseModel>>
      get fetchTransportEnrollmentDetail =>
          _fetchTransportEnrollmentDetail.stream;
  final PublishSubject<Resource<VasOptionResponse>> _calculateTransportFee =
      PublishSubject();
  Stream<Resource<VasOptionResponse>> get calculateTransportFee =>
      _calculateTransportFee.stream;
  BehaviorSubject<TransportEnrollmentResponseModel> transportEnrollmentDetail =
      BehaviorSubject.seeded(TransportEnrollmentResponseModel());

  int batchID = 0;
  int periodOfServiceID = 0;
  int feeSubTypeID = 0;
  int feeCategoryID = 0;
  String? feeSubCategoryStart;
  String? feeSubCategoryEnd;

  Future<void> getTransportEnrollmentDetail() async {
    exceptionHandlerBinder.handle(block: () {
      GetTransportEnrollmentDetailUsecaseParams params =
          GetTransportEnrollmentDetailUsecaseParams(
              vasDetailRequest: VasDetailRequest(
                  schoolId: enquiryDetailArgs?.schoolId,
                  boardId: enquiryDetailArgs?.boardId,
                  academicYearId: enquiryDetailArgs?.academicYearId,
                  courseId: enquiryDetailArgs?.courseId,
                  gradeId: enquiryDetailArgs?.gradeId,
                  streamId: enquiryDetailArgs?.streamId));
      RequestManager<TransportEnrollmentResponseModel>(params,
              createCall: () =>
                  getTransportEnrollmentDetailUsecase.execute(params: params))
          .asFlow()
          .listen((event) {
        _fetchTransportEnrollmentDetail.add(event);
        if (event.status == Status.success) {
          transportEnrollmentDetail
              .add(event.data ?? TransportEnrollmentResponseModel());
          setData(transportEnrollmentDetail.value);
        }
        if (event.status == Status.error) {
          log("Error");
        }
      }).onError((error) {
        exceptionHandlerBinder.showError(error);
      });
    }).execute();
  }

  BehaviorSubject<List<StopDetail>> stopList = BehaviorSubject.seeded([]);

  Future<void> fetchStop({bool forBothWay = false, String? routeType}) async {
    exceptionHandlerBinder.handle(block: () {
      FetchStopsUsecaseParams params = FetchStopsUsecaseParams(
          fetchStopRequest: FetchStopRequest(
        schoolId: enquiryDetailArgs?.schoolId,
        busType: radioButtonBusType.selectedItem == "Non AC" ? "2" : "1",
        routeType: forBothWay
            ? routeType
            : radioButtonOneWayRouteType.selectedItem ==
                    "Pickup Point To School"
                ? "1"
                : "2",
      ));
      showLoader.value = true;
      RequestManager<FetchStopResponseModel>(params,
              createCall: () => fetchStopsUsecase.execute(params: params))
          .asFlow()
          .listen((event) {
        if (event.status == Status.success) {
          showLoader.value = false;
          List<String> routes = [];
          stopList.add(event.data?.data ?? []);
          (event.data?.data ?? []).forEach((element) {
            routes.add(element.stopName ?? '');
          });
          if (!forBothWay) {
            if (radioButtonOneWayRouteType.selectedItem ==
                "Pickup Point To School") {
              dropPointOneWay.text = "School";
              oneWayPickupPoint.add(routes);
            } else {
              pickupPointOneWay.text = "School";
              oneWayDropPoint.add(routes);
            }
          } else {
            if (routeType == "1") {
              oneWayPickupPoint.add(routes);
            } else {
              oneWayDropPoint.add(routes);
            }
          }
        }
        if (event.status == Status.error) {
          print("Error");
          showLoader.value = false;
        }
      }).onError((error) {
        showLoader.value = false;
        exceptionHandlerBinder.showError(error);
      });
    }).execute();
  }

  void setData(TransportEnrollmentResponseModel transportEnrollmentDetail) {
    feeSubType.clear();
    for (var element in (transportEnrollmentDetail.data?.feeSubType ?? [])) {
      feeSubType.add(element.feeSubType ?? '');
    }
  }

  Future<void> calculateFees() async {
    exceptionHandlerBinder.handle(block: () {
      CalculateFeesUsecaseParams params = CalculateFeesUsecaseParams(
          feeCalculationRequest: VasEnrollmentFeeCalculationRequest(
              schoolId: enquiryDetailArgs?.schoolId,
              boardId: enquiryDetailArgs?.boardId,
              gradeId: enquiryDetailArgs?.gradeId,
              courseId: enquiryDetailArgs?.courseId,
              academicYearId: enquiryDetailArgs?.academicYearId,
              feeSubTypeId: feeSubTypeID,
              feeCategoryId: feeCategoryID,
              periodOfServiceId: periodOfServiceID,
              shiftId: enquiryDetailArgs?.shiftId,
              streamId: enquiryDetailArgs?.streamId,
              feeTypeId: FeesTypeIdEnum.transportFees.id,
              feeSubCategoryEnd: selectedDropZone?.zoneName,
              feeSubCategoryStart: selectedPickUpZone?.zoneName));
      showLoader.add(true);
      RequestManager<VasOptionResponse>(params,
              createCall: () => calculateFeesUsecase.execute(params: params))
          .asFlow()
          .listen((event) {
        _calculateTransportFee.add(event);
        if (event.status == Status.loading || event.status == Status.none) {
          showLoader.value = true;
        }
        if (event.status == Status.success) {
          var amount = event.data?.data?["amount"].toString();
          fee.add(amount ?? '0');
          showLoader.add(false);
        }
        if (event.status == Status.error) {
          showLoader.add(false);
          debugPrint("Error");
        }
      }).onError((error) {
        showLoader.add(false);
        exceptionHandlerBinder.showError(error);
      });
    }).execute();
  }

  Future<void> enrollTransport() async {
    exceptionHandlerBinder.handle(block: () {
      AddVasDetailUsecaseParams params = AddVasDetailUsecaseParams(
          vasEnrollmentRequest: VasEnrollmentRequest(
            transport: Transport(
              amount: int.parse(fee.value),
              feeSubTypeId: feeSubTypeID,
              feeCategoryId: feeCategoryID,
              feeTypeId: FeesTypeIdEnum.transportFees.id,
              periodOfServiceId: periodOfServiceID,
              pickupPoint: selectedPickUpZone?.zoneName,
              stopDetails: radioButtonServiceType.selectedItem?.toLowerCase() ==
                      "both way"
                  ? [
                      VasStopDetail(
                          shiftId: selectedPickUpZone?.shiftId,
                          routeId: selectedPickUpZone?.routeId.toString(),
                          stopId: selectedPickUpZone?.id),
                      VasStopDetail(
                          shiftId: selectedDropZone?.shiftId,
                          routeId: selectedDropZone?.routeId.toString(),
                          stopId: selectedDropZone?.id)
                    ]
                  : radioButtonOneWayRouteType.selectedItem ==
                          "Pickup Point To School"
                      ? [
                          VasStopDetail(
                              shiftId: selectedPickUpZone?.shiftId,
                              routeId: selectedPickUpZone?.routeId.toString(),
                              stopId: selectedPickUpZone?.id)
                        ]
                      : [
                          VasStopDetail(
                              shiftId: selectedPickUpZone?.shiftId,
                              routeId: selectedPickUpZone?.routeId.toString(),
                              stopId: selectedPickUpZone?.id)
                        ],
            ),
          ),
          enquiryID: enquiryDetailArgs?.enquiryId ?? '',
          type: "Transport");
      RequestManager<VasOptionResponse>(params,
              createCall: () => addVasDetailUsecase.execute(params: params))
          .asFlow()
          .listen((event) {
        if (event.status == Status.loading || event.status == Status.loading) {
          showLoader.value = true;
        }
        if (event.status == Status.success) {
          Navigator.pop(navigatorKey.currentContext!, true);
          ScaffoldMessenger.of(navigatorKey.currentContext!)
              .showSnackBar(const SnackBar(
                  content: CommonText(
            text: "Transport Details added successfully",
          )));
        } else {
          showLoader.value = false;
          flutterToastErrorPresenter.show(
              event.dealSafeAppError!.throwable,
              navigatorKey.currentContext!,
              event.dealSafeAppError?.error.message ?? '');
        }
      }).onError((error) {
        showLoader.value = false;
        exceptionHandlerBinder.showError(error);
      });
    }).execute();
  }

  BehaviorSubject<List<String>> periodOfService = BehaviorSubject.seeded([]);

  StopDetail? selectedPickUpZone;
  StopDetail? selectedDropZone;

  void filterPeriodService({required String routeType}) {
    if (radioButtonServiceType.selectedItem?.toLowerCase() == "both way") {
      if (routeType == "pickup") {
        selectedPickUpZone = stopList.value.firstWhere((stop) =>
            stop.stopName?.toLowerCase() == feeSubCategoryStart?.toLowerCase());
      } else {
        selectedDropZone = stopList.value.firstWhere((stop) =>
            stop.stopName?.toLowerCase() == feeSubCategoryStart?.toLowerCase());
      }
    } else {}

    final list = transportEnrollmentDetail.value.data?.periodOfService
        ?.where((ps) =>
            (ps.feeSubTypeId == feeSubTypeID) &&
            (ps.feeCategoryId == feeCategoryID) &&
            (ps.feeSubcategory?.toLowerCase() ==
                selectedPickUpZone?.zoneName?.toLowerCase()))
        .toList();

    if (list?.isNotEmpty ?? false) {
      periodOfService.value =
          list!.map((e) => e.periodOfService ?? '').toList();
    }

    //oneWayPickupPoint.value.toSet().toList().firstWhere(test);
  }

  void setPeriodOfService(String value) {
    periodOfServiceID = transportEnrollmentDetail.value.data?.periodOfService
            ?.firstWhere((ps) =>
                ps.periodOfService?.toLowerCase() == value.toLowerCase())
            .periodOfServiceId ??
        0;
  }

  void setFeeSubType(String selectedValue) {
    List<String> options = [];
    (transportEnrollmentDetail.value.data?.feeCategory ?? [])
        .forEach((element) {
      if (element.feeSubType == selectedValue) {
        options.add(element.feeCategory ?? '');
      }
    });
    feeSubTypeID = transportEnrollmentDetail.value.data?.feeSubType
            ?.firstWhereOrNull((element) =>
                element.feeSubType == radioButtonBusType.selectedItem)
            ?.feeSubTypeId ??
        0;
    serviceType.add(options);
  }

  void setFeeCategory(String selectedValue) {
    if ((radioButtonServiceType.selectedItem ?? '').toLowerCase() ==
        "both way") {
      fetchStop(forBothWay: true, routeType: "1");
      fetchStop(forBothWay: true, routeType: "2");
      if (!feeSubCategoryStart.isEmptyOrNull() ||
          !feeSubCategoryEnd.isEmptyOrNull()) {
        feeSubCategoryStart = null;
        feeSubCategoryEnd = null;
      }
    }
    feeCategoryID = transportEnrollmentDetail.value.data?.feeCategory
            ?.firstWhereOrNull((element) =>
                element.feeCategory == radioButtonServiceType.selectedItem)
            ?.feeCategoryId ??
        0;
  }
}  

/**
 * 
 * {"academic_year_id":25,
 * "board_id":3,
 * "course_id":5,
 * "shift_id":1,
 * "stream_id":1,
 * "grade_id":1,
 * "school_id":26,
 * "fee_type_id":15,
 * "fee_sub_type_id":22,
 * "fee_category_id":39,
 * "fee_subcategory_start":"Zone 2",
 * "period_of_service_id":8}
 * 
 */
