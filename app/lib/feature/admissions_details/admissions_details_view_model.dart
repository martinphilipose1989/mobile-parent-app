import 'package:app/model/resource.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:rxdart/subjects.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class AdmissionsDetailsViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final GetAdmissionJourneyUsecase getAdmissionJourneyUsecase;
  final GetEnquiryDetailUseCase getEnquiryDetailUseCase;
  AdmissionsDetailsViewModel(this.exceptionHandlerBinder,this.getAdmissionJourneyUsecase,this.getEnquiryDetailUseCase);
  
  final PublishSubject<Resource<List<AdmissionJourneyDetail>>> admissionJourney = PublishSubject();
  EnquiryDetail? enquiryDetail;

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
        admissionJourney.add(Resource.success(data: result.data?.data??[]));
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
        enquiryDetail = result.data?.data;
        // activeStep.add()
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  bool isDetailView(){
    return enquiryDetail?.enquiryStage?.firstWhere((element)=>element.stageName == "School visit").status == "In Progress";
  }


  bool isDetailViewCompetency(){
    return enquiryDetail?.enquiryStage?.firstWhere((element)=>element.stageName == "Competency test").status == "In Progress";
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
