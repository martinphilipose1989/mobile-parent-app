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
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

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
  List<String> psaOptions = [];
  BehaviorSubject<String> selectedPsaSubType = BehaviorSubject.seeded('');

  BehaviorSubject<List<String>> psaCategory = BehaviorSubject.seeded([]);
  BehaviorSubject<String> selectedPsaCategory = BehaviorSubject.seeded('');
  BehaviorSubject<List<String>> psaSubCategory = BehaviorSubject.seeded([]);
  BehaviorSubject<String> selectedPsaSubCategory = BehaviorSubject.seeded('');
  BehaviorSubject<List<String>> periodOfService = BehaviorSubject.seeded([]);
  BehaviorSubject<String> selectedPeriodOfService = BehaviorSubject.seeded('');
  BehaviorSubject<List<String>> psaBatch = BehaviorSubject.seeded([]);
  BehaviorSubject<String> selectedPsaBatch = BehaviorSubject.seeded('');

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
        schoolId: 7,
        boardId: 3,
        academicYearId: 25,
        courseId: 1,
        gradeId: 4,
      ));
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
        exceptionHandlerBinder.showError(error);
      });
    }).execute();
  }

  void setData(PsaEnrollmentDetailResponseModel data) {
    for (var element in (data.data?.feeSubType ?? [])) {
      psaOptions.add(element.feeSubType ?? '');
    }
  }

  // feeCalculationRequest: VasEnrollmentFeeCalculationRequest(
  //   schoolId: 7,
  //   boardId: 3,
  //   courseId: 1,
  //   gradeId: 4,
  //   feeCategoryId: feeCategoryID,
  //   feeSubcategoryId: feeSubCategoryID,
  //   feeSubTypeId: feeSubTypeID,
  //   batchId: batchID,
  //   periodOfServiceId: periodOfServiceID
  // )
  Future<void> calculateFees() async {
    exceptionHandlerBinder.handle(block: () {
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

  Future<void> enrollPsa() async {
    exceptionHandlerBinder.handle(block: () {
      AddVasDetailUsecaseParams params = AddVasDetailUsecaseParams(
          vasEnrollmentRequest: VasEnrollmentRequest(
              psaSubType: feeSubTypeID,
              psaCategory: feeCategoryID,
              psaSubCategory: feeSubCategoryID,
              psaPeriodOfService: periodOfServiceID,
              psaBatch: batchID,
              psaAmount: int.parse(fee.value)),
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
        exceptionHandlerBinder.showError(error);
      });
    }).execute();
  }
}
