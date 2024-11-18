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

@injectable
class KidsClubViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final GetKidsClubEnrollmentDetailUsecase getKidsClubEnrollmentDetailUsecase;
  final CalculateFeesUsecase calculateFeesUsecase;
  final AddVasDetailUsecase addVasDetailUsecase;
  final FlutterToastErrorPresenter flutterToastErrorPresenter;

  KidsClubViewModel(
      this.exceptionHandlerBinder,
      this.getKidsClubEnrollmentDetailUsecase,
      this.calculateFeesUsecase,
      this.addVasDetailUsecase,
      this.flutterToastErrorPresenter);

  BehaviorSubject<KidsClubEnrollmentResponseModel> kidsClubEnrollmentDetail =
      BehaviorSubject();

  final PublishSubject<Resource<KidsClubEnrollmentResponseModel>>
      _fetchKidsClubEnrollmentDetail = PublishSubject();

  final PublishSubject<Resource<VasOptionResponse>> _calculateCafeteriaFee =
      PublishSubject();

  Stream<Resource<VasOptionResponse>> get calculateCafeteriaFee =>
      _calculateCafeteriaFee.stream;

  Stream<Resource<KidsClubEnrollmentResponseModel>>
      get fetchKidsClubEnrollmentDetail =>
          _fetchKidsClubEnrollmentDetail.stream;

  BehaviorSubject<bool> showLoader = BehaviorSubject.seeded(false);
  BehaviorSubject<String> fee = BehaviorSubject.seeded('');
  EnquiryDetailArgs? enquiryDetailArgs;
  List<String> kidsClubOptions = [];
  BehaviorSubject<String> selectedKidsClubType = BehaviorSubject.seeded('');
  BehaviorSubject<List<String>> month = BehaviorSubject.seeded([]);
  BehaviorSubject<String> selectedMonth = BehaviorSubject.seeded('');
  BehaviorSubject<List<String>> periodOfService = BehaviorSubject.seeded([]);
  BehaviorSubject<String> selectedPeriodOfService = BehaviorSubject.seeded('');
  BehaviorSubject<List<String>> cafeteriaOptFor = BehaviorSubject.seeded([]);
  BehaviorSubject<String> selectedCafeteriaOptFor = BehaviorSubject.seeded('');

  int batchID = 0;
  int feeCategoryID = 0;
  int feeSubCategoryID = 0;
  int periodOfServiceID = 0;
  int feeSubTypeID = 0;

  Future<void> getKidsClubDetail() async {
    exceptionHandlerBinder.handle(block: () {
      GetKidsClubEnrollmentDetailUsecaseParams params =
          GetKidsClubEnrollmentDetailUsecaseParams(
        vasDetailRequest: VasDetailRequest(
            schoolId: enquiryDetailArgs?.schoolId,
            boardId: enquiryDetailArgs?.boardId,
            academicYearId: enquiryDetailArgs?.academicYearId,
            courseId: enquiryDetailArgs?.courseId,
            gradeId: enquiryDetailArgs?.gradeId,
            streamId: enquiryDetailArgs?.streamId),
      );
      RequestManager<KidsClubEnrollmentResponseModel>(params,
              createCall: () =>
                  getKidsClubEnrollmentDetailUsecase.execute(params: params))
          .asFlow()
          .listen((event) {
        _fetchKidsClubEnrollmentDetail.add(event);
        if (event.status == Status.success) {
          kidsClubEnrollmentDetail
              .add(event.data ?? KidsClubEnrollmentResponseModel());
          setData(kidsClubEnrollmentDetail.value);
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

  void setData(KidsClubEnrollmentResponseModel data) {
    for (var element in (data.data?.feeSubType ?? [])) {
      kidsClubOptions.add(element.feeSubType ?? '');
    }
  }

  Future<void> calculateFees() async {
    exceptionHandlerBinder.handle(block: () {
      CalculateFeesUsecaseParams params = CalculateFeesUsecaseParams(
          feeCalculationRequest: VasEnrollmentFeeCalculationRequest(
              schoolId: enquiryDetailArgs?.schoolId,
              boardId: enquiryDetailArgs?.boardId,
              gradeId: enquiryDetailArgs?.gradeId,
              feeTypeId: FeesTypeIdEnum.kidsClubFees.id,
              feeSubTypeId: feeSubTypeID,
              feeCategoryId: feeCategoryID,
              periodOfServiceId: periodOfServiceID,
              batchId: batchID,
              courseId: enquiryDetailArgs?.courseId,
              academicYearId: enquiryDetailArgs?.academicYearId,
              feeSubcategoryId: feeSubCategoryID,
              shiftId: enquiryDetailArgs?.shiftId,
              streamId: enquiryDetailArgs?.streamId));
      RequestManager<VasOptionResponse>(params,
              createCall: () => calculateFeesUsecase.execute(params: params))
          .asFlow()
          .listen((event) {
        _calculateCafeteriaFee.add(event);
        if (event.status == Status.loading || event.status == Status.loading) {
          showLoader.value = true;
        }
        if (event.status == Status.success) {
          var amount = event.data?.data?["amount"].toString();
          fee.add(amount ?? '0');
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

  Future<void> enrollKidsClub() async {
    exceptionHandlerBinder.handle(block: () {
      AddVasDetailUsecaseParams params = AddVasDetailUsecaseParams(
          vasEnrollmentRequest: VasEnrollmentRequest(
              kidsClubAmount: int.parse(fee.value),
              kidsClubType: feeSubTypeID,
              kidsClubCafeteriaOptFor: feeCategoryID,
              kidsClubPeriodOfService: periodOfServiceID,
              kidsClubMonth: batchID),
          enquiryID: enquiryDetailArgs?.enquiryId ?? '',
          type: "KidsClub");
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
            text: "Kids Club Details added successfully",
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
