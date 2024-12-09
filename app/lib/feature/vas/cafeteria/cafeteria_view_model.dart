import 'package:app/errors/flutter_toast_error_presenter.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/model/resource.dart';
import 'package:app/myapp.dart';
import 'package:app/utils/common_widgets/common_radio_button.dart/common_radio_button.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/enums/enquiry_enum.dart';
import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import 'package:collection/collection.dart';

@injectable
class CafeteriaDetailViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final GetCafeteriaEnrollmentDetailUsecase getCafeteriaEnrollmentDetailUsecase;
  final CalculateFeesUsecase caclculateFeeUsecase;
  final AddVasDetailUsecase addVasDetailUsecase;
  final FlutterToastErrorPresenter flutterToastErrorPresenter;

  CafeteriaDetailViewModel(
      this.exceptionHandlerBinder,
      this.getCafeteriaEnrollmentDetailUsecase,
      this.caclculateFeeUsecase,
      this.addVasDetailUsecase,
      this.flutterToastErrorPresenter);

  EnquiryDetailArgs? enquiryDetailArgs;

  BehaviorSubject<String> fee = BehaviorSubject.seeded('');

  BehaviorSubject<CafeteriaEnrollmentResponseModel> cafeteriaEnrollmentDetail =
      BehaviorSubject();

  final PublishSubject<Resource<CafeteriaEnrollmentResponseModel>>
      _fetchCafeteriaEnrollmentDetail = PublishSubject();

  Stream<Resource<CafeteriaEnrollmentResponseModel>>
      get fetchCafeteriaEnrollmentDetail =>
          _fetchCafeteriaEnrollmentDetail.stream;

  final PublishSubject<Resource<VasOptionResponse>> _calculateCafeteriaFee =
      PublishSubject();

  Stream<Resource<VasOptionResponse>> get calculateCafeteriaFee =>
      _calculateCafeteriaFee.stream;

  ValueNotifier<bool> showLoader = ValueNotifier(false);

  final CommonRadioButton<String> radioButtonFeeOption =
      CommonRadioButton<String>(null);
  final CommonRadioButton<String> radioButtonTerm =
      CommonRadioButton<String>(null);

  int feeSubTypeID = 0;
  int periodOfServiceID = 0;
  int feeCategoryId = 0;

  BehaviorSubject<bool> isEnroll = BehaviorSubject.seeded(false);

  List<String> feeCategoryType = [];
  BehaviorSubject<String> selectedFeeCategoryType = BehaviorSubject.seeded('');

  BehaviorSubject<List<String>> periodOfService = BehaviorSubject.seeded([]);
  BehaviorSubject<String> selectedPeriodOfService = BehaviorSubject.seeded('');

  Future<void> getCafeteriaDetail() async {
    exceptionHandlerBinder.handle(block: () {
      GetCafeteriaEnrollmentDetailUsecaseParams params =
          GetCafeteriaEnrollmentDetailUsecaseParams(
              vasDetailRequest: VasDetailRequest(
                  schoolId: enquiryDetailArgs?.schoolId,
                  boardId: enquiryDetailArgs?.boardId,
                  academicYearId: enquiryDetailArgs?.academicYearId,
                  courseId: enquiryDetailArgs?.courseId,
                  gradeId: enquiryDetailArgs?.gradeId,
                  streamId: enquiryDetailArgs?.streamId));
      RequestManager<CafeteriaEnrollmentResponseModel>(params,
              createCall: () =>
                  getCafeteriaEnrollmentDetailUsecase.execute(params: params))
          .asFlow()
          .listen((event) {
        _fetchCafeteriaEnrollmentDetail.add(event);
        if (event.status == Status.success) {
          cafeteriaEnrollmentDetail
              .add(event.data ?? CafeteriaEnrollmentResponseModel());
          setData(cafeteriaEnrollmentDetail.value);
        }
        if (event.status == Status.error) {
          flutterToastErrorPresenter.show(
              event.dealSafeAppError!.throwable,
              navigatorKey.currentContext!,
              event.dealSafeAppError?.error.message ?? '');
        }
      }).onError((error) {
        exceptionHandlerBinder.showError(error);
      });
    }).execute();
  }

  void setData(CafeteriaEnrollmentResponseModel data) {
    for (var element in (data.data?.feeCategory ?? [])) {
      feeCategoryType.add(element.feeCategory ?? '');
    }
  }

  Future<void> calculateFees() async {
    exceptionHandlerBinder.handle(block: () {
      CalculateFeesUsecaseParams params = CalculateFeesUsecaseParams(
          feeCalculationRequest: VasEnrollmentFeeCalculationRequest(
        schoolId: enquiryDetailArgs?.schoolId,
        boardId: enquiryDetailArgs?.boardId,
        academicYearId: enquiryDetailArgs?.academicYearId,
        courseId: enquiryDetailArgs?.courseId,
        gradeId: enquiryDetailArgs?.gradeId,
        streamId: enquiryDetailArgs?.streamId,
        shiftId: enquiryDetailArgs?.shiftId,
        feeTypeId: FeesTypeIdEnum.cafeteriaFees.id,
        feeCategoryId: feeCategoryId,
        periodOfServiceId: periodOfServiceID,
      ));
      RequestManager<VasOptionResponse>(params,
              createCall: () => caclculateFeeUsecase.execute(params: params))
          .asFlow()
          .listen((event) {
        _calculateCafeteriaFee.add(event);
        if (event.status == Status.loading || event.status == Status.none) {
          showLoader.value = true;
        }
        if (event.status == Status.success) {
          var amount = event.data?.data?["amount"].toString();
          fee.add(amount ?? '0');
          showLoader.value = false;
          isEnroll.value = true;
        }
        if (event.status == Status.error) {
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

  Future<void> enrollCafeteria() async {
    exceptionHandlerBinder.handle(block: () {
      AddVasDetailUsecaseParams params = AddVasDetailUsecaseParams(
          vasEnrollmentRequest: VasEnrollmentRequest(
            cafeteria: VasCategorySelection(
              feeTypeId: FeesTypeIdEnum.cafeteriaFees.id,
              feeCategoryId: feeCategoryId,
              periodOfServiceId: periodOfServiceID,
              amount: int.parse(fee.value),
              //  feeSubTypeId: feeSubTypeID,
            ),
          ),
          enquiryID: enquiryDetailArgs?.enquiryId ?? '',
          type: "Cafeteria");
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
            text: "Cafeteria Details added successfully",
          )));
        }
        if (event.status == Status.error) {
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

  void setPeriodOfService(String value) {
    selectedPeriodOfService.value = value;
    periodOfServiceID = cafeteriaEnrollmentDetail.value.data?.periodOfService
            ?.firstWhereOrNull((e) =>
                e.feeCategory == radioButtonFeeOption.selectedItem &&
                e.periodOfService == value)
            ?.periodOfServiceId ??
        0;
    resetFees();
  }

  void setCategoryType(String value) {
    final category = cafeteriaEnrollmentDetail.value.data?.feeCategory
        ?.firstWhereOrNull((element) => (element.feeCategory ?? '') == value);

    feeCategoryId = category?.feeCategoryId ?? 0;
    feeSubTypeID = category?.feeSubTypeId ?? 0;

    List<String> options = [];
    for (PeriodOfServiceModel element
        in (cafeteriaEnrollmentDetail.value.data?.periodOfService ?? [])) {
      if (element.feeCategory == value) {
        options.add(element.periodOfService ?? '');
      }
    }

    periodOfService.add(options);
    if (radioButtonFeeOption.selectedItem != value) {
      if ((radioButtonTerm.selectedItem ?? '').isNotEmpty) {
        radioButtonTerm.selectItem("");
        periodOfServiceID = 0;
      }
    }
    resetFees();
  }

  void resetFees() {
    if (fee.value.isNotEmpty) {
      fee.value = '';
    }
  }

  void reset() {
    radioButtonFeeOption.selectItem("");
    radioButtonTerm.selectItem("");
    feeSubTypeID = 0;
    periodOfServiceID = 0;
    fee.value = '';
  }
}
