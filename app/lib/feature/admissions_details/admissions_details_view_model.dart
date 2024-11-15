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
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:rxdart/rxdart.dart';

import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class AdmissionsDetailsViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final GetAdmissionJourneyUsecase getAdmissionJourneyUsecase;
  final GetEnquiryDetailUseCase getEnquiryDetailUseCase;
  final EnquiryDetailArgs enquiryDetailArgs;
  final FlutterToastErrorPresenter flutterToastErrorPresenter;
  final MoveToNextStageUsecase moveToNextStageUsecase;

  AdmissionsDetailsViewModel(
      this.exceptionHandlerBinder,
      this.getAdmissionJourneyUsecase,
      this.getEnquiryDetailUseCase,
      this.enquiryDetailArgs,
      this.flutterToastErrorPresenter,
      this.moveToNextStageUsecase,
      this.makePaymentRequestUsecase) {
    initializeLoadingState();
    getEnquiryDetail(enquiryID: enquiryDetailArgs.enquiryId ?? '');
    getAdmissionJourney(
        enquiryID: enquiryDetailArgs.enquiryId ?? '', type: 'admission');
  }

  final PublishSubject<Resource<List<AdmissionJourneyDetail>>>
      admissionJourney = PublishSubject();
  final PublishSubject<Resource<AdmissionJourneyBase>> _fetchAdmissionJourney =
      PublishSubject();
  Stream<Resource<AdmissionJourneyBase>> get fetchAdmissionJourney =>
      _fetchAdmissionJourney.stream;
  final BehaviorSubject<EnquiryDetail> _enquiryDetails =
      BehaviorSubject.seeded(EnquiryDetail());
  ValueStream<EnquiryDetail> get enquiryDetails => _enquiryDetails.stream;
  final PublishSubject<Resource<EnquiryDetailBase>> _fetchEnquiryDetail =
      PublishSubject();
  Stream<Resource<EnquiryDetailBase>> get fetchEnquiryDetail =>
      _fetchEnquiryDetail.stream;

  String? enquiryId;

  Future<void> getAdmissionJourney(
      {required String enquiryID, required String type}) async {
    exceptionHandlerBinder.handle(block: () {
      GetAdmissionJourneyUsecaseParams params =
          GetAdmissionJourneyUsecaseParams(enquiryID: enquiryID, type: type);
      admissionJourney.add(Resource.loading());
      RequestManager<AdmissionJourneyBase>(
        params,
        createCall: () => getAdmissionJourneyUsecase.execute(params: params),
      ).asFlow().listen((result) {
        _fetchAdmissionJourney.add(result);
        if (result.status == Status.success) {
          admissionJourney.add(Resource.success(data: result.data?.data ?? []));
          // Check if "registration" stage is completed and update "Book Test" status accordingly
          if (enquiryDetailArgs.enquiryType == EnquiryTypeEnum.psa.type ||
              enquiryDetailArgs.enquiryType?.toLowerCase() ==
                  EnquiryTypeEnum.kidsClub.type.toLowerCase()) {
            // Payment will be enabled only when Admission Status is Approved
            if (enquiryDetailArgs.admissionStatus == "Approved") {
              final index = menuData
                  .indexWhere((e) => e['name'].toLowerCase() == "payments");
              if (index != -1) {
                menuData[index]['isActive'] = true;
              } else {
                menuData[index]['isActive'] = false;
              }
            } else {
              final index = menuData
                  .indexWhere((e) => e['name'].toLowerCase() == "payments");
              if (index != -1) {
                menuData[index]['isActive'] = false;
              }
            }
            final index = menuData
                .indexWhere((e) => e['name'].toLowerCase() == "book test");
            if (index != -1) {
              menuData[index]['isActive'] = false;
            }
          } else {
            final currentStepForJourney = result.data?.data
                    ?.firstWhere(
                        (e) =>
                            e.status?.toLowerCase() == "completed" &&
                            e.stage?.toLowerCase() == "registration",
                        orElse: () => AdmissionJourneyDetail())
                    .status ??
                '';

            if (currentStepForJourney.toLowerCase() == "completed") {
              // Find the "Book Test" item and set isActive to true
              final index = menuData
                  .indexWhere((e) => e['name'].toLowerCase() == "book test");
              if (index != -1) {
                menuData[index]['isActive'] = true;
              } else {}
            }
          }
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
      admissionJourney.add(Resource.loading());
      RequestManager<EnquiryDetailBase>(
        params,
        createCall: () => getEnquiryDetailUseCase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        _fetchEnquiryDetail.add(result);
        _enquiryDetails.value = result.data?.data ?? EnquiryDetail();
        var admissionStatus = getAdmissionStatus();

        if (admissionStatus == "Approved") {
          if (enquiryDetailArgs.enquiryType ==
              EnquiryTypeEnum.newAdmission.type) {
            final index = menuData.indexWhere((menu) =>
                menu['name'].toString().toLowerCase() == "subject selection");
            menuData[index]['isActive'] = true;
            enquiryDetailArgs.admissionStatus = admissionStatus;
          } else if (enquiryDetailArgs.enquiryType ==
                  EnquiryTypeEnum.psa.type ||
              enquiryDetailArgs.enquiryType == EnquiryTypeEnum.kidsClub.type) {
            final index = menuData.indexWhere(
                (menu) => menu['name'].toString().toLowerCase() == "vas");
            menuData[index]['isActive'] = true;
          }
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
    return _enquiryDetails.value.enquiryStage?.firstWhere(
      (element) =>
          element.stageName?.toLowerCase().contains('school visit') ?? false,
      orElse: () => EnquiryStage(),
    );
  }

  EnquiryStage? getCompetencyStage() {
    return _enquiryDetails.value.enquiryStage?.firstWhere(
      (element) =>
          element.stageName?.toLowerCase().contains('competency test') ?? false,
      orElse: () => EnquiryStage(),
    );
  }

  EnquiryStage? getAdmissionStage() {
    return _enquiryDetails.value.enquiryStage?.firstWhere(
      (element) => (element.stageName ?? "") == "Admission Status",
      orElse: () => EnquiryStage(),
    );
  }

  String? getAdmissionStatus() {
    final schoolVisitStage = getAdmissionStage();
    return schoolVisitStage?.status ?? '';
  }

  bool isDetailView() {
    final schoolVisitStage = getSchoolVisitStage();
    return schoolVisitStage?.status?.toLowerCase() == "in progress";
  }

  bool isDetailViewCompetency() {
    final competencyStage = getCompetencyStage();
    return competencyStage?.status != "Open";
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
    {'name': 'Registration Fees', 'subtitle': ""},
    {'name': 'Apti/Interaction', 'subtitle': ""},
    {'name': 'Admission Status', 'subtitle': ""},
    {'name': 'Payment', 'subtitle': ""},
    {'name': 'Admitted/Provisional Admission', 'subtitle': ""},
  ];

  final List menuData = [
    {
      'id': 0,
      'image': AppImages.schoolTour,
      'name': "School Tour",
      'isActive': true,
      'key': "schooltour"
    },
    {
      'id': 1,
      'image': AppImages.payments,
      'name': "Payments",
      'isActive': true,
      'key': 'payment'
    },
    {
      'id': 2,
      'image': AppImages.call,
      'name': "Call",
      'isActive': true,
      'key': 'call'
    },
    {
      'id': 3,
      'image': AppImages.email,
      'name': "Email",
      'isActive': true,
      'key': 'email',
    },
    {
      'id': 4,
      'image': AppImages.bookTest,
      'name': "Book Test",
      'isActive': true,
      'key': 'competency'
    },
    {
      'id': 5,
      'image': AppImages.timeline,
      'name': "Timeline",
      'isActive': true,
      'key': 'timeline'
    },
    {
      'id': 6,
      'image': AppImages.subjectSelectionIcon,
      'name': "Subject Selection",
      'isActive': false,
      'key': 'registration'
    },
    {
      'id': 7,
      'image': AppImages.subjectSelectionIcon,
      'name': "VAS",
      'isActive': false,
      'key': 'registration'
    },
  ];

  BehaviorSubject<int> showWidget = BehaviorSubject<int>.seeded(0);

  BehaviorSubject<int> activeStep = BehaviorSubject<int>.seeded(2);

  BehaviorSubject<bool> showMenuOnFloatingButton =
      BehaviorSubject<bool>.seeded(false);

  final BehaviorSubject<Resource<MoveToNextStageEnquiryResponse>>
      moveStageSubject = BehaviorSubject.seeded(Resource.none());

  Stream<Resource<MoveToNextStageEnquiryResponse>> get moveStageStream =>
      moveStageSubject.stream;

  final MakePaymentRequestUsecase makePaymentRequestUsecase;

  final BehaviorSubject<Resource<VasOptionResponse>> vasSubject =
      BehaviorSubject.seeded(Resource.none());

  final BehaviorSubject<Resource<bool>> isLoadingSubject =
      BehaviorSubject<Resource<bool>>.seeded(Resource.success(data: false));

  void initializeLoadingState() {
    Rx.combineLatest2<Resource<VasOptionResponse>,
        Resource<MoveToNextStageEnquiryResponse>, Resource<bool>>(
      vasSubject.stream,
      moveStageSubject.stream,
      (vasResource, moveStageResource) {
        // Return a loading Resource if either of the subjects is loading
        if (vasResource.status == Status.loading ||
            moveStageResource.status == Status.loading) {
          return Resource.loading();
        } else if (vasResource.status == Status.error ||
            moveStageResource.status == Status.error) {
          // If either subject has an error, propagate the error
          return Resource.error(
              error: vasResource.dealSafeAppError ??
                  moveStageResource.dealSafeAppError);
        } else {
          // Neither is loading and there is no error, so loading is complete
          return Resource.success(data: false);
        }
      },
    ).listen((isLoading) {
      isLoadingSubject.add(isLoading); // Update the combined loading state
    });
  }

  void makePaymentRequest() {
    MakePaymentRequestUsecaseParams params = MakePaymentRequestUsecaseParams(
        enquiryID: "${enquiryDetailArgs.enquiryId}");
    vasSubject.add(Resource.loading());
    exceptionHandlerBinder.handle(
      block: () {
        RequestManager(params,
                createCall: () =>
                    makePaymentRequestUsecase.execute(params: params))
            .asFlow()
            .listen((data) {
          if (data.status == Status.error) {
            exceptionHandlerBinder.showError(data.dealSafeAppError!);
            vasSubject.add(Resource.error(error: data.dealSafeAppError));
          }
          if (data.status == Status.success) {
            vasSubject.add(Resource.success(data: data.data));
            moveToNextStage();
          }
        });
      },
    ).execute();
  }

  void moveToNextStage({String from = "payment"}) {
    log("message ${enquiryDetails.value.currentStage}");
    moveStageSubject.add(Resource.loading());
    MoveToNextStageUsecaseParams params = MoveToNextStageUsecaseParams(
      enquiryId: "${enquiryDetailArgs.enquiryId}",
      currentStage: enquiryDetails.value.currentStage,
    );
    exceptionHandlerBinder.handle(block: () {
      RequestManager(
        params,
        createCall: () => moveToNextStageUsecase.execute(params: params),
      ).asFlow().listen((data) {
        if (data.status == Status.error) {
          exceptionHandlerBinder.showError(data.dealSafeAppError!);
          moveStageSubject.add(Resource.error(error: data.dealSafeAppError));
        }
        if (data.status == Status.success) {
          moveStageSubject.add(Resource.success(data: data.data));

          navigatorKey.currentState
              ?.pushNamed(
            RoutePaths.payments,
            arguments: PaymentArguments(
              phoneNo: '',
              enquiryId: enquiryDetailArgs.enquiryId,
              enquiryNo: enquiryDetailArgs.enquiryNumber,
              studentName: "${enquiryDetailArgs.studentName} ",
            ),
          )
              .then((_) {
            getEnquiryDetail(enquiryID: enquiryDetailArgs.enquiryId ?? '');
            getAdmissionJourney(
                enquiryID: enquiryDetailArgs.enquiryId ?? '',
                type: 'admission');
          });
        }
      });
    }).execute();
  }
}
