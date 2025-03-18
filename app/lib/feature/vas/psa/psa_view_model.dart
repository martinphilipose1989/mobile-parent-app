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
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import 'package:collection/collection.dart';

@injectable
class PsaDetailViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final GetPsaEnrollmentDetailUsecase getPsaEnrollmentDetailUsecase;
  final CalculateFeesUsecase calculateFeesUsecase;
  final AddVasDetailUsecase addVasDetailUsecase;
  final FlutterToastErrorPresenter flutterToastErrorPresenter;

  PsaDetailViewModel(
      this.exceptionHandlerBinder,
      this.getPsaEnrollmentDetailUsecase,
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

  final terms = [
    "Term 1",
    "Term 2",
    "Full Year",
  ];

  BehaviorSubject<PsaEnrollmentDetailResponseModel> psaEnrollmentDetail =
      BehaviorSubject();

  final PublishSubject<Resource<PsaEnrollmentDetailResponseModel>>
      _fetchPsaEnrollmentDetail = PublishSubject();

  Stream<Resource<PsaEnrollmentDetailResponseModel>>
      get fetchPsaEnrollmentDetail => _fetchPsaEnrollmentDetail.stream;

  final PublishSubject<Resource<VasOptionResponse>> _calculateCafeteriaFee =
      PublishSubject();

  Stream<Resource<VasOptionResponse>> get calculateCafeteriaFee =>
      _calculateCafeteriaFee.stream;

  Future<void> getPsaDetail() async {
    exceptionHandlerBinder.handle(block: () {
      GetPsaEnrollmentDetailUsecaseParams params =
          GetPsaEnrollmentDetailUsecaseParams(
              vasDetailRequest: VasDetailRequest(
                  schoolId: enquiryDetailArgs?.schoolId,
                  boardId: enquiryDetailArgs?.boardId,
                  academicYearId: enquiryDetailArgs?.academicYearId,
                  courseId: enquiryDetailArgs?.courseId,
                  gradeId: enquiryDetailArgs?.gradeId,
                  streamId: enquiryDetailArgs?.streamId));
      RequestManager<PsaEnrollmentDetailResponseModel>(params,
              createCall: () =>
                  getPsaEnrollmentDetailUsecase.execute(params: params))
          .asFlow()
          .listen((event) {
        _fetchPsaEnrollmentDetail.add(event);
        if (event.status == Status.success) {
          psaEnrollmentDetail
              .add(event.data ?? PsaEnrollmentDetailResponseModel());
          setData(psaEnrollmentDetail.value);
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

  void setData(PsaEnrollmentDetailResponseModel data) {
    for (var element in (data.data?.feeSubType ?? [])) {
      feeSubType.add(element.feeSubType ?? '');
    }
  }

  Future<void> calculateFees() async {
    exceptionHandlerBinder.handle(block: () {
      CalculateFeesUsecaseParams params = CalculateFeesUsecaseParams(
          feeCalculationRequest: VasEnrollmentFeeCalculationRequest(
        schoolId: enquiryDetailArgs?.schoolId,
        boardId: enquiryDetailArgs?.boardId,
        courseId: enquiryDetailArgs?.courseId,
        gradeId: enquiryDetailArgs?.gradeId,
        feeCategoryId: feeCategoryID,
        feeSubcategoryId: feeSubCategoryID,
        feeSubTypeId: feeSubTypeID,
        academicYearId: enquiryDetailArgs?.academicYearId,
        periodOfServiceId: periodOfServiceID,
        batchId: batchID,
        feeTypeId: FeesTypeIdEnum.psaFess.id,
        shiftId: enquiryDetailArgs?.shiftId,
        streamId: enquiryDetailArgs?.streamId,
      ));
      showLoader.value = true;
      RequestManager<VasOptionResponse>(params,
              createCall: () => calculateFeesUsecase.execute(params: params))
          .asFlow()
          .listen((event) {
        if (event.status == Status.loading || event.status == Status.none) {
          showLoader.value = true;
        }
        if (event.status == Status.success) {
          var fees = event.data?.data?["amount"].toString();
          fee.add(fees ?? '0');
          showLoader.value = false;
          scrollToTop();
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

  Future<void> enrollPsa() async {
    exceptionHandlerBinder.handle(block: () {
      AddVasDetailUsecaseParams params = AddVasDetailUsecaseParams(
          vasEnrollmentRequest: VasEnrollmentRequest(
              psa: VasCategorySelection(
                  amount: int.parse(fee.value),
                  batchId: batchID,
                  feeCategoryId: feeCategoryID,
                  feeSubTypeId: feeSubTypeID,
                  periodOfServiceId: periodOfServiceID,
                  feeSubcategoryId: feeSubCategoryID,
                  feeTypeId: FeesTypeIdEnum.psaFess.id)),
          enquiryID: enquiryDetailArgs?.enquiryId ?? '',
          type: "Psa");
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
            text: "PSA Details added successfully",
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
    feeSubTypeID = psaEnrollmentDetail.value.data?.feeSubType
            ?.firstWhereOrNull((element) => element.feeSubType == value)
            ?.feeSubTypeId ??
        0;

    // Filter and map the fee categories associated with the fee sub-type
    List<String> options = [];
    for (FeeCategoryModel element
        in (psaEnrollmentDetail.value.data?.feeCategory ?? [])) {
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
    feeCategoryID = psaEnrollmentDetail.value.data?.feeCategory
            ?.firstWhereOrNull((element) => element.feeCategory == value)
            ?.feeCategoryId ??
        0;
    List<String> options = [];
    for (FeeSubCategoryModel element
        in (psaEnrollmentDetail.value.data?.feeSubCategory ?? [])) {
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
    feeSubCategoryID = psaEnrollmentDetail.value.data?.feeSubCategory
            ?.firstWhereOrNull((element) => element.feeSubcategory == value)
            ?.feeSubcategoryId ??
        0;
    List<String> options = [];
    for (BatchModel element
        in (psaEnrollmentDetail.value.data?.batches ?? [])) {
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
    batchID = psaEnrollmentDetail.value.data?.batches
            ?.firstWhereOrNull((element) => element.batchName == value)
            ?.batchId ??
        0;
    List<String> options = [];
    for (BatchModel element
        in (psaEnrollmentDetail.value.data?.batches ?? [])) {
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
    periodOfServiceID = psaEnrollmentDetail.value.data?.periodOfService
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

  final ScrollController scrollController = ScrollController();

  void scrollToTop() {
    scrollController.animateTo(
      0, // Scroll to position 0 (top)
      duration: Duration(milliseconds: 500), // Duration for smooth scrolling
      curve: Curves.easeInOut, // Animation curve
    );
  }
}
