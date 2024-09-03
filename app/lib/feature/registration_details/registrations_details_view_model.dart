import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_radio_button.dart/common_radio_button.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../model/resource.dart';
import '../../utils/common_widgets/common_popups.dart';
import '../../utils/request_manager.dart';

@injectable
class RegistrationsDetailsViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final GetRegistrationDetailUsecase getRegistrationDetailUsecase;
  final GetNewAdmissionDetailUseCase getNewAdmissionDetailUseCase;
  final UpdateParentDetailsUsecase updateParentDetailsUsecase;
  final UpdateMedicalDetailsUsecase updateMedicalDetailsUsecase;
  final UpdateContactDetailsUsecase updateContactDetailsUsecase;
  final UpdateBankDetailsUsecase updateBankDetailsUsecase;
  final GetIvtDetailUsecase getIvtDetailUsecase;
  final GetPsaDetailUsecase getPsaDetailUsecase;
  final GetEnquiryDetailUseCase getEnquiryDetailUseCase;
  final UpdatePsaDetailUsecase updatePsaDetailUsecase;
  final UpdateIvtDetailUsecase updateIvtDetailUsecase;
  final UpdateNewAdmissionUsecase updateNewAdmissionUsecase;
  final GetMdmAttributeUsecase getMdmAttributeUsecase;
  final DownloadEnquiryDocumentUsecase downloadEnquiryDocumentUsecase;
  final UploadEnquiryDocumentUsecase uploadEnquiryDocumentUsecase;
  final DeleteEnquiryDocumentUsecase deleteEnquiryDocumentUsecase;
  final DownloadFileUsecase downloadFileUsecase;

  RegistrationsDetailsViewModel(this.exceptionHandlerBinder,
      this.getRegistrationDetailUsecase, this.getNewAdmissionDetailUseCase,
      this.getIvtDetailUsecase, this.getPsaDetailUsecase,this.getEnquiryDetailUseCase,
      this.updateParentDetailsUsecase, this.updateMedicalDetailsUsecase,this.updateBankDetailsUsecase,
      this.updateContactDetailsUsecase,this.updatePsaDetailUsecase,this.updateIvtDetailUsecase,
      this.updateNewAdmissionUsecase,this.getMdmAttributeUsecase,this.downloadEnquiryDocumentUsecase,
      this.uploadEnquiryDocumentUsecase,this.deleteEnquiryDocumentUsecase,this.downloadFileUsecase) ;

  final List registrationDetails = [
    {'name': 'Enquiry & Student Details', 'isSelected': false, 'infoType': ''},
    {'name': 'Parent Info', 'isSelected': false, 'infoType': 'ParentInfo'},
    {'name': 'Contact Info', 'isSelected': false, 'infoType': 'ContactInfo'},
    {'name': 'Medical Details', 'isSelected': false, 'infoType': 'MedicalInfo'},
    {'name': 'Bank Details', 'isSelected': false, 'infoType': 'BankInfo'},
    {'name': 'Upload Docs', 'isSelected': false, 'infoType': ''}
  ];

  final List menuData = [
    {'image': AppImages.schoolTour, 'name': "School Tour"},
    {'image': AppImages.payments, 'name': "Payments"},
    {'image': AppImages.call, 'name': "Call"},
    {'image': AppImages.email, 'name': "Email"},
    {'image': AppImages.editDetails, 'name': "Edit Details"},
    {'image': AppImages.bookTest, 'name': "Book Test"},
    {'image': AppImages.timeline, 'name': "Timeline"},
  ];

  final List<String> occupation=['Government','Private','Business'];
  final List<String> area=['Metro','Urban','SubUrban','Town'];
  // final List<String> country=['India','Pakistan','Nepal','Bangladesh'];
  // final List<String> state=['Maharashtra','Gujarat','Madhya Pradesh'];
  // final List<String> city=['Mumbai, Ahmedabad, Nagpur'];
  final List<String> grade = ['A','B','C','D'];
  final List<String> contactRelationshipOptions = [
    'Father',
    'Mother',
    'Guardian',
    'Other'
  ];
  final List<String> pinCodeOptions = [
    '400001',
    '560001',
    '600001',
  ];

  BuildContext? context;

  final studenFormKey = GlobalKey<FormState>();
  final enquiryFormKey = GlobalKey<FormState>();
  final ivtFormKey = GlobalKey<FormState>();
  final psaFormKey = GlobalKey<FormState>();
  final parentInfoFormKey = GlobalKey<FormState>();
  final contactInfoFormKey = GlobalKey<FormState>();
  final medicalDetailsFormKey = GlobalKey<FormState>();
  final bankDetailsFormKey = GlobalKey<FormState>();
  final upiFormKey = GlobalKey<FormState>();

  EnquiryDetailArgs? enquiryDetailArgs;
  EnquiryDetail? enquiryDetails;
  BehaviorSubject<int> showWidget = BehaviorSubject<int>.seeded(0);
  final BehaviorSubject<bool> isLoading = BehaviorSubject<bool>.seeded(false);
  final PublishSubject<Resource<ParentInfo>> parentDetail =
  PublishSubject();
  final PublishSubject<Resource<ContactDetails>> contactDetail =
  PublishSubject();
  final PublishSubject<Resource<MedicalDetails>> medicalDetail =
  PublishSubject();
  final PublishSubject<Resource<BankDetails>> bankDetail = PublishSubject();

  final PublishSubject<Resource<NewAdmissionBase>> _newAdmissionDetails = PublishSubject();
  Stream<Resource<NewAdmissionBase>> get newAdmissionDetails => _newAdmissionDetails.stream;
  PublishSubject<Resource<IVTDetail>> ivtDetails = PublishSubject();
  PublishSubject<Resource<PSADetail>> psaDetails = PublishSubject();
  final PublishSubject<Resource<EnquiryDetailBase>> _enquiryDetail = PublishSubject();
  Stream<Resource<EnquiryDetailBase>> get enquiryDetail => _enquiryDetail.stream;
  BehaviorSubject<NewAdmissionDetail> ? newAdmissionDetailSubject = BehaviorSubject<NewAdmissionDetail>.seeded(NewAdmissionDetail());
  BehaviorSubject<IVTDetail>? ivtDetailSubject = BehaviorSubject<IVTDetail>.seeded(IVTDetail()); 
  BehaviorSubject<PSADetail>? psaDetailSubject = BehaviorSubject<PSADetail>.seeded(PSADetail());
  PublishSubject<Resource<EnquiryFileUploadBase>> uploadEnquiryFile = PublishSubject();
  PublishSubject<Resource<DeleteEnquiryFileBase>> deleteEnquiryFile = PublishSubject();
  PublishSubject<Resource<DownloadEnquiryFileBase>> getEnquiryFile = PublishSubject();

  ParentInfo? parentInfo;
  ContactDetails? contactDetails;
  MedicalDetails? medicalDetails;
  BankDetails? bankDetails;

//fatherEditController
  TextEditingController fatherFirstNameController = TextEditingController();
  TextEditingController fatherLastNameController = TextEditingController();
  TextEditingController fatherAdharCardController = TextEditingController();
  TextEditingController fatherPanCardController = TextEditingController();
  TextEditingController qualificationController = TextEditingController();

  TextEditingController organizationNameController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController officeAddressController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController fatherEmailController = TextEditingController();
  TextEditingController fatherMobileController = TextEditingController();
  String? fatherOccupation;
  String? fatherArea;
  CommonDataClass? selectedFatherCountryEntity;
  CommonDataClass? selectedFatherStateEntity;
  CommonDataClass? selectedFatherCityEntity;


//motherEditController
  TextEditingController motherFirstNameController = TextEditingController();
  TextEditingController motherLastNameController = TextEditingController();
  TextEditingController motherAdharCardController = TextEditingController();
  TextEditingController motherPanCardController = TextEditingController();
  TextEditingController motherQualificationController = TextEditingController();
  TextEditingController motherOrganizationNameController = TextEditingController();
  TextEditingController motherDesignationController = TextEditingController();
  TextEditingController motherOfficeAddressController = TextEditingController();
  TextEditingController motherPinCodeController = TextEditingController();
  TextEditingController motherEmailController = TextEditingController();
  TextEditingController motherMobileController = TextEditingController();
  String? motherOccupation;
  String? motherArea;
  CommonDataClass? selectedMotherCountryEntity;
  CommonDataClass? selectedMotherStateEntity;
  CommonDataClass? selectedMotherCityEntity;

//guardianEditDetails
  TextEditingController guardianFirstNameController = TextEditingController();
  TextEditingController guardianLastNameController = TextEditingController();
  TextEditingController guardianAdharCardController = TextEditingController();
  TextEditingController guardianPanCardController = TextEditingController();
  TextEditingController guardianQualificationController = TextEditingController();
  TextEditingController guardianOrganizationNameController = TextEditingController();
  TextEditingController guardianDesignationController = TextEditingController();
  TextEditingController guardianOfficeAddressController = TextEditingController();
  TextEditingController guardianPinCodeController = TextEditingController();
  TextEditingController guardianEmailController = TextEditingController();
  TextEditingController guardianMobileController = TextEditingController();
  String? guardianOccupation;
  String? guardianArea;
  CommonDataClass? selectedGuardianCountryEntity;
  CommonDataClass? selectedGuardianStateEntity;
  CommonDataClass? selectedGuardianCityEntity;

//siblingsEditDetails
  TextEditingController siblingFirstNameController = TextEditingController();
  TextEditingController siblingLastNameController = TextEditingController();
  TextEditingController siblingsEnrollmentController = TextEditingController();
  TextEditingController siblingsSchoolController = TextEditingController();
  String? siblingGender;
  String? siblingGrade;

  //ResidentialDetails
  TextEditingController houseOrBuildingController= TextEditingController();
  TextEditingController streetNameController = TextEditingController();
  TextEditingController landMarkController =TextEditingController();
  TextEditingController residentialPinCodeController = TextEditingController();
  TextEditingController parentEmailIdController1 = TextEditingController();
  TextEditingController parentMobileNumberController1 = TextEditingController();
  TextEditingController parentEmailIdController2 = TextEditingController();
  TextEditingController parentMobileNumberController2 = TextEditingController();
  String? contactParentType1;
  String? contactParentType2;
  String? emergencyContact;
  CommonDataClass? residentialCountry;
  CommonDataClass? residentialState;
  CommonDataClass? residentialCity;
  String? residentialPinCode;
  BehaviorSubject<String> selectedResidentialCity = BehaviorSubject.seeded('');
  BehaviorSubject<String> selectedResidentialState = BehaviorSubject.seeded('');
  BehaviorSubject<String> selectedResidentialCountry = BehaviorSubject.seeded('');

  //YearOfHospitalization
  TextEditingController yearOfHospitalizationController=TextEditingController();
  TextEditingController reasonOfHospitalizationController=TextEditingController();
  TextEditingController specificDisabilityController=TextEditingController();
  TextEditingController specifyMedicalHistoryController=TextEditingController();
  TextEditingController specifyAllergiesController=TextEditingController();
  TextEditingController personalisedLearningNeedsController=TextEditingController();
  String? selectedBloodGroup;

  //BankDetails
  TextEditingController ifscCodeController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController branchNameController= TextEditingController();
  TextEditingController accountHolderNameController = TextEditingController();
  TextEditingController accountTypeController =TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController upiController = TextEditingController();

  //New Admission Details
   TextEditingController enquiryDateController = TextEditingController();
   TextEditingController enquiryNumberController = TextEditingController();
   TextEditingController enquiryTypeController = TextEditingController();
   TextEditingController studentFirstNameController = TextEditingController();
   TextEditingController studentLastNameController = TextEditingController();
   TextEditingController dobController = TextEditingController()  ;
   TextEditingController existingSchoolNameController = TextEditingController();
   TextEditingController fatherGlobalIdController = TextEditingController();
   TextEditingController motherGlobalIdController = TextEditingController();
   TextEditingController parentTypeController = TextEditingController();
   TextEditingController studentsFatherFirstNameController = TextEditingController();
   TextEditingController studentsFatherLastNameController = TextEditingController();
   TextEditingController studentsFatherContactController = TextEditingController();
   TextEditingController studentsFatherEmailController = TextEditingController();
   TextEditingController studentsMotherFirstNameController = TextEditingController();
   TextEditingController studentsMotherLastNameController = TextEditingController();
   TextEditingController studentsMotherContactController = TextEditingController();
   TextEditingController studentsMotherEmailController = TextEditingController();

 //PSA-specific controllers
   BehaviorSubject<String> psaSubTypeSubject = BehaviorSubject<String>.seeded('');
   BehaviorSubject<String> psaCategorySubject = BehaviorSubject<String>.seeded('');
   BehaviorSubject<String> psaSubCategorySubject = BehaviorSubject<String>.seeded('');
   BehaviorSubject<String> periodOfServiceSubject = BehaviorSubject<String>.seeded('');
   BehaviorSubject<String> psaBatchSubject = BehaviorSubject<String>.seeded('');
 //IVT-specific controllers
    BehaviorSubject<String> ivtBoardSubject = BehaviorSubject<String>.seeded('');
    BehaviorSubject<String> ivtCourseSubject = BehaviorSubject<String>.seeded('');
    BehaviorSubject<String> ivtStreamSubject = BehaviorSubject<String>.seeded('');
    BehaviorSubject<String> ivtShiftSubject = BehaviorSubject<String>.seeded('');

    TextEditingController religionController = TextEditingController();
    TextEditingController placeOfBirthController = TextEditingController();
    TextEditingController motherTongueController = TextEditingController();
    TextEditingController casteController = TextEditingController();
    TextEditingController subCasteController = TextEditingController();
    TextEditingController nationalityController = TextEditingController();

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

  final BehaviorSubject<bool> selectedPsaSubType =
      BehaviorSubject<bool>.seeded(false);
  final BehaviorSubject<bool> selectedPsaCategory =
      BehaviorSubject<bool>.seeded(false);
  final BehaviorSubject<bool> selectedPsaSubCategory =
      BehaviorSubject<bool>.seeded(false);
  final BehaviorSubject<bool> selectedPeriodOfService =
      BehaviorSubject<bool>.seeded(false);
  final BehaviorSubject<bool> selectedPsaBatch =
      BehaviorSubject<bool>.seeded(false);

  final BehaviorSubject<bool> selecteBoard =
      BehaviorSubject<bool>.seeded(false);
  final BehaviorSubject<bool> selectedCourse =
      BehaviorSubject<bool>.seeded(false);
  final BehaviorSubject<bool> selectedStream =
      BehaviorSubject<bool>.seeded(false);
  final BehaviorSubject<bool> selectedShift =
      BehaviorSubject<bool>.seeded(false);

  

  final BehaviorSubject<String> selectedGradeSubject = BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedSchoolLocationSubject = BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedExistingSchoolGradeSubject = BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedExistingSchoolBoardSubject = BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedParentTypeSubject = BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedGenderSubject = BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedGuardianCountrySubject = BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedGuardianStateSubject = BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedGuardianCitySubject = BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedGuardianAreaSubject = BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedGuardianOccupationSubject = BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedFatherCountrySubject = BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedFatherStateSubject = BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedFatherCitySubject = BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedFatherOccupationSubject = BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedFatherAreaSubject = BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedMotherCountrySubject = BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedMotherStateSubject = BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedMotherCitySubject = BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedMotherAreaSubject = BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedMotherOccupationSubject = BehaviorSubject<String>.seeded('');
  final BehaviorSubject<bool> selectedGenerType = BehaviorSubject<bool>.seeded(false);
  final BehaviorSubject<List<String>> schoolLocationTypes = BehaviorSubject<List<String>>.seeded([]);

  final List<String> parentType = ["Mother","Father"];

  final BehaviorSubject<List<String>> existingSchoolGrade = BehaviorSubject<List<String>>.seeded([]);
  final BehaviorSubject<List<String>> existingSchoolBoard = BehaviorSubject<List<String>>.seeded([]);
  final BehaviorSubject<List<String>> gradeTypes = BehaviorSubject<List<String>>.seeded([]);

  final BehaviorSubject<List<String>> psaSubType = BehaviorSubject<List<String>>.seeded([]);
  final BehaviorSubject<List<String>> psaSubCategory = BehaviorSubject<List<String>>.seeded([]);
  final BehaviorSubject<List<String>> psaCategory = BehaviorSubject<List<String>>.seeded([]);
  final BehaviorSubject<List<String>> periodOfService = BehaviorSubject<List<String>>.seeded([]);
  final BehaviorSubject<List<String>> psaBatch = BehaviorSubject<List<String>>.seeded([]);

  final BehaviorSubject<List<String>> gender = BehaviorSubject<List<String>>.seeded([]);

  final BehaviorSubject<List<String>> stream = BehaviorSubject<List<String>>.seeded([]);
  final BehaviorSubject<List<String>> course = BehaviorSubject<List<String>>.seeded([]);
  final BehaviorSubject<List<String>> shift = BehaviorSubject<List<String>>.seeded([]);
  final BehaviorSubject<List<String>> country = BehaviorSubject<List<String>>.seeded([]);
  final BehaviorSubject<List<String>> state = BehaviorSubject<List<String>>.seeded([]);
  final BehaviorSubject<List<String>> city = BehaviorSubject<List<String>>.seeded([]);
  final BehaviorSubject<List<String>> bloodGroup = BehaviorSubject<List<String>>.seeded([]);

  List<MdmAttributeModel>? gradeTypesAttribute;
  List<MdmAttributeModel>? schoolLocationTypesAttribute;
  List<MdmAttributeModel>? genderAttribute;
  List<MdmAttributeModel>? existingSchoolBoardAttribute;
  List<MdmAttributeModel>? psaCategoryAttribute;
  List<MdmAttributeModel>? psaSubCategoryAttribute;
  List<MdmAttributeModel>? psaSubTypeAttribute;
  List<MdmAttributeModel>? periodOfServiceAttribute;
  List<MdmAttributeModel>? psaBatchAttribute;
  List<MdmAttributeModel>? streamTypeAttribute;
  List<MdmAttributeModel>? courseTypeAttribute;
  List<MdmAttributeModel>? shiftTypeAttribute;
  List<MdmAttributeModel>? countryAttribute;
  List<MdmAttributeModel>? stateAttribute;
  List<MdmAttributeModel>? cityAttribute;
  List<MdmAttributeModel>? bloodGroupAttribute;

  CommonDataClass? selectedSchoolLocationEntity; 
  CommonDataClass? selectedGradeEntity;
  CommonDataClass? selectedGenderEntity;
  CommonDataClass? selectedExistingSchoolBoardEntity;
  CommonDataClass? selectedExistingSchoolGradeEntity;
  CommonDataClass? selectedParentTypeEntity;
  CommonDataClass? selectedPsaSubTypeEntity;
  CommonDataClass? selectedPsaCategoryEntity;
  CommonDataClass? selectedPsaSubCategoryEntity;
  CommonDataClass? selectedPeriodOfServiceEntity;
  CommonDataClass? selectedPsaBatchEntity;
  CommonDataClass? selectedBoardEntity;
  CommonDataClass? selectedStreamEntity;
  CommonDataClass? selectedCourseEntity;
  CommonDataClass? selectedShiftEntity;
  CommonDataClass? selectedCountryEntity;
  CommonDataClass? selectedStateEntity;
  CommonDataClass? selectedCityEntity;
  CommonDataClass? selectedBloodGroupEntity;

  List<ValueNotifier<bool>> isDocumentUploaded = [];

  bool isDetailView(){
    return enquiryDetails?.enquiryStage?.firstWhere((element)=>element.stageName == "School visit").status == "In Progress";
  }


  bool isDetailViewCompetency(){
    return enquiryDetails?.enquiryStage?.firstWhere((element)=>element.stageName == "Competency test").status == "In Progress";
  }

  Future<void> fetchAllDetails(String enquiryID,String infoType) async {
    exceptionHandlerBinder.handle(block: () {
      GetRegistrationDetailUsecaseParams params =
      GetRegistrationDetailUsecaseParams(
          enquiryID: enquiryID, infoType: infoType);

      parentDetail.add(Resource.loading());
      contactDetail.add(Resource.loading());
      medicalDetail.add(Resource.loading());
      bankDetail.add(Resource.loading());

      RequestManager<SingleResponse>(
        params,
        createCall: () => getRegistrationDetailUsecase.execute(params: params),
      ).asFlow().listen((result) {

        if (infoType == 'ParentInfo') {
          parentDetail.add(Resource.success(data: result.data?.data));
          parentInfo = result.data?.data;
          addParentDetails(result.data?.data??ParentInfo());
        } else if (infoType == 'ContactInfo') {
          contactDetail.add(Resource.success(data: result.data?.data));
          contactDetails = result.data?.data;
          addContactDetails(result.data?.data??ContactDetails());
        } else if (infoType == 'MedicalInfo') {
          medicalDetail.add(Resource.success(data: result.data?.data));
          medicalDetails = result.data?.data;
          addMedicalDetails( result.data?.data??MedicalDetails());
        } else {
          bankDetail.add(Resource.success(data: result.data?.data));
          bankDetails = result.data?.data;
          addBankDetails(result.data?.data??BankDetails());
        }
        isLoading.value = false;
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
        isLoading.value = false;
      });
    }).execute();
  }



  Future<void> updateParentDetail(String enquiryID,
      ParentInfoEntity parentInfoEntity) async {
    exceptionHandlerBinder.handle(block: () {
      final params = UpdateParentDetailsUsecaseParams(
          enquiryID: enquiryID, parentInfo: parentInfoEntity);
      parentDetail.add(Resource.loading());
      isLoading.value = true;
      RequestManager<SingleResponse>(
          params,
          createCall: () => updateParentDetailsUsecase.execute(params: params)

      ).asFlow().listen((result) {
        if(result.status == Status.success){
          parentDetail.add(Resource.success(data: result.data?.data));
          parentInfo = result.data?.data;
          addParentDetails( result.data?.data??ParentInfo());
          ProviderScope
          .containerOf(context!)
          .read(commonChipListProvider)
          .highlightIndex
          .add(ProviderScope
          .containerOf(context!)
          .read(commonChipListProvider)
          .highlightIndex
          .value +1
          );
          isLoading.value = false;
          showWidget.add(showWidget.value + 1);
          fetchAllDetails(enquiryID, "ContactInfo");
        }
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
        isLoading.value = false;
      });
    }).execute();
  }


  Future<void> updateMedicalDetail(String enquiryID,
      MedicalDetailsEntity medicalEntity) async {
    exceptionHandlerBinder.handle(block: () {
      final params = UpdateMedicalDetailsUsecaseParams(
          enquiryID: enquiryID, medicalDetails: medicalEntity);
      isLoading.value = true;
      RequestManager<SingleResponse>(
          params,
          createCall: () =>
              updateMedicalDetailsUsecase.execute(params: params)
      ).asFlow().listen((result) {
        if(result.status == Status.success){
          medicalDetail.add(Resource.success(data: result.data?.data));
        medicalDetails = result.data?.data;
        ProviderScope
          .containerOf(context!)
          .read(commonChipListProvider)
          .highlightIndex
          .add(ProviderScope
          .containerOf(context!)
          .read(commonChipListProvider)
          .highlightIndex
          .value +1
        );
        isLoading.value = false;
        fetchAllDetails(enquiryID, "BankInfo");
        showWidget.add(showWidget.value + 1);
        }
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
        isLoading.value = false;
      });
    }).execute();
  }


  Future<void> updateContactDetail(String enquiryID,
      ContactDetailsEntity contactInfoEntity) async {
    exceptionHandlerBinder.handle(block: () {
      final params = UpdateContactDetailsUsecaseParams(
          enquiryID: enquiryID, contactDetails: contactInfoEntity);
          isLoading.value = true;
      RequestManager<SingleResponse>(
          params,
          createCall: () =>
              updateContactDetailsUsecase.execute(params: params)
      ).asFlow().listen((result) {
        if(result.status == Status.success){
        contactDetail.add(Resource.success(data: result.data?.data));
        contactDetails = result.data?.data;
        addContactDetails( result.data?.data??ContactDetails());
        ProviderScope
          .containerOf(context!)
          .read(commonChipListProvider)
          .highlightIndex
          .add(ProviderScope
          .containerOf(context!)
          .read(commonChipListProvider)
          .highlightIndex
          .value +1
          );
        isLoading.value = false;
        fetchAllDetails(enquiryID, "MedicalInfo");
        showWidget.add(showWidget.value + 1);
        }
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
        isLoading.value = false;
      });
    }).execute();
  }

  Future<void> updateBankDetail(String enquiryID,
      BankDetailsEntity bankDetailEntity) async {
    exceptionHandlerBinder.handle(block: () {
      final params = UpdateBankDetailsUsecaseParams(
          enquiryID: enquiryID, bankDetails: bankDetailEntity);
          isLoading.add(true);
      RequestManager<SingleResponse>(
          params,
          createCall: () =>
              updateBankDetailsUsecase.execute(params: params)
      ).asFlow().listen((result) {
        if(result.status == Status.success){
          bankDetail.add(Resource.success(data: result.data?.data));
          bankDetails = result.data?.data;
          addBankDetails( result.data?.data??BankDetails());
          ProviderScope
          .containerOf(context!)
          .read(commonChipListProvider)
          .highlightIndex
          .add(ProviderScope
          .containerOf(context!)
          .read(commonChipListProvider)
          .highlightIndex
          .value +1
          );
          isLoading.value = false;
          getEnquiryDetail(enquiryID: enquiryID);
          showWidget.add(showWidget.value + 1);
        }
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
        isLoading.value = false;
      });
    }).execute();
  }

  Future<void> getNewAdmissionDetails({required String enquiryID,bool isEdit = false}) async {
    exceptionHandlerBinder.handle(block: () {
      GetNewAdmissionDetailUseCaseParams params = GetNewAdmissionDetailUseCaseParams(
        enquiryID: enquiryID,
      );

      RequestManager<NewAdmissionBase>(
        params,
        createCall: () =>
            getNewAdmissionDetailUseCase.execute(
              params: params,
            ),
      ).asFlow().listen((result) {
        _newAdmissionDetails.add(result);
        if(result.status == Status.success){
          newAdmissionDetailSubject?.add(result.data?.data??NewAdmissionDetail());
          if(isEdit){
            addNewAdmissionDetails(result.data?.data??NewAdmissionDetail(), enquiryDetailArgs??EnquiryDetailArgs());
          }
        }
        // activeStep.add()
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  Future<void> getIvtDetails({required String enquiryID,bool isEdit = false}) async {
    exceptionHandlerBinder.handle(block: () {
      GetIvtDetailUsecaseParams params = GetIvtDetailUsecaseParams(
        enquiryID: enquiryID,
      );

      RequestManager<IVTBase>(
        params,
        createCall: () =>
            getIvtDetailUsecase.execute(
              params: params,
            ),
      ).asFlow().listen((result) {
        ivtDetails.add(
            Resource.success(data: result.data?.data ?? IVTDetail()));
        if(isEdit){
          addIvtDetails(result.data?.data??IVTDetail(), enquiryDetailArgs??EnquiryDetailArgs());
        }
        // activeStep.add()
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  Future<void> getPsaDetails({required String enquiryID,bool isEdit = false}) async {
    exceptionHandlerBinder.handle(block: () {
      GetPsaDetailUsecaseParams params = GetPsaDetailUsecaseParams(
        enquiryID: enquiryID,
      );

      RequestManager<PsaResponse>(
        params,
        createCall: () =>
            getPsaDetailUsecase.execute(
              params: params,
            ),
      ).asFlow().listen((result) {
        psaDetails.add(
            Resource.success(data: result.data?.data ?? PSADetail()));
        if(isEdit){
          addPsaDetails(result.data?.data??PSADetail(), enquiryDetailArgs??EnquiryDetailArgs());
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
        createCall: () =>
            getEnquiryDetailUseCase.execute(
              params: params,
            ),
      ).asFlow().listen((result) {
        _enquiryDetail.add(result);
        // activeStep.add()
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  Future<void> updatePsaDetails({required String enquiryID,required PsaDetailResponseEntity psaDetail}) async{
    exceptionHandlerBinder.handle(block: () {
     
      UpdatePsaDetailUsecaseParams params = UpdatePsaDetailUsecaseParams(
        enquiryID: enquiryID,
        psaDetail: psaDetail
      );
      
      RequestManager<PsaResponse>(
        params,
        createCall: () => updatePsaDetailUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        psaDetailSubject?.add(result.data?.data?? PSADetail());
        // activeStep.add()
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  Future<void> updateIvtDetails({required String enquiryID,required IvtDetailResponseEntity ivtDetail}) async{
    exceptionHandlerBinder.handle(block: () {
     
      UpdateIvtDetailUsecaseParams params = UpdateIvtDetailUsecaseParams(
        enquiryID: enquiryID,
        ivtDetail: ivtDetail
      );
      
      RequestManager<IVTBase>(
        params,
        createCall: () => updateIvtDetailUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        ivtDetailSubject?.add(result.data?.data??IVTDetail());
        // activeStep.add()
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  Future<void> updateNewAdmissionDetails({required String enquiryID,required NewAdmissionDetailEntity newAdmissionDetail}) async{
    exceptionHandlerBinder.handle(block: () {
     
      UpdateNewAdmissionUsecaseUseCaseParams params = UpdateNewAdmissionUsecaseUseCaseParams(
        enquiryID: enquiryID,
        newAdmissionDetail: newAdmissionDetail
      );
      isLoading.value = true;
      RequestManager<NewAdmissionBase>(
        params,
        createCall: () => updateNewAdmissionUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        if(result.status == Status.success){
          isLoading.value = false;
          newAdmissionDetailSubject?.add(result.data?.data?? NewAdmissionDetail());
        }
        
      }).onError((error) {
        isLoading.value = false;
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  Future<void> getMdmAttribute({required String infoType}) async {
    exceptionHandlerBinder.handle(block: () {
      GetMdmAttributeUsecaseParams params = GetMdmAttributeUsecaseParams(
        infoType: infoType,
      );
      RequestManager<MdmAttributeBaseModel>(
        params,
        createCall: () => getMdmAttributeUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        if(infoType == "grade"){
          gradeTypesAttribute = result.data?.data;
          gradeTypes.add(result.data?.data?.map((e) => e.attributes?.name?? '').toList()??[]);
        }
        if(infoType == "schoolLocation"){
          schoolLocationTypesAttribute = result.data?.data;
          schoolLocationTypes.add(result.data?.data?.map((e) => e.attributes?.name?? '').toList()??[]);
        }
        if(infoType == "gender"){
          genderAttribute = result.data?.data;
          gender.add(result.data?.data?.map((e) => e.attributes?.name?? '').toList()??[]);
        }
        if(infoType == "board"){
          existingSchoolBoardAttribute = result.data?.data;
          existingSchoolBoard.add(result.data?.data?.map((e) => e.attributes?.name?? '').toList()??[]);
        }
        if(infoType == "psaCategory"){
          psaCategoryAttribute = result.data?.data;
          psaCategory.add(result.data?.data?.map((e) => e.attributes?.name?? '').toList()??[]);
        }
        if(infoType == "psaSubCategory"){
          psaSubCategoryAttribute = result.data?.data;
          psaSubCategory.add(result.data?.data?.map((e) => e.attributes?.name?? '').toList()??[]);
        }
        if(infoType == "psaSubType"){
          psaSubTypeAttribute = result.data?.data;
          psaSubType.add(result.data?.data?.map((e) => e.attributes?.name?? '').toList()??[]);
        }
        if(infoType == "periodOfService"){
          periodOfServiceAttribute = result.data?.data;
          periodOfService.add(result.data?.data?.map((e) => e.attributes?.name?? '').toList()??[]);
        }
        if(infoType == "batch"){
          psaBatchAttribute = result.data?.data;
          psaBatch.add(result.data?.data?.map((e) => e.attributes?.name?? '').toList()??[]);
        }
        if(infoType == "stream"){
          streamTypeAttribute = result.data?.data;
          stream.add(result.data?.data?.map((e)=>e.attributes?.name??'').toList()??[]);
        }
        if(infoType == "course"){
          courseTypeAttribute = result.data?.data;
          course.add(result.data?.data?.map((e)=>e.attributes?.name??'').toList()??[]);
        }
        if(infoType == "shift"){
          shiftTypeAttribute = result.data?.data;
          shift.add(result.data?.data?.map((e)=>e.attributes?.name??'').toList()??[]);
        }
        if(infoType == "country"){
          countryAttribute = result.data?.data;
          country.add(result.data?.data?.map((e)=>e.attributes?.name??'').toList()??[]);
        } 
        if(infoType == "state"){
          stateAttribute = result.data?.data;
          state.add(result.data?.data?.map((e)=>e.attributes?.name??'').toList()??[]);
        }
        if(infoType == "city"){
          cityAttribute = result.data?.data;
          city.add(result.data?.data?.map((e)=>e.attributes?.name??'').toList()??[]);
        }
        if(infoType == "bloodGroup"){
          bloodGroupAttribute = result.data?.data;
          bloodGroup.add(result.data?.data?.map((e)=> e.attributes?.group??'').toList()??[]);
        }
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  Future<void> uploadEnquiryDocument({required String enquiryID,required String documentID,required File file,int? index}) async{
    exceptionHandlerBinder.handle(block: () {
      
      UploadEnquiryDocumentUsecaseParams params = UploadEnquiryDocumentUsecaseParams(
        documentID: documentID,
        enquiryID: enquiryID,
        file: file
      );
      isLoading.value = true;
      RequestManager<EnquiryFileUploadBase>(
        params,
        createCall: () => uploadEnquiryDocumentUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        if(result.status == Status.success){
          uploadEnquiryFile.add(Resource.success(data: result.data?? EnquiryFileUploadBase()));
          isDocumentUploaded[index??0].value = true;
          isLoading.value = false;
        }
        // activeStep.add()
      }).onError((error) {
        isLoading.value = false;
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  Future<void> deleteEnquiryDocument({required String enquiryID,required String documentID,int? index}) async{
    exceptionHandlerBinder.handle(block: () {
      
      DeleteEnquiryDocumentUsecaseParams params = DeleteEnquiryDocumentUsecaseParams(
        documentID: documentID,
        enquiryID: enquiryID,
      );
      isLoading.value = true;
      RequestManager<DeleteEnquiryFileBase>(
        params,
        createCall: () => deleteEnquiryDocumentUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        if(result.status == Status.success){
          deleteEnquiryFile.add(Resource.success(data: result.data?? DeleteEnquiryFileBase()));
          isDocumentUploaded[index??0].value = false;
          isLoading.value = false;
        }
        // activeStep.add()
      }).onError((error) {
        isLoading.value = false;
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  Future<void> downloadEnquiryDocument({required String enquiryID,required String documentID}) async{
    exceptionHandlerBinder.handle(block: () {
      
      DownloadEnquiryDocumentUsecaseParams params = DownloadEnquiryDocumentUsecaseParams(
        documentID: documentID,
        enquiryID: enquiryID,
      );
      isLoading.value = true;
      RequestManager<DownloadEnquiryFileBase>(
        params,
        createCall: () => downloadEnquiryDocumentUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        if(result.status == Status.success){
          getEnquiryFile.add(Resource.success(data: result.data?? DownloadEnquiryFileBase()));
          downloadDocument(fileUrl: result.data?.data?['url']??'');
        }
      }).onError((error) {
        isLoading.value = false;
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  Future<void> downloadDocument({required String fileUrl}) async{
    exceptionHandlerBinder.handle(block: () {
      DownloadFileUsecaseParams params = DownloadFileUsecaseParams(
        fileUrl: fileUrl
      );
      RequestManager<Uint8List>(
        params,
        createCall: () => downloadFileUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((result) async{
        if(result.status == Status.success){
          try {
            Directory? directory;
            if(Platform.isAndroid){
              directory = Directory('storage/emulated/0/Download');
            }
            else{
              directory = await getApplicationDocumentsDirectory();
            }
            final fullPath = directory.path;
            final fileExtension = extractFileExtension(fileUrl);
            final fileName = '${DateTime.now().millisecondsSinceEpoch}.$fileExtension';
            final file = File('$fullPath/$fileName');
            await file.writeAsBytes(result.data??Uint8List(0));
            isLoading.value = false;
          } catch (e) {
            isLoading.value = false;
            log(e.toString());
            // ScaffoldMessenger.of(context).showSnackBar(
            //   SnackBar(content: Text('Error: $e')),
            // );
          }
        }
      }).onError((error) {
        isLoading.value = false;
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  String? extractFileExtension(String url) {
    final RegExp regExp = RegExp(r'\.([a-zA-Z0-9]+)(?:\?|$)');
    final match = regExp.firstMatch(url);
    if (match != null && match.groupCount > 0) {
      return match.group(1);
    }
    return null;
  }

  addNewAdmissionDetails(NewAdmissionDetail detail,EnquiryDetailArgs enquiryDetail){
    enquiryNumberController.text = enquiryDetail.enquiryNumber ?? '';
    enquiryTypeController.text = enquiryDetail.enquiryType ?? '';
    enquiryDateController.text = detail.enquiryDate??'';
    studentFirstNameController.text = detail.studentDetails?.firstName ?? '';
    studentLastNameController.text = detail.studentDetails?.lastName ?? '';
    dobController.text = (detail.studentDetails?.dob??'').replaceAll('-', '/'); 
    placeOfBirthController.text = detail.studentDetails?.placeOfBirth??'';
    religionController.text = detail.studentDetails?.religion??'';
    casteController.text = detail.studentDetails?.caste??'';
    subCasteController.text = detail.studentDetails?.subCaste??'';
    nationalityController.text = detail.studentDetails?.nationality??'';
    motherTongueController.text = detail.studentDetails?.motherTongue??'';
    existingSchoolNameController.text = detail.existingSchoolDetails?.name?? '';
    selectedGradeSubject.add(detail.studentDetails?.grade?.value?? '');
    selectedGradeEntity = detail.studentDetails?.grade;
    selectedSchoolLocationSubject.add(detail.schoolLocation?.value?? '');
    selectedSchoolLocationEntity = detail.schoolLocation;
    selectedExistingSchoolGradeSubject.add(detail.existingSchoolDetails?.grade?.value?? '');
    selectedExistingSchoolGradeEntity = detail.existingSchoolDetails?.grade;
    selectedExistingSchoolBoardSubject.add(detail.existingSchoolDetails?.board?.value?? '');
    selectedExistingSchoolBoardEntity = detail.existingSchoolDetails?.board;
    selectedGenderSubject.add(detail.studentDetails?.gender?.value?? '');
    selectedGenderEntity = detail.studentDetails?.gender;
    // parentTypeController.text = detail.enquirerParent??'';
    selectedParentTypeSubject.add(detail.enquirerParent??'');
    fatherGlobalIdController.text = detail.parentDetails?.fatherDetails?.globalId??'';
    motherGlobalIdController.text = detail.parentDetails?.fatherDetails?.globalId??'';
    studentsFatherFirstNameController.text = detail.parentDetails?.fatherDetails?.firstName??'';
    studentsFatherLastNameController.text = detail.parentDetails?.fatherDetails?.lastName??'';
    studentsFatherContactController.text = detail.parentDetails?.fatherDetails?.mobile??'';
    studentsFatherEmailController.text = detail.parentDetails?.fatherDetails?.email??'';
    studentsMotherFirstNameController.text = detail.parentDetails?.motherDetails?.firstName??'';
    studentsMotherLastNameController.text = detail.parentDetails?.motherDetails?.lastName??'';
    studentsMotherContactController.text = detail.parentDetails?.motherDetails?.mobile??'';
    studentsMotherEmailController.text = detail.parentDetails?.motherDetails?.email??'';
  }

  addPsaDetails(PSADetail detail,EnquiryDetailArgs enquiryDetail){
    enquiryNumberController.text = enquiryDetail.enquiryNumber ?? '';
    enquiryTypeController.text = enquiryDetail.enquiryType ?? '';
    enquiryDateController.text = detail.enquiryDate??'';
    studentFirstNameController.text = detail.studentDetails?.firstName ?? '';
    studentLastNameController.text = detail.studentDetails?.lastName ?? '';
    dobController.text = (detail.studentDetails?.dob ?? '').replaceAll('-', '/'); 
    placeOfBirthController.text = detail.studentDetails?.placeOfBirth??'';
    religionController.text = detail.studentDetails?.religion??'';
    casteController.text = detail.studentDetails?.caste??'';
    subCasteController.text = detail.studentDetails?.subCaste??'';
    nationalityController.text = detail.studentDetails?.nationality??'';
    motherTongueController.text = detail.studentDetails?.motherTongue??'';
    existingSchoolNameController.text = detail.existingSchoolDetails?.name?? '';
    selectedGradeSubject.add(detail.studentDetails?.grade?.value?? '');
    selectedGradeEntity = detail.studentDetails?.grade;
    selectedSchoolLocationSubject.add(detail.schoolLocation?.value?? '');
    selectedSchoolLocationEntity = detail.schoolLocation;
    selectedExistingSchoolGradeSubject.add(detail.existingSchoolDetails?.grade?.value?? '');
    selectedExistingSchoolGradeEntity = detail.existingSchoolDetails?.grade;
    selectedExistingSchoolBoardSubject.add(detail.existingSchoolDetails?.board?.value?? '');
    selectedExistingSchoolBoardEntity = detail.existingSchoolDetails?.board;
    selectedGenderSubject.add(detail.studentDetails?.gender?.value?? '');
    selectedGenderEntity = detail.studentDetails?.gender;
    psaSubTypeSubject.add(detail.psaSubType?.value?? '');
    selectedPsaSubTypeEntity = detail.psaSubType;
    psaCategorySubject.add(detail.psaCategory?.value?? '');
    selectedPsaCategoryEntity = detail.psaCategory;
    psaSubCategorySubject.add(detail.psaSubCategory?.value?? '');
    selectedPsaSubCategoryEntity = detail.psaSubCategory;
    periodOfServiceSubject.add(detail.psaPeriodOfService?.value?? '');
    selectedPeriodOfServiceEntity = detail.psaPeriodOfService;
    psaBatchSubject.add(detail.psaBatch?.value?? '');
    selectedPsaBatchEntity = detail.psaBatch;
    selectedParentTypeSubject.add(detail.enquirerParent??'');
    fatherGlobalIdController.text = detail.parentDetails?.fatherDetails?.globalId??'';
    motherGlobalIdController.text = detail.parentDetails?.fatherDetails?.globalId??'';
    studentsFatherFirstNameController.text = detail.parentDetails?.fatherDetails?.firstName??'';
    studentsFatherLastNameController.text = detail.parentDetails?.fatherDetails?.lastName??'';
    studentsFatherContactController.text = detail.parentDetails?.fatherDetails?.mobile??'';
    studentsFatherEmailController.text = detail.parentDetails?.fatherDetails?.email??'';
    studentsMotherFirstNameController.text = detail.parentDetails?.motherDetails?.firstName??'';
    studentsMotherLastNameController.text = detail.parentDetails?.motherDetails?.lastName??'';
    studentsMotherContactController.text = detail.parentDetails?.motherDetails?.mobile??'';
    studentsMotherEmailController.text = detail.parentDetails?.motherDetails?.email??'';
  }

  addIvtDetails(IVTDetail detail,EnquiryDetailArgs enquiryDetail){
    enquiryNumberController.text = enquiryDetail.enquiryNumber ?? '';
    enquiryTypeController.text = enquiryDetail.enquiryType ?? '';
    enquiryDateController.text = detail.enquiryDate??'';
    studentFirstNameController.text = detail.studentDetails?.firstName ?? '';
    studentLastNameController.text = detail.studentDetails?.lastName ?? '';
    dobController.text = (detail.studentDetails?.dob ?? '').replaceAll('-', '/'); 
    placeOfBirthController.text = detail.studentDetails?.placeOfBirth??'';
    religionController.text = detail.studentDetails?.religion??'';
    casteController.text = detail.studentDetails?.caste??'';
    subCasteController.text = detail.studentDetails?.subCaste??'';
    nationalityController.text = detail.studentDetails?.nationality??'';
    motherTongueController.text = detail.studentDetails?.motherTongue??'';
    existingSchoolNameController.text = detail.existingSchoolDetails?.name?? '';
    selectedGradeSubject.add(detail.studentDetails?.grade?.value?? '');
    selectedGradeEntity = detail.studentDetails?.grade;
    selectedSchoolLocationSubject.add(detail.schoolLocation?.value?? '');
    selectedSchoolLocationEntity = detail.schoolLocation;
    selectedExistingSchoolGradeSubject.add(detail.existingSchoolDetails?.grade?.value?? '');
    selectedExistingSchoolGradeEntity = detail.existingSchoolDetails?.grade;
    selectedExistingSchoolBoardSubject.add(detail.existingSchoolDetails?.board?.value?? '');
    selectedExistingSchoolBoardEntity = detail.existingSchoolDetails?.board;
    selectedGenderSubject.add(detail.studentDetails?.gender?.value?? '');
    selectedGenderEntity = detail.studentDetails?.gender;
    ivtBoardSubject.add(detail.board?.value?? '');
    ivtCourseSubject.add(detail.course?.value?? '');
    ivtStreamSubject.add(detail.stream?.value?? '');
    ivtShiftSubject.add(detail.shift?.value?? '');
    selectedParentTypeSubject.add(detail.enquirerParent??'');
    fatherGlobalIdController.text = detail.parentDetails?.fatherDetails?.globalId??'';
    motherGlobalIdController.text = detail.parentDetails?.fatherDetails?.globalId??'';
    studentsFatherFirstNameController.text = detail.parentDetails?.fatherDetails?.firstName??'';
    studentsFatherLastNameController.text = detail.parentDetails?.fatherDetails?.lastName??'';
    studentsFatherContactController.text = detail.parentDetails?.fatherDetails?.mobile??'';
    studentsFatherEmailController.text = detail.parentDetails?.fatherDetails?.email??'';
    studentsMotherFirstNameController.text = detail.parentDetails?.motherDetails?.firstName??'';
    studentsMotherLastNameController.text = detail.parentDetails?.motherDetails?.lastName??'';
    studentsMotherContactController.text = detail.parentDetails?.motherDetails?.mobile??'';
    studentsMotherEmailController.text = detail.parentDetails?.motherDetails?.email??'';
  }


  BehaviorSubject<bool> showMenuOnFloatingButton =
  BehaviorSubject<bool>.seeded(false);

  BehaviorSubject<bool> editRegistrationDetails =
  BehaviorSubject<bool>.seeded(false);

  final CommonRadioButton<String> radioButtonController =
  CommonRadioButton<String>(null);

  final CommonRadioButton<String> radioButtonController1 =
  CommonRadioButton<String>(null);

  final CommonRadioButton<String?> radioButtonController2 =
  CommonRadioButton<String>(null);

  final CommonRadioButton<String> radioButtonController3 =
  CommonRadioButton<String>(null);

  final CommonRadioButton<String> radioButtonController4 =
  CommonRadioButton<String>(null);

  final CommonRadioButton<String> radioButtonController5 =
  CommonRadioButton<String>(null);

  final CommonRadioButton<String> radioButtonController6 =
  CommonRadioButton<String>(null);

  final CommonRadioButton<String> radioButtonController7 =
  CommonRadioButton<String>(null);

  final CommonRadioButton<String> radioButtonController8 =
  CommonRadioButton<String>(null);

  final CommonRadioButton<String> radioButtonController9 =
  CommonRadioButton<String>(null);

  final CommonRadioButton<String> radioButtonController10 =
  CommonRadioButton<String>(null);



  addParentDetails(ParentInfo parentDetails) {

    fatherFirstNameController.text = parentDetails.fatherDetails?.firstName??"";
    fatherLastNameController.text=parentDetails.fatherDetails?.lastName??"";
    fatherAdharCardController.text=parentDetails.fatherDetails?.aadharNumber??"";
    fatherPanCardController.text=parentDetails.fatherDetails?.panNumber??"";
    qualificationController.text=parentDetails.fatherDetails?.qualification??"";
    organizationNameController.text = parentDetails.fatherDetails?.organisationName??"";
    designationController.text=parentDetails.fatherDetails?.designationName??"";
    pinCodeController.text=parentDetails.fatherDetails?.pinCode??"";
    fatherEmailController.text=parentDetails.fatherDetails?.emailId??"";
    fatherMobileController.text=parentDetails.fatherDetails?.mobileNumber??"";
    fatherOccupation=parentDetails.fatherDetails?.occupation??"";
    fatherArea=parentDetails.fatherDetails?.area??"";
    selectedFatherCountryEntity=(parentDetails.fatherDetails?.country is CommonDataClass)? parentDetails.fatherDetails?.country : null;
    selectedFatherStateEntity=(parentDetails.fatherDetails?.state is CommonDataClass)? parentDetails.fatherDetails?.state:null;
    selectedFatherCityEntity=(parentDetails.fatherDetails?.city is CommonDataClass)? parentDetails.fatherDetails?.city:null;
    if(parentDetails.fatherDetails?.city is CommonDataClass){
      selectedFatherCountrySubject.add(parentDetails.fatherDetails?.country?.value??'');
      selectedFatherStateSubject.add(parentDetails.fatherDetails?.state?.value??'');
      selectedFatherCitySubject.add(parentDetails.fatherDetails?.city?.value??'');
    }
    selectedFatherAreaSubject.add(parentDetails.fatherDetails?.area??'');
    selectedFatherOccupationSubject.add(parentDetails.fatherDetails?.occupation??'');

    motherFirstNameController.text =parentDetails.motherDetails?.firstName??"";
    motherLastNameController.text = parentDetails.motherDetails?.lastName??"";
    motherAdharCardController.text = parentDetails.motherDetails?.aadharNumber??"";
    motherPanCardController.text=parentDetails.motherDetails?.panNumber??"";
    motherQualificationController.text=parentDetails.motherDetails?.qualification??"";
    motherOrganizationNameController.text=parentDetails.motherDetails?.organisationName??"";
    motherDesignationController.text =parentDetails.motherDetails?.designationName??"";
    motherOfficeAddressController.text=parentDetails.motherDetails?.officeAddress??"";
    motherPinCodeController.text=parentDetails.motherDetails?.pinCode??"";
    motherEmailController.text=parentDetails.motherDetails?.emailId??"";
    motherMobileController.text=parentDetails.motherDetails?.mobileNumber??"";
    motherOccupation=parentDetails.motherDetails?.occupation??"";
    motherArea=parentDetails.motherDetails?.area??"";
    selectedMotherCountryEntity=(parentDetails.motherDetails?.country is CommonDataClass) ? parentDetails.motherDetails?.country: null;
    selectedMotherStateEntity=(parentDetails.motherDetails?.state is CommonDataClass)? parentDetails.motherDetails?.state:null;
    selectedMotherCityEntity=(parentDetails.motherDetails?.city is CommonDataClass)? parentDetails.motherDetails?.city:null;
    selectedMotherAreaSubject.add(parentDetails.motherDetails?.area??'');
    if(parentDetails.motherDetails?.city is CommonDataClass){
      selectedMotherCountrySubject.add(parentDetails.motherDetails?.country?.value??'');
      selectedMotherStateSubject.add(parentDetails.motherDetails?.state?.value??'');
      selectedMotherCitySubject.add(parentDetails.motherDetails?.city?.value??'');
    }
    selectedMotherOccupationSubject.add(parentDetails.motherDetails?.occupation??'');
    
    guardianFirstNameController.text =parentDetails.guardianDetails?.firstName??"";
    guardianLastNameController.text = parentDetails.guardianDetails?.lastName??"";
    guardianAdharCardController.text = parentDetails.guardianDetails?.aadharNumber??"";
    guardianPanCardController.text=parentDetails.guardianDetails?.panNumber??"";
    guardianQualificationController.text=parentDetails.guardianDetails?.qualification??"";
    guardianOrganizationNameController.text=parentDetails.guardianDetails?.organisationName??"";
    guardianDesignationController.text =parentDetails.guardianDetails?.designationName??"";
    guardianOfficeAddressController.text=parentDetails.guardianDetails?.officeAddress??"";
    guardianPinCodeController.text=parentDetails.guardianDetails?.pincode??"";
    guardianEmailController.text=parentDetails.guardianDetails?.emailId??"";
    guardianMobileController.text=parentDetails.guardianDetails?.mobileNumber??"";
    selectedGuardianCountryEntity=(parentDetails.guardianDetails?.country is CommonDataClass)? parentDetails.guardianDetails?.country : null;
    selectedGuardianStateEntity=(parentDetails.guardianDetails?.state is CommonDataClass)? parentDetails.guardianDetails?.state : null;
    selectedGuardianCityEntity=(parentDetails.guardianDetails?.city is CommonDataClass)? parentDetails.guardianDetails?.city : null;
    selectedGuardianAreaSubject.add(parentDetails.guardianDetails?.area??'');
    if(parentDetails.guardianDetails?.city is CommonDataClass){
      selectedGuardianCountrySubject.add(parentDetails.guardianDetails?.country?.value??'');
      selectedGuardianStateSubject.add(parentDetails.guardianDetails?.state?.value??'');
      selectedGuardianCitySubject.add(parentDetails.guardianDetails?.city?.value??'');
    }
    selectedGuardianOccupationSubject.add(parentDetails.guardianDetails?.occupation??'');
  }

  addContactDetails(ContactDetails contactDetails) {
    houseOrBuildingController.text= contactDetails.residentialAddress?.house??"";
    streetNameController.text= contactDetails.residentialAddress?.street??"";
    landMarkController.text= contactDetails.residentialAddress?.landmark??"";
    emergencyContact = contactDetails.emergencyContact?.emergencyContact??'';
    residentialCountry = contactDetails.residentialAddress?.country;
    residentialState = contactDetails.residentialAddress?.state;
    residentialCity = contactDetails.residentialAddress?.city;
    selectedResidentialCity.value = contactDetails.residentialAddress?.country?.value??'';
    residentialPinCode = contactDetails.residentialAddress?.pinCode??"";
    selectedResidentialState.value = contactDetails.residentialAddress?.state?.value??'';
    selectedResidentialCountry.value = contactDetails.residentialAddress?.country?.value??'';
    if(contactDetails.pointOfContact?.length == 1){
      parentEmailIdController1.text = contactDetails.pointOfContact?[0].parentEmailId??"";
      parentMobileNumberController1.text = contactDetails.pointOfContact?[0].parentContactNumber??"";
      contactParentType1 = contactDetails.pointOfContact?[0].parentType??"";
    }
    if(contactDetails.pointOfContact?.length == 2){
      parentEmailIdController2.text = contactDetails.pointOfContact?[1].parentEmailId??"";
      parentMobileNumberController2.text = contactDetails.pointOfContact?[1].parentContactNumber??"";
      contactParentType2 = contactDetails.pointOfContact?[1].parentType??"";
    }
    radioButtonController3.selectItem((contactDetails.residentialAddress?.isPermanentAddress??false) ? "Yes" : "No");
  }

  addMedicalDetails(MedicalDetails medicalDetails){
    yearOfHospitalizationController.text=medicalDetails.yearOfHospitalization??"";
    reasonOfHospitalizationController.text=medicalDetails.reasonOfHopitalization??"";
    specificDisabilityController.text=medicalDetails.physicalDisabilityDescription??"";
    specifyMedicalHistoryController.text = medicalDetails.medicalHistoryDescription??"";
    specifyAllergiesController.text = medicalDetails.allergyDescription??"";
    selectedBloodGroup = medicalDetails.bloodGroup??"";
    personalisedLearningNeedsController.text = medicalDetails.personalisedLearningNeedsDescription??'';
    radioButtonController4.selectItem((medicalDetails.isChildHospitalised??false) ? "Yes": "No");
    radioButtonController5.selectItem((medicalDetails.hasPhysicalDisability??false)? "Yes": "No");
    radioButtonController7.selectItem((medicalDetails.hasMedicalHistory??false)?"Yes":"No");
    radioButtonController8.selectItem((medicalDetails.hasAllergy??false)?"Yes":"No");
    radioButtonController9.selectItem((medicalDetails.hasPersonalisedLearningNeeds??false)?"Yes":"No");
  }

  addBankDetails(BankDetails bankDetails){
     ifscCodeController.text = bankDetails.ifscCode??"";
     bankNameController.text = bankDetails.bankName??"";
     branchNameController.text=bankDetails.branchName??"";
     accountHolderNameController.text =bankDetails.accountHolderName??"";
     accountTypeController.text=bankDetails.accountType??"";
     accountNumberController.text = bankDetails.accountNumber??"";
     upiController.text = bankDetails.upiInfo??"";
  }
  Future<void> saveParentDetails(String enquiryId)async {
    ParentInfoEntity parentInfoEntity=ParentInfoEntity();

    parentInfo?.fatherDetails?.firstName=fatherFirstNameController.text.trim();
    parentInfo?.fatherDetails?.lastName=fatherFirstNameController.text.trim();
    parentInfo?.fatherDetails?.aadharNumber=fatherAdharCardController.text.trim();
    parentInfo?.fatherDetails?.panNumber=fatherPanCardController.text.trim();
    parentInfo?.fatherDetails?.qualification=fatherPanCardController.text.trim();
    parentInfo?.fatherDetails?.organisationName=organizationNameController.text.trim();
    parentInfo?.fatherDetails?.designationName=designationController.text.trim();
    parentInfo?.fatherDetails?.pinCode=pinCodeController.text.trim();
    parentInfo?.fatherDetails?.emailId=fatherEmailController.text.trim();
    parentInfo?.fatherDetails?.mobileNumber=fatherMobileController.text.trim();
    parentInfo?.fatherDetails?.occupation=fatherOccupation;
    parentInfo?.fatherDetails?.area=fatherArea;
    parentInfo?.fatherDetails?.country=selectedFatherCountryEntity;
    parentInfo?.fatherDetails?.state=selectedFatherStateEntity;
    parentInfo?.fatherDetails?.city=selectedFatherCityEntity;

    parentInfo?.motherDetails?.firstName=motherFirstNameController.text.trim();
    parentInfo?.motherDetails?.lastName=motherLastNameController.text.trim();
    parentInfo?.motherDetails?.aadharNumber=motherAdharCardController.text.trim();
    parentInfo?.motherDetails?.panNumber=motherPanCardController.text.trim();
    parentInfo?.motherDetails?.qualification=motherQualificationController.text.trim();
    parentInfo?.motherDetails?.organisationName= motherOrganizationNameController.text.trim();
    parentInfo?.motherDetails?.designationName=motherDesignationController.text.trim();
    parentInfo?.motherDetails?.officeAddress=motherOfficeAddressController.text.trim();
    parentInfo?.motherDetails?.pinCode=motherPinCodeController.text.trim();
    parentInfo?.motherDetails?.emailId=motherEmailController.text.trim();
    parentInfo?.motherDetails?.mobileNumber=motherMobileController.text.trim();
    parentInfo?.motherDetails?.occupation=motherOccupation;
    parentInfo?.motherDetails?.area=motherArea;
    parentInfo?.motherDetails?.country=selectedMotherCountryEntity;
    parentInfo?.motherDetails?.state=selectedMotherStateEntity;
    parentInfo?.motherDetails?.city=selectedMotherCityEntity;

    parentInfo?.guardianDetails?.firstName=guardianFirstNameController.text.trim();
    parentInfo?.guardianDetails?.lastName=guardianLastNameController.text.trim();
    parentInfo?.guardianDetails?.aadharNumber= guardianAdharCardController.text.trim();
    parentInfo?.guardianDetails?.panNumber=guardianPanCardController.text.trim();
    parentInfo?.guardianDetails?.qualification=guardianQualificationController.text.trim();
    parentInfo?.guardianDetails?.organizationName=guardianOrganizationNameController.text.trim();
    parentInfo?.guardianDetails?.designation=guardianDesignationController.text.trim();
    parentInfo?.guardianDetails?.officeAddress=guardianOfficeAddressController.text.trim();
    parentInfo?.guardianDetails?.pincode=guardianPinCodeController.text.trim();
    parentInfo?.guardianDetails?.emailId=guardianEmailController.text.trim();
    parentInfo?.guardianDetails?.mobileNumber=guardianMobileController.text.trim();
    parentInfo?.guardianDetails?.occupation=guardianOccupation;
    parentInfo?.guardianDetails?.country=selectedGuardianCountryEntity;
    parentInfo?.guardianDetails?.state=selectedGuardianStateEntity;
    parentInfo?.guardianDetails?.city=selectedGuardianCityEntity;
    parentInfoEntity =parentInfoEntity.restore(parentInfo??ParentInfo());
    await updateParentDetail(enquiryId, parentInfoEntity);
  }
  Future<void>saveMedicalDetails(String enquiryId) async{
    MedicalDetailsEntity medicalDetailsEntity = MedicalDetailsEntity();
    medicalDetails?.isChildHospitalised = radioButtonController4.selectedItem == "Yes" ? true : false;
    medicalDetails?.yearOfHospitalization = medicalDetails?.isChildHospitalised??false ? yearOfHospitalizationController.text.trim() : "";
    medicalDetails?.reasonOfHopitalization = medicalDetails?.isChildHospitalised??false ? reasonOfHospitalizationController.text.trim() : "";
    medicalDetails?.hasPhysicalDisability = radioButtonController5.selectedItem == "Yes" ? true : false;
    medicalDetails?.physicalDisabilityDescription = medicalDetails?.hasPhysicalDisability??false ? specificDisabilityController.text.trim() : "";
    medicalDetails?.hasMedicalHistory = radioButtonController7.selectedItem == "Yes" ? true : false;
    medicalDetails?.hasAllergy = radioButtonController8.selectedItem == "Yes" ? true : false;
    medicalDetails?.hasPersonalisedLearningNeeds = radioButtonController9.selectedItem == "Yes" ? true : false;
    medicalDetails?.bloodGroup = selectedBloodGroupEntity;
    medicalDetails?.medicalHistoryDescription = medicalDetails?.hasMedicalHistory??false ? specifyMedicalHistoryController.text.trim() : "";
    medicalDetails?.allergyDescription = medicalDetails?.hasAllergy??false ? specifyAllergiesController.text.trim() : "";
    medicalDetails?.personalisedLearningNeedsDescription = medicalDetails?.hasPersonalisedLearningNeeds??false ? personalisedLearningNeedsController.text.trim() : ""; 
    medicalDetailsEntity = medicalDetailsEntity.restore(medicalDetails!);
    await updateMedicalDetail(enquiryId,medicalDetailsEntity);
  }
  Future<void>saveBankDetails(String enquiryId)async{
    BankDetailsEntity bankDetailsEntity = BankDetailsEntity();
    bankDetails?.ifscCode = ifscCodeController.text.trim();
    bankDetails?.bankName = bankNameController.text.trim();
    bankDetails?.branchName = branchNameController.text.trim();
    bankDetails?.accountHolderName = accountHolderNameController.text.trim();
    bankDetails?.accountType = accountTypeController.text.trim();
    bankDetails?.accountNumber = accountNumberController.text.trim();
    bankDetails?.upiInfo = upiController.text.trim();
    bankDetailsEntity = bankDetailsEntity.restore(bankDetails??BankDetails());
    await updateBankDetail(enquiryId,bankDetailsEntity);
  }
  Future<void>saveContactDetails(String enquiryId)async{
    ContactDetailsEntity contactDetail =ContactDetailsEntity();
    contactDetails ??= ContactDetails(
      residentialAddress: ResidentialAddress(
        house : houseOrBuildingController.text.trim(),
        street : streetNameController.text.trim(),
        landmark : landMarkController.text.trim(),
        country : residentialCountry,
        state : residentialState,
        city : residentialCity,
        pinCode : residentialPinCode,
        isPermanentAddress: radioButtonController3.selectedItem == "Yes" ? true : false
      ),
      emergencyContact: EmergencyContact(emergencyContact: emergencyContact),
      pointOfContact: [
        PointOfContactDetail(
          parentType: contactParentType1,
          parentContactNumber: parentMobileNumberController1.text.trim(),
          parentEmailId: parentEmailIdController1.text.trim(),
        ),
        PointOfContactDetail(
          parentType: contactParentType2,
          parentContactNumber: parentMobileNumberController2.text.trim(),
        )
      ]
    );
    contactDetail=contactDetail.restore(contactDetails??ContactDetails());
    await updateContactDetail(enquiryId,contactDetail);
  }

  Future<void> saveStudentDetail() async{
    if((enquiryDetailArgs?.enquiryType??'') == "IVT"){
      IvtDetailResponseEntity ivtDetail = IvtDetailResponseEntity();
      ivtDetailSubject?.value.schoolLocation = selectedSchoolLocationEntity;
      ivtDetailSubject?.value.studentDetails?.firstName = studentFirstNameController.text.trim(); 
      ivtDetailSubject?.value.studentDetails?.lastName = studentLastNameController.text.trim(); 
      ivtDetailSubject?.value.studentDetails?.dob = DateFormat('dd-MM-yyyy').format(DateFormat("dd/MM/yyyy").parse(dobController.text));
      newAdmissionDetailSubject?.value.studentDetails?.placeOfBirth = placeOfBirthController.text.trim();
      newAdmissionDetailSubject?.value.studentDetails?.religion = religionController.text.trim();
      newAdmissionDetailSubject?.value.studentDetails?.caste = casteController.text.trim();
      newAdmissionDetailSubject?.value.studentDetails?.subCaste = subCasteController.text.trim();
      newAdmissionDetailSubject?.value.studentDetails?.nationality = nationalityController.text.trim();
      newAdmissionDetailSubject?.value.studentDetails?.motherTongue = motherTongueController.text.trim();
      ivtDetailSubject?.value.studentDetails?.gender = selectedGenderEntity;
      ivtDetailSubject?.value.studentDetails?.grade = selectedGradeEntity;
      ivtDetailSubject?.value.existingSchoolDetails?.name = existingSchoolNameController.text;
      ivtDetailSubject?.value.existingSchoolDetails?.grade = selectedExistingSchoolGradeEntity;
      ivtDetailSubject?.value.existingSchoolDetails?.board = selectedExistingSchoolGradeEntity;
      ivtDetailSubject?.value.board = selectedBoardEntity;
      ivtDetailSubject?.value.course = selectedCourseEntity;
      ivtDetailSubject?.value.stream = selectedStreamEntity;
      ivtDetailSubject?.value.shift = selectedShiftEntity;
      ivtDetailSubject?.value.enquirerParent = selectedParentTypeSubject.value;
      ivtDetailSubject?.value.parentDetails?.fatherDetails?.firstName = studentsFatherFirstNameController.text.trim();
      ivtDetailSubject?.value.parentDetails?.fatherDetails?.lastName = studentsFatherLastNameController.text.trim();
      ivtDetailSubject?.value.parentDetails?.fatherDetails?.mobile = studentsFatherContactController.text.trim();
      ivtDetailSubject?.value.parentDetails?.fatherDetails?.email = studentsFatherEmailController.text.trim();
      ivtDetailSubject?.value.parentDetails?.motherDetails?.firstName = studentsMotherFirstNameController.text.trim();
      ivtDetailSubject?.value.parentDetails?.motherDetails?.lastName = studentsMotherLastNameController.text.trim();
      ivtDetailSubject?.value.parentDetails?.motherDetails?.mobile = studentsMotherContactController.text.trim();
      ivtDetailSubject?.value.parentDetails?.motherDetails?.email = studentsMotherEmailController.text.trim();
      ivtDetail = ivtDetail.restore(ivtDetailSubject!.value);
      updateIvtDetails(enquiryID: enquiryDetailArgs?.enquiryId??'', ivtDetail: ivtDetail);
    }
    else if((enquiryDetailArgs?.enquiryType??'') == "PSA"){
      PsaDetailResponseEntity psaDetail = PsaDetailResponseEntity();
      psaDetailSubject?.value.schoolLocation = selectedSchoolLocationEntity;
      psaDetailSubject?.value.studentDetails?.firstName = studentFirstNameController.text.trim(); 
      psaDetailSubject?.value.studentDetails?.lastName = studentLastNameController.text.trim(); 
      psaDetailSubject?.value.studentDetails?.dob = DateFormat('dd-MM-yyyy').format(DateFormat("dd/MM/yyyy").parse(dobController.text));
      psaDetailSubject?.value.studentDetails?.placeOfBirth = placeOfBirthController.text.trim();
      psaDetailSubject?.value.studentDetails?.religion = religionController.text.trim();
      psaDetailSubject?.value.studentDetails?.caste = casteController.text.trim();
      psaDetailSubject?.value.studentDetails?.subCaste = subCasteController.text.trim();
      psaDetailSubject?.value.studentDetails?.nationality = nationalityController.text.trim();
      psaDetailSubject?.value.studentDetails?.motherTongue = motherTongueController.text.trim();
      psaDetailSubject?.value.studentDetails?.gender = selectedGenderEntity;
      psaDetailSubject?.value.studentDetails?.grade = selectedGradeEntity;
      psaDetailSubject?.value.existingSchoolDetails?.name =  existingSchoolNameController.text.trim();
      psaDetailSubject?.value.existingSchoolDetails?.grade = selectedExistingSchoolGradeEntity;
      psaDetailSubject?.value.existingSchoolDetails?.board = selectedExistingSchoolBoardEntity;
      psaDetailSubject?.value.psaBatch = selectedPsaBatchEntity;
      psaDetailSubject?.value.psaCategory = selectedPsaCategoryEntity;
      psaDetailSubject?.value.psaSubCategory = selectedPsaSubCategoryEntity;
      psaDetailSubject?.value.psaSubType = selectedPsaSubTypeEntity;
      psaDetailSubject?.value.psaPeriodOfService = selectedPeriodOfServiceEntity;
      psaDetailSubject?.value.enquirerParent = selectedParentTypeSubject.value;
      psaDetailSubject?.value.parentDetails?.fatherDetails?.firstName = studentsFatherFirstNameController.text.trim();
      psaDetailSubject?.value.parentDetails?.fatherDetails?.lastName = studentsFatherLastNameController.text.trim();
      psaDetailSubject?.value.parentDetails?.fatherDetails?.mobile = studentsFatherContactController.text.trim();
      psaDetailSubject?.value.parentDetails?.fatherDetails?.email = studentsFatherEmailController.text.trim();
      psaDetailSubject?.value.parentDetails?.motherDetails?.firstName = studentsMotherFirstNameController.text.trim();
      psaDetailSubject?.value.parentDetails?.motherDetails?.lastName = studentsMotherLastNameController.text.trim();
      psaDetailSubject?.value.parentDetails?.motherDetails?.mobile = studentsMotherContactController.text.trim();
      psaDetailSubject?.value.parentDetails?.motherDetails?.email = studentsMotherEmailController.text.trim();
      psaDetail = psaDetail.restore(psaDetailSubject!.value);
      updatePsaDetails(enquiryID: enquiryDetailArgs?.enquiryId??'', psaDetail: psaDetail);
    }
    else{
      NewAdmissionDetailEntity newAdmissionDetail = NewAdmissionDetailEntity();
      newAdmissionDetailSubject?.value.schoolLocation = selectedSchoolLocationEntity!;
      newAdmissionDetailSubject?.value.studentDetails?.firstName = studentFirstNameController.text.trim(); 
      newAdmissionDetailSubject?.value.studentDetails?.lastName = studentLastNameController.text.trim(); 
      newAdmissionDetailSubject?.value.studentDetails?.dob = DateFormat('dd-MM-yyyy').format(DateFormat("dd/MM/yyyy").parse(dobController.text));
      newAdmissionDetailSubject?.value.studentDetails?.gender = selectedGenderEntity!;
      newAdmissionDetailSubject?.value.studentDetails?.grade = selectedGradeEntity!;
      newAdmissionDetailSubject?.value.studentDetails?.placeOfBirth = placeOfBirthController.text.trim();
      newAdmissionDetailSubject?.value.studentDetails?.religion = religionController.text.trim();
      newAdmissionDetailSubject?.value.studentDetails?.caste = casteController.text.trim();
      newAdmissionDetailSubject?.value.studentDetails?.subCaste = subCasteController.text.trim();
      newAdmissionDetailSubject?.value.studentDetails?.nationality = nationalityController.text.trim();
      newAdmissionDetailSubject?.value.studentDetails?.motherTongue = motherTongueController.text.trim();
      newAdmissionDetailSubject?.value.existingSchoolDetails?.name = existingSchoolNameController.text.trim();
      newAdmissionDetailSubject?.value.existingSchoolDetails?.grade = selectedExistingSchoolGradeEntity!;
      newAdmissionDetailSubject?.value.existingSchoolDetails?.board = selectedExistingSchoolBoardEntity!;
      newAdmissionDetailSubject?.value.enquirerParent = selectedParentTypeSubject.value;
      if(newAdmissionDetailSubject?.value.enquirerParent == "Father"){
        newAdmissionDetailSubject?.value.parentDetails?.fatherDetails?.firstName = studentsFatherFirstNameController.text.trim();
        newAdmissionDetailSubject?.value.parentDetails?.fatherDetails?.lastName = studentsFatherLastNameController.text.trim();
        newAdmissionDetailSubject?.value.parentDetails?.fatherDetails?.mobile = studentsFatherContactController.text.trim();
        newAdmissionDetailSubject?.value.parentDetails?.fatherDetails?.email = studentsFatherEmailController.text.trim();
      }
      else{
        newAdmissionDetailSubject?.value.parentDetails?.motherDetails?.firstName = studentsMotherFirstNameController.text.trim();
        newAdmissionDetailSubject?.value.parentDetails?.motherDetails?.lastName = studentsMotherLastNameController.text.trim();
        newAdmissionDetailSubject?.value.parentDetails?.motherDetails?.mobile = studentsMotherContactController.text.trim();
        newAdmissionDetailSubject?.value.parentDetails?.motherDetails?.email = studentsMotherEmailController.text.trim();
      }
      newAdmissionDetail = newAdmissionDetail.restore(newAdmissionDetailSubject!.value);
      updateNewAdmissionDetails(enquiryID: enquiryDetailArgs?.enquiryId??'', newAdmissionDetail: newAdmissionDetail);
    }
  }

  showPopUP(context){
    Future.delayed(Duration.zero, ()
    {
      CommonPopups().showSuccess(
          context,
          'Student Registered Successfully',
              (shouldRoute) {
            Navigator.pop(context);

          });
    });
  }
}