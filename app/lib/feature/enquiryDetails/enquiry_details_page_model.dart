import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/model/resource.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class EnquiriesDetailsPageModel extends BasePageViewModel {
  GetNewAdmissionDetailUseCase getNewAdmissionDetailUseCase;
  GetIvtDetailUsecase getIvtDetailUsecase;
  GetPsaDetailUsecase getPsaDetailUsecase;
  GetEnquiryDetailUseCase getEnquiryDetailUseCase;
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  EnquiriesDetailsPageModel(this.exceptionHandlerBinder,this.getNewAdmissionDetailUseCase,this.getIvtDetailUsecase,this.getPsaDetailUsecase,this.getEnquiryDetailUseCase);
  late TabController tabController;
  bool visivilty = false;
  final BehaviorSubject<int> selectedValue = BehaviorSubject<int>.seeded(0);
  BehaviorSubject<NewAdmissionDetail> ? newAdmissionDetails = BehaviorSubject<NewAdmissionDetail>.seeded(NewAdmissionDetail());
  BehaviorSubject<IVTDetail>? ivtDetails = BehaviorSubject<IVTDetail>.seeded(IVTDetail()); 
  BehaviorSubject<PSADetail>? psaDetails = BehaviorSubject<PSADetail>.seeded(PSADetail());
  PublishSubject<Resource<EnquiryDetail>> enquiryDetail= PublishSubject();
  BehaviorSubject<int> showWidget = BehaviorSubject<int>.seeded(0);
  
  //New Admission Details
   TextEditingController enquiryNumberController = TextEditingController();
   TextEditingController enquiryTypeController = TextEditingController();
   TextEditingController studentFirstNameController = TextEditingController();
   TextEditingController studentLastNameController = TextEditingController();
   TextEditingController dobController = TextEditingController()  ;
   TextEditingController existingSchoolNameController = TextEditingController();
   TextEditingController globalIdController = TextEditingController();
 //PSA-specific controllers
   TextEditingController psaSubTypeController = TextEditingController();
   TextEditingController psaCategoryController = TextEditingController();
   TextEditingController psaSubCategoryController = TextEditingController();
    TextEditingController periodOfServiceController = TextEditingController();
   TextEditingController psaBatchController = TextEditingController();
 //IVT-specific controllers
   TextEditingController ivtBoardController = TextEditingController();
  TextEditingController ivtCourseController = TextEditingController();
   TextEditingController ivtStreamController = TextEditingController();
   TextEditingController ivtShiftController = TextEditingController();

  BehaviorSubject<bool> showMenuOnFloatingButton =
      BehaviorSubject<bool>.seeded(false);

  BehaviorSubject<bool> editRegistrationDetails =
      BehaviorSubject<bool>.seeded(false);

  final List menuData = [
    {'image': AppImages.registrationIcon, 'name': "Registration"},
    {'image': AppImages.call, 'name': "Call"},
    {'image': AppImages.email, 'name': "Email"},
    {'image': AppImages.editDetails, 'name': "Edit Details"},
    {'image': AppImages.schoolTour, 'name': "School Tour"},
    {'image': AppImages.timeline, 'name': "Timeline"},
  ];
  
  EnquiryDetailArgs? enquiryDetailArgs;

  final BehaviorSubject<bool> selectedGradeType =
      BehaviorSubject<bool>.seeded(false);

  final BehaviorSubject<bool> selectedSchoolLocationType =
      BehaviorSubject<bool>.seeded(false);

  final BehaviorSubject<bool> selectedExistingSchoolGrade =
      BehaviorSubject<bool>.seeded(false);
  final BehaviorSubject<bool> selectedExistingSchoolBoard =
      BehaviorSubject<bool>.seeded(false);
  final BehaviorSubject<bool> selectedParentType =
      BehaviorSubject<bool>.seeded(false);

  final BehaviorSubject<String> selectedGradeSubject = BehaviorSubject<String>();
  final BehaviorSubject<String> selectedSchoolLocationSubject = BehaviorSubject<String>();
  final BehaviorSubject<String> selectedExistingSchoolGradeSubject = BehaviorSubject<String>();
  final BehaviorSubject<String> selectedExistingSchoolBoardSubject = BehaviorSubject<String>();
  final BehaviorSubject<String> selectedParentTypeSubject = BehaviorSubject<String>();
  final BehaviorSubject<String> selectedGenderSubject = BehaviorSubject<String>();
  
  final BehaviorSubject<bool> selectedGenerType = BehaviorSubject<bool>.seeded(false);
  final List<String> schoolLocationTypes = [
    'Location 1',
    'Location 2',
    'Location 3'
  ];

  final List<String> parentType = ["Mother","Father"];

  final List<String> existingSchoolGrade = ['Grade I', 'Grade II', 'Grade III'];
  final List<String> existingSchoolBoard = ['CBSC', 'International'];
  final List<String> gradeTypes = ['Grade I', 'Grade II', 'Grade III'];

  final List<String> gender = ["Male","Female","Other"];

  Future<void> getNewAdmissionDetails({required String enquiryID,bool isEdit = false}) async {
    exceptionHandlerBinder.handle(block: () {
     
      GetNewAdmissionDetailUseCaseParams params = GetNewAdmissionDetailUseCaseParams(
        enquiryID: "66ba1b522c07e8497dde3061",
      );
      
      RequestManager<NewAdmissionBase>(
        params,
        createCall: () => getNewAdmissionDetailUseCase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        newAdmissionDetails?.add(result.data?.data?? NewAdmissionDetail());
        if(isEdit){
          addNewAdmissionDetails(result.data?.data?? NewAdmissionDetail(),enquiryDetailArgs??EnquiryDetailArgs());
        }
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  Future<void> getIvtDetails({required String enquiryID}) async {
    exceptionHandlerBinder.handle(block: () {
     
      GetIvtDetailUsecaseParams params = GetIvtDetailUsecaseParams(
        enquiryID: "66ba1b522c07e8497dde3061",
      );
      
      RequestManager<IVTBase>(
        params,
        createCall: () => getIvtDetailUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        ivtDetails?.add(result.data?.data?? IVTDetail());
        // activeStep.add()
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  Future<void> getPsaDetails({required String enquiryID}) async {
    exceptionHandlerBinder.handle(block: () {
     
      GetPsaDetailUsecaseParams params = GetPsaDetailUsecaseParams(
        enquiryID: "66ba1b522c07e8497dde3061",
      );
      
      RequestManager<PsaResponse>(
        params,
        createCall: () => getPsaDetailUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        psaDetails?.add(result.data?.data?? PSADetail());
        // activeStep.add()
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  Future<void> getEnquiryDetail({required String enquiryID}) async {
    exceptionHandlerBinder.handle(block: () {
      
      GetEnquiryDetailUseCaseParams params = GetEnquiryDetailUseCaseParams(
        enquiryID: "66ba1b522c07e8497dde3061",
      );
      enquiryDetail.add(Resource.loading());
      RequestManager<EnquiryDetailBase>(
        params,
        createCall: () => getEnquiryDetailUseCase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        enquiryDetail.add(Resource.success(data: result.data?.data?? EnquiryDetail()));
        // activeStep.add()
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  addNewAdmissionDetails(NewAdmissionDetail detail,EnquiryDetailArgs enquiryDetail){
    enquiryNumberController.text = enquiryDetail.enquiryNumber ?? '';
    enquiryTypeController.text = enquiryDetail.enquiryType ?? '';
    studentFirstNameController.text = detail.studentDetails?.firstName ?? '';
    studentLastNameController.text = detail.studentDetails?.lastName ?? '';
    dobController.text = detail.studentDetails?.dob ?? ''; 
    existingSchoolNameController.text = detail.existingSchoolDetails?.name?.value?? '';
    selectedGradeSubject.add(detail.studentDetails?.grade?.value?? '');
    selectedSchoolLocationSubject.add(detail.schoolLocation?.value?? '');
    selectedExistingSchoolGradeSubject.add(detail.existingSchoolDetails?.grade?.value?? '');
    selectedExistingSchoolBoardSubject.add(detail.existingSchoolDetails?.board?.value?? '');
    selectedParentTypeSubject.add("Father");
    selectedGenderSubject.add(detail.studentDetails?.gender?.value?? '');
    // globalIdController.text = detail.studentDetails?.globalId ?? '';
  }

  addPsaDetails(PSADetail detail){
    psaSubTypeController.text = detail.psaSubType?.value?? '';
    psaCategoryController.text = detail.psaCategory?.value?? '';
    psaSubCategoryController.text = detail.psaSubCategory?.value?? '';
    periodOfServiceController.text = detail.psaPeriodOfService?.value?? '';
    psaBatchController.text = detail.psaBatch?.value?? '';
  }

  addIvtDetails(IVTDetail detail){
    ivtBoardController.text = detail.board?.value?? '';
    ivtCourseController.text = detail.course?.value?? '';
    ivtStreamController.text = detail.stream?.value?? '';
    ivtShiftController.text = detail.shift?.value?? '';
  }
}
