import 'package:app/errors/flutter_toast_error_presenter.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/model/resource.dart';
import 'package:app/myapp.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/request_manager.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:rxdart/subjects.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class AdmissionsDetailsViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final GetAdmissionJourneyUsecase getAdmissionJourneyUsecase;
  final GetEnquiryDetailUseCase getEnquiryDetailUseCase;
  final EnquiryDetailArgs enquiryDetailArgs;
  final FlutterToastErrorPresenter flutterToastErrorPresenter;
  AdmissionsDetailsViewModel(this.exceptionHandlerBinder,this.getAdmissionJourneyUsecase,this.getEnquiryDetailUseCase,this.enquiryDetailArgs,this.flutterToastErrorPresenter){
    getEnquiryDetail(enquiryID: enquiryDetailArgs.enquiryId ?? '');
    getAdmissionJourney(
        enquiryID: enquiryDetailArgs.enquiryId?? '', type: 'admission');
  }
  
  final PublishSubject<Resource<List<AdmissionJourneyDetail>>> admissionJourney = PublishSubject();
  final PublishSubject<Resource<AdmissionJourneyBase>> _fetchAdmissionJourney = PublishSubject();
  Stream<Resource<AdmissionJourneyBase>> get fetchAdmissionJourney => _fetchAdmissionJourney.stream;
  final BehaviorSubject<EnquiryDetail> enquiryDetails = BehaviorSubject.seeded(EnquiryDetail());
  String? enquiryId;

  Future<void> getAdmissionJourney({required String enquiryID,required String type}) async {
    exceptionHandlerBinder.handle(block: () {
      
      GetAdmissionJourneyUsecaseParams params = GetAdmissionJourneyUsecaseParams(
        enquiryID: enquiryID,
        type: type
      );
      admissionJourney.add(Resource.loading());
      RequestManager<AdmissionJourneyBase>(
        params,
        createCall: () => getAdmissionJourneyUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        _fetchAdmissionJourney.add(result);
        if(result.status == Status.success){
          admissionJourney.add(Resource.success(data: result.data?.data??[]));
        }
        if(result.status == Status.error){
          flutterToastErrorPresenter.show(
            result.dealSafeAppError!.throwable, navigatorKey.currentContext!, result.dealSafeAppError?.error.message??'');
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
        enquiryDetails.value = result.data?.data?? EnquiryDetail();
        var admissionStatus = getAdmissionStatus();
        if (admissionStatus == "Approved") {
          if (!menuData
              .any((element) => element["name"] != "Subject Selection")) {
            menuData.add({
              'image': AppImages.subjectSelectionIcon,
              'name': "Subject Selection"
            });
          }
        }
        if(result.status == Status.error){
          flutterToastErrorPresenter.show(
            result.dealSafeAppError!.throwable, navigatorKey.currentContext!, result.dealSafeAppError?.error.message??'');
        }
        // activeStep.add()
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  EnquiryStage? getSchoolVisitStage() {
    return enquiryDetails.value.enquiryStage
        ?.firstWhere(
          (element) => element.stageName?.toLowerCase().contains('school visit') ?? false,
          orElse: () => EnquiryStage(),
        );
  }

  EnquiryStage? getCompetencyStage() {
    return enquiryDetails.value.enquiryStage
        ?.firstWhere(
          (element) => element.stageName?.toLowerCase().contains('competency test') ?? false,
          orElse: () => EnquiryStage(),
        );
  }

  EnquiryStage? getAdmissionStage() {
    return enquiryDetails.value.enquiryStage?.firstWhere(
      (element) => (element.stageName??"") == "Admission Status",
      orElse: () => EnquiryStage(),
    );
  }

  String? getAdmissionStatus(){
    final schoolVisitStage = getAdmissionStage();
    return schoolVisitStage?.status??'';
  }

  bool isDetailView(){
    final schoolVisitStage = getSchoolVisitStage();
    return schoolVisitStage?.status?.toLowerCase() == "in progress";
  }


  bool isDetailViewCompetency(){
    final competencyStage =  getCompetencyStage();
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
    {'image': AppImages.schoolTour, 'name': "School Tour"},
    {'image': AppImages.payments, 'name': "Payments"},
    {'image': AppImages.call, 'name': "Call"},
    {'image': AppImages.email, 'name': "Email"},
    {'image': AppImages.bookTest, 'name': "Book Test"},
    {'image': AppImages.timeline, 'name': "Timeline"},
  ];

  BehaviorSubject<int> showWidget = BehaviorSubject<int>.seeded(0);

  BehaviorSubject<int> activeStep = BehaviorSubject<int>.seeded(2);

  BehaviorSubject<bool> showMenuOnFloatingButton =
      BehaviorSubject<bool>.seeded(false);
}
