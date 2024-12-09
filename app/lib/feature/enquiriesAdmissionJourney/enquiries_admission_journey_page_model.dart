import 'dart:async';
import 'dart:developer';

import 'package:app/errors/flutter_toast_error_presenter.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/feature/payments/payments_pages/payments.dart';
import 'package:app/model/resource.dart';
import 'package:app/myapp.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/enums/enquiry_enum.dart';
import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';

import 'package:flutter_errors/flutter_errors.dart';
import 'package:rxdart/subjects.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class EnquiriesAdmissionsJourneyViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final GetAdmissionJourneyUsecase getAdmissionJourneyUsecase;
  final GetEnquiryDetailUseCase getEnquiryDetailUseCase;
  final EnquiryDetailArgs enquiryDetailArgs;
  final FlutterToastErrorPresenter flutterToastErrorPresenter;
  EnquiriesAdmissionsJourneyViewModel(
    this.exceptionHandlerBinder,
    this.getAdmissionJourneyUsecase,
    this.getEnquiryDetailUseCase,
    this.enquiryDetailArgs,
    this.flutterToastErrorPresenter,
    this.moveToNextStageUsecase,
  ) {
    getEnquiryDetail(enquiryID: enquiryDetailArgs.enquiryId ?? '');
    getAdmissionJourney(
        enquiryID: enquiryDetailArgs.enquiryId ?? '', type: 'enquiry');
  }
  final PublishSubject<Resource<List<AdmissionJourneyDetail>>>
      admissionJourney = PublishSubject();
  final BehaviorSubject<Resource<AdmissionJourneyBase>> _fetchAdmissionJourney =
      BehaviorSubject();
  Stream<Resource<AdmissionJourneyBase>> get fetchAdmissionJourney =>
      _fetchAdmissionJourney.stream;

  final PublishSubject<Resource<EnquiryDetailBase>> _fetchEnquiryDetail =
      PublishSubject();
  Stream<Resource<EnquiryDetailBase>> get fetchEnquiryDetail =>
      _fetchEnquiryDetail.stream;

  final BehaviorSubject<Resource<EnquiryListModel>> _getEnquiryResponse =
      BehaviorSubject();
  final BehaviorSubject<Resource<EnquiryListModel>> _getClosedEnquiryResponse =
      BehaviorSubject();
  int pageNumber = 1, pageSize = 10;
  int closedEnquiryPageNumber = 1, closedEnquiryPageSize = 10;

  bool isNextPage = true;
  bool closedEnquiryNextPage = true;

  final BehaviorSubject<int> noOfCheques = BehaviorSubject<int>.seeded(1);

  Stream<Resource<EnquiryListModel>> get getEnquiryResponseStream =>
      _getEnquiryResponse.stream;
  Stream<Resource<EnquiryListModel>> get getClosedEnquiryResponseStream =>
      _getClosedEnquiryResponse.stream;

  EnquiryDetail? enquiryDetail;
  String? enquiryId;

  Future<void> getAdmissionJourney(
      {required String enquiryID, required String type}) async {
    exceptionHandlerBinder.handle(block: () {
      GetAdmissionJourneyUsecaseParams params =
          GetAdmissionJourneyUsecaseParams(enquiryID: enquiryID, type: type);
      admissionJourney.add(Resource.loading());
      RequestManager<AdmissionJourneyBase>(
        params,
        createCall: () => getAdmissionJourneyUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        _fetchAdmissionJourney.add(result);
        if (result.status == Status.success) {
          if (enquiryDetailArgs.enquiryType != EnquiryTypeEnum.psa.type ||
              enquiryDetailArgs.enquiryType?.toLowerCase() !=
                  EnquiryTypeEnum.kidsClub.type.toLowerCase()) {
            bool isRegistrationFeesCompleted = result.data?.data?.any((stage) =>
                    stage.stage == "Registration Fees" &&
                    stage.status == "Completed") ??
                false;
            // Update the isActive status for "Registration" in menuData
            for (var item in menuData) {
              if (item['name'] == "Registration") {
                item['isActive'] = isRegistrationFeesCompleted ? true : false;
              }
            }
          } else if (enquiryDetailArgs.enquiryType ==
                  EnquiryTypeEnum.psa.type ||
              enquiryDetailArgs.enquiryType?.toLowerCase() ==
                  EnquiryTypeEnum.kidsClub.type.toLowerCase()) {
            for (var item in menuData) {
              if (item['name'] == "Registration" ||
                  item['name'] == "Payments") {
                item['isActive'] = false;
              }
            }
          }

          admissionJourney.add(Resource.success(data: result.data?.data ?? []));
        }
        if (result.status == Status.error) {
          flutterToastErrorPresenter.show(
              result.dealSafeAppError!.throwable,
              navigatorKey.currentContext!,
              result.dealSafeAppError?.error.message ?? '');
        }
        // activeStep.add()
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  Future<void> getEnquiryDetail({required String enquiryID}) async {
    exceptionHandlerBinder.handle(block: () {
      GetEnquiryDetailUseCaseParams params = GetEnquiryDetailUseCaseParams(
        enquiryID: enquiryID,
      );

      RequestManager<EnquiryDetailBase>(
        params,
        createCall: () => getEnquiryDetailUseCase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        _fetchEnquiryDetail.add(result);
        if (result.status == Status.success) {
          enquiryDetail = result.data?.data;
        }
        if (result.status == Status.error) {
          flutterToastErrorPresenter.show(
              result.dealSafeAppError!.throwable,
              navigatorKey.currentContext!,
              result.dealSafeAppError?.error.message ?? '');
        }
        // activeStep.add()
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  EnquiryStage? getSchoolVisitStage() {
    return enquiryDetail?.enquiryStage?.firstWhere(
      (element) =>
          element.stageName?.toLowerCase().contains('school visit') ?? false,
      orElse: () => EnquiryStage(),
    );
  }

  bool isDetailView() {
    final schoolVisitStage = getSchoolVisitStage();
    return schoolVisitStage?.status?.toLowerCase() == "in progress";
  }

  bool isDetailViewCompetency() {
    return enquiryDetail?.enquiryStage
            ?.firstWhere((element) => element.stageName == "Competency test")
            .status
            ?.toLowerCase() ==
        "in Progress";
  }

  final List registrationDetails = [
    {'name': 'Enquiry & Student Details', 'isSelected': false},
    {'name': 'Parent Info', 'isSelected': false},
    {'name': 'Contact Info', 'isSelected': false},
    {'name': 'Medical Details', 'isSelected': false},
    {'name': 'Bank Details', 'isSelected': false},
    {'name': 'Upload Docs', 'isSelected': false}
  ];

  final List stepperData = [
    {'name': 'New Enquiry', 'subtitle': ""},
    {
      'name': 'School Visit',
      'subtitle': "School Visit scheduled on 18th July 10:30 AM"
    },
    {'name': 'Registration', 'subtitle': ""},
  ];

  final List menuData = [
    {
      'id': 0,
      'image': AppImages.registrationIcon,
      'name': "Registration",
      'isActive': true
    },
    {'id': 1, 'image': AppImages.call, 'name': "Call", 'isActive': true},
    {'id': 2, 'image': AppImages.email, 'name': "Email", 'isActive': true},
    {
      'id': 3,
      'image': AppImages.schoolTour,
      'name': "School Tour",
      'isActive': true
    },
    {
      'id': 4,
      'image': AppImages.timeline,
      'name': "Timeline",
      'isActive': true
    },
    {
      'id': 5,
      'image': AppImages.payments,
      'name': "Payments",
      'isActive': true,
    },
  ];

  BehaviorSubject<int> showWidget = BehaviorSubject<int>.seeded(0);

  BehaviorSubject<int> activeStep = BehaviorSubject<int>.seeded(1);

  BehaviorSubject<bool> showMenuOnFloatingButton =
      BehaviorSubject<bool>.seeded(false);

  final MoveToNextStageUsecase moveToNextStageUsecase;

  final BehaviorSubject<Resource<MoveToNextStageEnquiryResponse>>
      moveStageSubject = BehaviorSubject.seeded(Resource.none());

  Stream<Resource<MoveToNextStageEnquiryResponse>> get moveStageStream =>
      moveStageSubject.stream;

  BehaviorSubject<bool> isLoading = BehaviorSubject<bool>.seeded(false);

  void moveToNextStage({String from = "payment"}) {
    isLoading.add(true);
    MoveToNextStageUsecaseParams params = MoveToNextStageUsecaseParams(
        enquiryId: "${enquiryDetailArgs.enquiryId}");
    exceptionHandlerBinder.handle(block: () {
      RequestManager(
        params,
        createCall: () => moveToNextStageUsecase.execute(params: params),
      ).asFlow().listen((data) {
        if (data.status == Status.error) {
          isLoading.add(false);
          moveStageSubject.add(Resource.error(error: data.dealSafeAppError));
        }
        if (data.status == Status.success) {
          isLoading.add(false);
          moveStageSubject.add(Resource.success(data: data.data));

          navigatorKey.currentState?.pushNamed(
            RoutePaths.payments,
            arguments: PaymentArguments(
              phoneNo: '',
              enquiryId: enquiryDetailArgs.enquiryId,
              enquiryNo: enquiryDetailArgs.enquiryNumber,
              studentName: "${enquiryDetailArgs.studentName} ",
            ),
          );
        }
      });
    }).execute();
  }
}
