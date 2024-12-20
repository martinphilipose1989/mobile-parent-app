import 'package:app/errors/flutter_toast_error_presenter.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/model/resource.dart';
import 'package:app/myapp.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/enums/enquiry_enum.dart';
import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:rxdart/subjects.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import 'package:collection/collection.dart';

@injectable
class SummerCampDetailViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final GetSummerCampEnrollmentDetailUsecase
      getSummerCampEnrollmentDetailUsecase;
  final CalculateFeesUsecase calculateFeesUsecase;
  final AddVasDetailUsecase addVasDetailUsecase;
  final FlutterToastErrorPresenter flutterToastErrorPresenter;

  SummerCampDetailViewModel(
      this.exceptionHandlerBinder,
      this.getSummerCampEnrollmentDetailUsecase,
      this.calculateFeesUsecase,
      this.addVasDetailUsecase,
      this.flutterToastErrorPresenter);

  EnquiryDetailArgs? enquiryDetailArgs;
  BehaviorSubject<String> fee = BehaviorSubject.seeded('');
  BehaviorSubject<bool> showLoader = BehaviorSubject.seeded(false);

  List<String> feeSubType = [];
  BehaviorSubject<String> selectedFeeSubType = BehaviorSubject.seeded('');

  BehaviorSubject<List<String>> feeCategoryType = BehaviorSubject.seeded([]);
  BehaviorSubject<String> selectedFeeCategoryType = BehaviorSubject.seeded('');

  BehaviorSubject<List<String>> feeSubCategoryType = BehaviorSubject.seeded([]);
  BehaviorSubject<String> selectedFeeSubCategoryType =
      BehaviorSubject.seeded('');

  BehaviorSubject<List<String>> periodOfService = BehaviorSubject.seeded([]);
  BehaviorSubject<String> selectedPeriodOfService = BehaviorSubject.seeded('');

  BehaviorSubject<List<String>> batchType = BehaviorSubject.seeded([]);
  BehaviorSubject<String> selectedBatch = BehaviorSubject.seeded('');

  int batchID = 0;
  int feeCategoryID = 0;
  int feeSubCategoryID = 0;
  int periodOfServiceID = 0;
  int feeSubTypeID = 0;

  BehaviorSubject<SummerCampEnrollmentResponseModel>
      summerCampEnrollmentDetail = BehaviorSubject();

  final PublishSubject<Resource<SummerCampEnrollmentResponseModel>>
      _fetchSummerCampEnrollmentDetail = PublishSubject();

  Stream<Resource<SummerCampEnrollmentResponseModel>>
      get fetchSummerCampEnrollmentDetail =>
          _fetchSummerCampEnrollmentDetail.stream;

  final PublishSubject<Resource<VasOptionResponse>> _calculateSummerCampFee =
      PublishSubject();

  Stream<Resource<VasOptionResponse>> get calculateSummerCampFee =>
      _calculateSummerCampFee.stream;

  Future<void> getSummerCampDetail() async {
    exceptionHandlerBinder.handle(block: () {
      GetSummerCampEnrollmentDetailUsecaseParams params =
          GetSummerCampEnrollmentDetailUsecaseParams(
              vasDetailRequest: VasDetailRequest(
        schoolId: enquiryDetailArgs?.schoolId,
        boardId: enquiryDetailArgs?.boardId,
        academicYearId: enquiryDetailArgs?.academicYearId,
        courseId: enquiryDetailArgs?.courseId,
        gradeId: enquiryDetailArgs?.gradeId,
        streamId: enquiryDetailArgs?.streamId,
      ));
      RequestManager<SummerCampEnrollmentResponseModel>(params,
              createCall: () =>
                  getSummerCampEnrollmentDetailUsecase.execute(params: params))
          .asFlow()
          .listen((event) {
        _fetchSummerCampEnrollmentDetail.add(event);
        if (event.status == Status.success) {
          summerCampEnrollmentDetail
              .add(event.data ?? SummerCampEnrollmentResponseModel());

          setData(summerCampEnrollmentDetail.value);
        }
        if (event.status == Status.error) {
          flutterToastErrorPresenter.show(
              event.dealSafeAppError!.throwable,
              navigatorKey.currentContext!,
              event.dealSafeAppError?.error.message ?? '');
        }
      }).onError((error) {
        // exceptionHandlerBinder.showError(error);
      });
    }).execute();
  }

  void setData(SummerCampEnrollmentResponseModel data) {
    for (var element in (data.data?.feeSubType ?? [])) {
      // summerCampType.add(element.feeSubType ?? '');
      feeSubType.add(element.feeSubType ?? '');
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
              feeTypeId: FeesTypeIdEnum.summerCampFees.id,
              feeSubTypeId: feeSubTypeID,
              feeCategoryId: feeCategoryID,
              feeSubcategoryId: feeSubCategoryID,
              periodOfServiceId: periodOfServiceID,
              batchId: batchID));
      showLoader.add(true);
      RequestManager<VasOptionResponse>(params,
              createCall: () => calculateFeesUsecase.execute(params: params))
          .asFlow()
          .listen((event) {
        _calculateSummerCampFee.add(event);
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
          flutterToastErrorPresenter.show(
              event.dealSafeAppError!.throwable,
              navigatorKey.currentContext!,
              event.dealSafeAppError?.error.message ?? '');
        }
      }).onError((error) {
        showLoader.add(false);
        // exceptionHandlerBinder.showError(error);
      });
    }).execute();
  }

  Future<void> enrollSummerCamp() async {
    exceptionHandlerBinder.handle(block: () {
      AddVasDetailUsecaseParams params = AddVasDetailUsecaseParams(
          vasEnrollmentRequest: VasEnrollmentRequest(
            summerCamp: VasCategorySelection(
              amount: int.parse(fee.value),
              batchId: batchID,
              feeSubcategoryId: feeSubCategoryID,
              feeSubTypeId: feeSubTypeID,
              feeTypeId: FeesTypeIdEnum.summerCampFees.id,
              periodOfServiceId: periodOfServiceID,
              feeCategoryId: feeSubCategoryID,
            ),
          ),
          enquiryID: enquiryDetailArgs?.enquiryId ?? '',
          type: "SummerCamp");
      showLoader.value = true;
      RequestManager<VasOptionResponse>(params,
              createCall: () => addVasDetailUsecase.execute(params: params))
          .asFlow()
          .listen((event) {
        if (event.status == Status.loading || event.status == Status.none) {
          showLoader.value = true;
        }
        if (event.status == Status.success) {
          Navigator.pop(navigatorKey.currentContext!, true);
          ScaffoldMessenger.of(navigatorKey.currentContext!)
              .showSnackBar(const SnackBar(
                  content: CommonText(
            text: "Summer Camp Details added successfully",
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
        // exceptionHandlerBinder.showError(error);
      });
    }).execute();
  }

  void setFeeSubTypeId(String value) {
    // Update the selected fee sub-type
    selectedFeeSubType.value = value;

    // Retrieve the feeSubTypeId, defaulting to 0 if not found
    feeSubTypeID = summerCampEnrollmentDetail.value.data?.feeSubType
            ?.firstWhereOrNull((element) => element.feeSubType == value)
            ?.feeSubTypeId ??
        0;

    // Filter and map the fee categories associated with the fee sub-type
    List<String> options = [];
    for (FeeCategoryModel element
        in (summerCampEnrollmentDetail.value.data?.feesCategory ?? [])) {
      if (element.feeSubType == value) {
        options.add(element.feeCategory ?? '');
      }
    }

    // Update summerFeeCategoryType
    feeCategoryType.add(options);
    reset();
  }

  void setCategoryTypeId(value) {
    selectedFeeCategoryType.value = value;
    feeCategoryID = summerCampEnrollmentDetail.value.data?.feesCategory
            ?.firstWhereOrNull((element) => element.feeCategory == value)
            ?.feeCategoryId ??
        0;
    List<String> options = [];
    for (FeeSubCategoryModel element
        in (summerCampEnrollmentDetail.value.data?.feeSubCategory ?? [])) {
      if (element.feeCategory == value &&
          element.feeSubType == selectedFeeSubType.value) {
        options.add(element.feeSubcategory ?? '');
      }
    }

    feeSubCategoryType.add(options);

    resetFees();
  }

  void setSubCategoryTypeId(value) {
    selectedFeeSubCategoryType.value = value;
    feeSubCategoryID = summerCampEnrollmentDetail.value.data?.feeSubCategory
            ?.firstWhereOrNull((element) => element.feeSubcategory == value)
            ?.feeSubcategoryId ??
        0;
    List<String> options = [];
    for (BatchModel element
        in (summerCampEnrollmentDetail.value.data?.batches ?? [])) {
      if (element.feeSubcategory == value &&
          element.feeSubType == selectedFeeSubType.value &&
          element.feeCategory == selectedFeeCategoryType.value) {
        options.add(element.batchName ?? '');
      }
    }

    batchType.add(options);

    resetFees();
  }

  void setBatchId(value) {
    selectedBatch.value = value;
    batchID = summerCampEnrollmentDetail.value.data?.batches
            ?.firstWhereOrNull((element) => element.batchName == value)
            ?.batchId ??
        0;
    List<String> options = [];
    for (BatchModel element
        in (summerCampEnrollmentDetail.value.data?.batches ?? [])) {
      if (element.feeSubcategory == selectedFeeSubCategoryType.value &&
          element.feeSubType == selectedFeeSubType.value &&
          element.feeCategory == selectedFeeCategoryType.value &&
          element.batchName == value) {
        options.add(element.periodOfService ?? '');
      }
    }

    periodOfService.add(options);
    resetFees();
  }

  void setPeriodOfService(String value) {
    selectedPeriodOfService.value = value;
    periodOfServiceID = summerCampEnrollmentDetail.value.data?.periodOfService
            ?.firstWhereOrNull((e) => e.periodOfService == value)
            ?.periodOfServiceId ??
        0;
    resetFees();
  }

  void resetFees() {
    if (fee.value.isNotEmpty) {
      fee.value = '';
    }
  }

  void resetBatch() {
    batchID = 0;
    //  batchType.value.clear();
    selectedBatch.value = '';
  }

  void resetPeriodOfService() {
    // periodOfService.value.clear();
    periodOfServiceID = 0;
    selectedPeriodOfService.value = '';
  }

  reset({bool isResetSubType = false}) {
    if (isResetSubType) {
      feeSubTypeID = 0;
      selectedFeeSubType.value = '';
    }

    feeCategoryID = 0;
    selectedFeeCategoryType.value = '';

    feeSubCategoryType.value.clear();
    selectedFeeSubCategoryType.value = '';
    feeSubCategoryID = 0;

    periodOfServiceID = 0;
    periodOfService.value.clear();
    selectedPeriodOfService.value = '';

    batchType.value.clear();
    selectedBatch.value = '';
    batchID = 0;
    if (fee.value.isNotEmpty) {
      fee.value = '';
    }
  }
}
