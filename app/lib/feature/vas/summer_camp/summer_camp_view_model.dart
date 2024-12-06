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
  List<String> summerCampType = [];
  BehaviorSubject<String> selectedSummerCampType = BehaviorSubject.seeded('');
  BehaviorSubject<List<String>> summerCampActivity = BehaviorSubject.seeded([]);
  BehaviorSubject<String> selectedSummerCamptActivity =
      BehaviorSubject.seeded('');
  BehaviorSubject<List<String>> summerCampDuration = BehaviorSubject.seeded([]);
  BehaviorSubject<String> selectedSummerCampDuration =
      BehaviorSubject.seeded('');
  BehaviorSubject<List<String>> summerCampBatch = BehaviorSubject.seeded([]);
  BehaviorSubject<String> selectedSummerCampBatch = BehaviorSubject.seeded('');

  int batchID = 0;
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

  final PublishSubject<Resource<VasOptionResponse>> _calculateCafeteriaFee =
      PublishSubject();

  Stream<Resource<VasOptionResponse>> get calculateCafeteriaFee =>
      _calculateCafeteriaFee.stream;

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
        exceptionHandlerBinder.showError(error);
      });
    }).execute();
  }

  void setData(SummerCampEnrollmentResponseModel data) {
    (data.data?.feeSubType ?? []).forEach((element) {
      summerCampType.add(element.feeSubType ?? '');
    });
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
        feeCategoryId: feeSubCategoryID,
        feeSubcategoryId: 17,
        periodOfServiceId: periodOfServiceID,
      ));
      showLoader.add(true);
      RequestManager<VasOptionResponse>(params,
              createCall: () => calculateFeesUsecase.execute(params: params))
          .asFlow()
          .listen((event) {
        _calculateCafeteriaFee.add(event);
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
        exceptionHandlerBinder.showError(error);
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
        exceptionHandlerBinder.showError(error);
      });
    }).execute();
  }
}
