import 'dart:async';

import 'dart:io';
import 'dart:typed_data';

import 'package:app/di/states/viewmodels.dart';
import 'package:app/errors/flutter_toast_error_presenter.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/feature/payments/payments_pages/payments.dart';
import 'package:app/myapp.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_radio_button.dart/common_radio_button.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/enums/enquiry_enum.dart';
import 'package:app/utils/permission_handler.dart';
import 'package:app/utils/string_extension.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'package:flutter_errors/flutter_errors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:open_filex/open_filex.dart';
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
  final GetSiblingDetailsUsecase getSiblingDetailsUsecase;
  final SelectOptionalSubjectUsecase selectOptionalSubjectUsecase;
  final AddVasOptionUsecase addVasOptionUsecase;
  final RemoveVasDetailUsecase removeVasDetailUsecase;
  final MakePaymentRequestUsecase makePaymentRequestUsecase;
  final GetSubjectListUsecase getSubjectListUsecase;
  final GetCityStateByPincodeUsecase getCityStateByPincodeUsecase;
  final ChooseFileUseCase chooseFileUseCase;
  final FlutterToastErrorPresenter flutterToastErrorPresenter;
  final GetAdmissionVasUsecase getAdmissionVasUsecase;

  RegistrationsDetailsViewModel(
      this.exceptionHandlerBinder,
      this.getRegistrationDetailUsecase,
      this.getNewAdmissionDetailUseCase,
      this.getIvtDetailUsecase,
      this.getPsaDetailUsecase,
      this.getEnquiryDetailUseCase,
      this.updateParentDetailsUsecase,
      this.updateMedicalDetailsUsecase,
      this.updateBankDetailsUsecase,
      this.updateContactDetailsUsecase,
      this.updatePsaDetailUsecase,
      this.updateIvtDetailUsecase,
      this.updateNewAdmissionUsecase,
      this.getMdmAttributeUsecase,
      this.downloadEnquiryDocumentUsecase,
      this.uploadEnquiryDocumentUsecase,
      this.deleteEnquiryDocumentUsecase,
      this.downloadFileUsecase,
      this.getSiblingDetailsUsecase,
      this.selectOptionalSubjectUsecase,
      this.addVasOptionUsecase,
      this.removeVasDetailUsecase,
      this.makePaymentRequestUsecase,
      this.getSubjectListUsecase,
      this.getCityStateByPincodeUsecase,
      this.chooseFileUseCase,
      this.flutterToastErrorPresenter,
      this.moveToNextStageUsecase,
      this.getAdmissionVasUsecase);

  List registrationDetails = [
    {'name': 'Enquiry & Student Details', 'isSelected': false, 'infoType': ''},
    {'name': 'Parent Info', 'isSelected': false, 'infoType': 'ParentInfo'},
    {'name': 'Contact Info', 'isSelected': false, 'infoType': 'ContactInfo'},
    {'name': 'Medical Details', 'isSelected': false, 'infoType': 'MedicalInfo'},
    {'name': 'Bank Details', 'isSelected': false, 'infoType': 'BankInfo'},
    {'name': 'Upload Docs', 'isSelected': false, 'infoType': ''}
  ];

  final List menuData = [
    {
      'id': 1,
      'image': AppImages.schoolTour,
      'name': "School Tour",
      'key': 'schooltour',
      'isActive': true
    },
    {
      'id': 2,
      'image': AppImages.payments,
      'name': "Payments",
      'key': 'payments',
      'isActive': true
    },
    {
      'id': 3,
      'image': AppImages.call,
      'name': "Call",
      'key': 'call',
      'isActive': true
    },
    {
      'id': 4,
      'image': AppImages.email,
      'name': "Email",
      'key': 'email',
      'isActive': true
    },
    {
      'id': 5,
      'image': AppImages.editDetails,
      'name': "Edit Details",
      'key': 'registration',
      'isActive': true
    },
    {
      'id': 6,
      'image': AppImages.bookTest,
      'name': "Book Test",
      'key': 'competency',
      'isActive': true
    },
    {
      'id': 7,
      'image': AppImages.timeline,
      'name': "Timeline",
      'key': 'timeline',
      'isActive': true
    },
  ];

  // final List<String> occupation=['Government','Private','Business'];
  final List<String> area = ['Metro', 'Urban', 'SubUrban', 'Town'];
  // final List<String> country=['India','Pakistan','Nepal','Bangladesh'];
  // final List<String> state=['Maharashtra','Gujarat','Madhya Pradesh'];
  // final List<String> city=['Mumbai, Ahmedabad, Nagpur'];
  final List<String> grade = ['A', 'B', 'C', 'D'];
  final List<String> contactRelationshipOptions = [
    'Father',
    'Mother',
    'Guardian',
    'Other',
  ];
  final List<String> pinCodeOptions = [
    '400001',
    '560001',
    '600001',
  ];

  BuildContext? context;

  ScrollController controller = ScrollController();

  final PermissionHandlerService permissionHandler = PermissionHandlerService();

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
  final PublishSubject<Resource<ParentInfo>> parentDetail = PublishSubject();
  final PublishSubject<Resource<ContactDetails>> contactDetail =
      PublishSubject();
  final PublishSubject<Resource<MedicalDetails>> medicalDetail =
      PublishSubject();
  final PublishSubject<Resource<BankDetails>> bankDetail = PublishSubject();
  final BehaviorSubject<Resource<SiblingProfileResponse>> siblingDetail =
      BehaviorSubject();

  final PublishSubject<Resource<NewAdmissionBase>> _newAdmissionDetails =
      PublishSubject();
  Stream<Resource<NewAdmissionBase>> get newAdmissionDetails =>
      _newAdmissionDetails.stream;
  PublishSubject<Resource<IVTDetail>> ivtDetails = PublishSubject();
  PublishSubject<Resource<PSADetail>> psaDetails = PublishSubject();
  final PublishSubject<Resource<EnquiryDetailBase>> _enquiryDetail =
      PublishSubject();
  Stream<Resource<EnquiryDetailBase>> get enquiryDetail =>
      _enquiryDetail.stream;
  BehaviorSubject<NewAdmissionDetail>? newAdmissionDetailSubject =
      BehaviorSubject<NewAdmissionDetail>.seeded(NewAdmissionDetail());
  BehaviorSubject<IVTDetail>? ivtDetailSubject =
      BehaviorSubject<IVTDetail>.seeded(IVTDetail());
  BehaviorSubject<PSADetail>? psaDetailSubject =
      BehaviorSubject<PSADetail>.seeded(PSADetail());
  PublishSubject<Resource<EnquiryFileUploadBase>> uploadEnquiryFile =
      PublishSubject();
  PublishSubject<Resource<DeleteEnquiryFileBase>> deleteEnquiryFile =
      PublishSubject();
  PublishSubject<Resource<DownloadEnquiryFileBase>> getEnquiryFile =
      PublishSubject();

  PublishSubject<Resource<SubjectDetailResponse>> selectOptionalSubject =
      PublishSubject();
  PublishSubject<Resource<VasOptionResponse>> vasOptionSubject =
      PublishSubject();
  final PublishSubject<Resource<SubjectListResponse>> _getSubjectList =
      PublishSubject();
  Stream<Resource<SubjectListResponse>> get getSubjectList =>
      _getSubjectList.stream;

  List<SubjectModel> subjects = [];
  BehaviorSubject<List<String>> complusorySubjectList =
      BehaviorSubject.seeded([]);
  BehaviorSubject<List<String>> optionalSubject = BehaviorSubject.seeded([]);
  BehaviorSubject<String> selectedSubject = BehaviorSubject.seeded("");
  List optionalSubjects = [];
  BehaviorSubject<String> selectedOptionalSubject = BehaviorSubject.seeded('');

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
  TextEditingController fatherOfficeAreaController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  FocusNode pinCodeFocusNode = FocusNode();
  TextEditingController fatherEmailController = TextEditingController();
  TextEditingController fatherMobileController = TextEditingController();
  String? fatherOccupation;
  String? fatherArea;
  CommonDataClass? selectedFatherOccupation;
  CommonDataClass? selectedFatherQualification;
  CommonDataClass? selectedFatherDesignation;
  CommonDataClass? selectedFatherOrganization;
  CommonDataClass? selectedFatherCountryEntity;
  CommonDataClass? selectedFatherStateEntity;
  CommonDataClass? selectedFatherCityEntity;

//motherEditController
  TextEditingController motherFirstNameController = TextEditingController();
  TextEditingController motherLastNameController = TextEditingController();
  TextEditingController motherAdharCardController = TextEditingController();
  TextEditingController motherPanCardController = TextEditingController();
  TextEditingController motherQualificationController = TextEditingController();
  TextEditingController motherOrganizationNameController =
      TextEditingController();
  TextEditingController motherDesignationController = TextEditingController();
  TextEditingController motherOfficeAddressController = TextEditingController();
  TextEditingController motherOfficeAreaController = TextEditingController();
  TextEditingController motherPinCodeController = TextEditingController();
  FocusNode motherPinCodeFocusNode = FocusNode();
  TextEditingController motherEmailController = TextEditingController();
  TextEditingController motherMobileController = TextEditingController();
  String? motherOccupation;
  String? motherArea;
  CommonDataClass? selectedMotherOccupation;
  CommonDataClass? selectedMotherQualification;
  CommonDataClass? selectedMotherDesignation;
  CommonDataClass? selectedMotherOrganization;
  CommonDataClass? selectedMotherCountryEntity;
  CommonDataClass? selectedMotherStateEntity;
  CommonDataClass? selectedMotherCityEntity;

//guardianEditDetails
  TextEditingController guardianFirstNameController = TextEditingController();
  TextEditingController guardianLastNameController = TextEditingController();
  TextEditingController guardianAdharCardController = TextEditingController();
  TextEditingController guardianPanCardController = TextEditingController();
  TextEditingController guardianHouseNumberController = TextEditingController();
  TextEditingController guardianStreetController = TextEditingController();
  TextEditingController guardianLandmarkController = TextEditingController();
  TextEditingController guardianPinCodeController = TextEditingController();
  FocusNode guardianPinCodeFocusNode = FocusNode();
  TextEditingController guardianEmailController = TextEditingController();
  TextEditingController guardianMobileController = TextEditingController();
  CommonDataClass? selectedRelationWithChildEntity;
  CommonDataClass? selectedGuardianCountryEntity;
  CommonDataClass? selectedGuardianStateEntity;
  CommonDataClass? selectedGuardianCityEntity;
  BehaviorSubject<String> selectedRelationWithChildSubject =
      BehaviorSubject.seeded('');

//siblingsEditDetails
  TextEditingController siblingFirstNameController = TextEditingController();
  TextEditingController siblingLastNameController = TextEditingController();
  TextEditingController siblingsEnrollmentController = TextEditingController();
  TextEditingController siblingsSchoolController = TextEditingController();
  TextEditingController siblingDOBController = TextEditingController();
  FocusNode enrollmentNode = FocusNode();
  BehaviorSubject<String> siblingGender = BehaviorSubject.seeded('');
  BehaviorSubject<String> siblingGrade = BehaviorSubject.seeded('');
  CommonDataClass? selectedSiblingGender;
  CommonDataClass? selectedSiblingGrade;
  DateTime? siblingDOB;

  //ResidentialDetails
  TextEditingController houseOrBuildingController = TextEditingController();
  TextEditingController streetNameController = TextEditingController();
  TextEditingController landMarkController = TextEditingController();
  TextEditingController residentialPinCodeController = TextEditingController();
  FocusNode residentialPinCodeFocusNode = FocusNode();
  TextEditingController permanentHouseOrBuildingController =
      TextEditingController();
  TextEditingController permanentStreetNameController = TextEditingController();
  TextEditingController permanentLandMarkController = TextEditingController();
  TextEditingController permanentResidentialPinCodeController =
      TextEditingController();
  FocusNode permanentPinCodeFocusNode = FocusNode();
  TextEditingController parentEmailIdController1 = TextEditingController();
  TextEditingController parentMobileNumberController1 = TextEditingController();
  TextEditingController parentEmailIdController2 = TextEditingController();
  TextEditingController parentMobileNumberController2 = TextEditingController();
  TextEditingController parentEmailIdController3 = TextEditingController();
  TextEditingController parentMobileNumberController3 = TextEditingController();
  BehaviorSubject<String> contactParentTypePhone1 = BehaviorSubject.seeded('');
  BehaviorSubject<String> contactParentTypeEmail1 = BehaviorSubject.seeded('');
  BehaviorSubject<String> contactParentTypePhone2 = BehaviorSubject.seeded('');
  BehaviorSubject<String> contactParentTypeEmail2 = BehaviorSubject.seeded('');
  BehaviorSubject<String> contactParentTypePhone3 = BehaviorSubject.seeded('');
  BehaviorSubject<String> contactParentTypeEmail3 = BehaviorSubject.seeded('');
  BehaviorSubject<String> emergencyContact = BehaviorSubject<String>.seeded('');
  CommonDataClass? residentialCountry;
  CommonDataClass? residentialState;
  CommonDataClass? residentialCity;
  CommonDataClass? permanentResidentialCountry;
  CommonDataClass? permanentResidentialState;
  CommonDataClass? permanentResidentialCity;
  String? residentialPinCode;
  BehaviorSubject<String> selectedResidentialCity = BehaviorSubject.seeded('');
  BehaviorSubject<String> selectedResidentialState = BehaviorSubject.seeded('');
  BehaviorSubject<String> selectedResidentialCountry =
      BehaviorSubject.seeded('');
  BehaviorSubject<String> selectedPermanentResidentialCity =
      BehaviorSubject.seeded('');
  BehaviorSubject<String> selectedPermanentResidentialState =
      BehaviorSubject.seeded('');
  BehaviorSubject<String> selectedPermanentResidentialCountry =
      BehaviorSubject.seeded('');
  //YearOfHospitalization
  TextEditingController yearOfHospitalizationController =
      TextEditingController();
  TextEditingController reasonOfHospitalizationController =
      TextEditingController();
  TextEditingController specificDisabilityController = TextEditingController();
  TextEditingController specifyMedicalHistoryController =
      TextEditingController();
  TextEditingController specifyAllergiesController = TextEditingController();
  TextEditingController personalisedLearningNeedsController =
      TextEditingController();
  BehaviorSubject<String> selectedBloodGroup = BehaviorSubject.seeded('');
  BehaviorSubject<String> selectedPersonalisedLearningNeedSubject =
      BehaviorSubject.seeded('');
  TextEditingController schoolLocationController = TextEditingController();
  //BankDetails
  TextEditingController ifscCodeController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController branchNameController = TextEditingController();
  TextEditingController accountHolderNameController = TextEditingController();
  TextEditingController accountTypeController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController upiController = TextEditingController();

  //New Admission Details
  TextEditingController enquiryDateController = TextEditingController();
  TextEditingController enquiryNumberController = TextEditingController();
  TextEditingController enquiryTypeController = TextEditingController();
  TextEditingController studentFirstNameController = TextEditingController();
  TextEditingController studentLastNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController existingSchoolNameController = TextEditingController();
  // TextEditingController fatherGlobalIdController = TextEditingController();
  // TextEditingController motherGlobalIdController = TextEditingController();
  TextEditingController parentTypeController = TextEditingController();
  TextEditingController studentEligibleGradeController =
      TextEditingController();
  TextEditingController studentAadharController = TextEditingController();
  BehaviorSubject<String> selectedReligionSubject = BehaviorSubject.seeded('');
  BehaviorSubject<String> selectedCasteSubject = BehaviorSubject.seeded('');
  BehaviorSubject<String> selectedSubCasteSubject = BehaviorSubject.seeded('');
  BehaviorSubject<String> selectedMotherTongueSubject =
      BehaviorSubject.seeded('');
  BehaviorSubject<String> selectedNationalitySubject =
      BehaviorSubject.seeded('');
  CommonDataClass? selectedReligion;
  CommonDataClass? selectedCaste;
  CommonDataClass? selectedSubCaste;
  CommonDataClass? selectedMotherTongue;
  CommonDataClass? selectedNationality;
  TextEditingController studentsFatherFirstNameController =
      TextEditingController();
  TextEditingController studentsFatherLastNameController =
      TextEditingController();
  TextEditingController studentsFatherContactController =
      TextEditingController();
  TextEditingController studentsFatherEmailController = TextEditingController();
  TextEditingController studentsMotherFirstNameController =
      TextEditingController();
  TextEditingController studentsMotherLastNameController =
      TextEditingController();
  TextEditingController studentsMotherContactController =
      TextEditingController();
  TextEditingController studentsMotherEmailController = TextEditingController();
  DateTime? studentDob;

  //PSA-specific controllers
  BehaviorSubject<String> psaSubTypeSubject =
      BehaviorSubject<String>.seeded('');
  BehaviorSubject<String> psaCategorySubject =
      BehaviorSubject<String>.seeded('');
  BehaviorSubject<String> psaSubCategorySubject =
      BehaviorSubject<String>.seeded('');
  BehaviorSubject<String> periodOfServiceSubject =
      BehaviorSubject<String>.seeded('');
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

  final BehaviorSubject<String> selectedGradeSubject =
      BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedSchoolLocationSubject =
      BehaviorSubject<String>.seeded('');
  final BehaviorSubject<MdmAttributeModel?>
      selectedSchoolLocationSubjectAttribute =
      BehaviorSubject<MdmAttributeModel>.seeded(MdmAttributeModel());
  final BehaviorSubject<String> selectedExistingSchoolGradeSubject =
      BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedExistingSchoolBoardSubject =
      BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedParentTypeSubject =
      BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedGenderSubject =
      BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedGuardianCountrySubject =
      BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedGuardianStateSubject =
      BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedGuardianCitySubject =
      BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedGuardianAreaSubject =
      BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedGuardianOccupationSubject =
      BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedGuardianQualificationSubject =
      BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedGuardianDesignationSubject =
      BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedGuardianOrganizationSubject =
      BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedFatherCountrySubject =
      BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedFatherStateSubject =
      BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedFatherCitySubject =
      BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedFatherOccupationSubject =
      BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedFatherQualificationSubject =
      BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedFatherDesignationSubject =
      BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedFatherOrganizationSubject =
      BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedFatherAreaSubject =
      BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedMotherCountrySubject =
      BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedMotherStateSubject =
      BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedMotherCitySubject =
      BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedMotherAreaSubject =
      BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedMotherOccupationSubject =
      BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedMotherQualificationSubject =
      BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedMotherDesignationSubject =
      BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedMotherOrganizationSubject =
      BehaviorSubject<String>.seeded('');
  final BehaviorSubject<bool> selectedGenerType =
      BehaviorSubject<bool>.seeded(false);
  final BehaviorSubject<List<String>> schoolLocationTypes =
      BehaviorSubject<List<String>>.seeded([]);
  final BehaviorSubject<List<String>> castes =
      BehaviorSubject<List<String>>.seeded([]);
  final BehaviorSubject<List<String>> subCastes =
      BehaviorSubject<List<String>>.seeded([]);
  final BehaviorSubject<List<String>> motherTongues =
      BehaviorSubject<List<String>>.seeded([]);
  final BehaviorSubject<List<String>> religions =
      BehaviorSubject<List<String>>.seeded([]);
  final BehaviorSubject<List<String>> nationalities =
      BehaviorSubject.seeded([]);

  final List<String> parentType = ["Mother", "Father"];

  final BehaviorSubject<List<String>> existingSchoolGrade =
      BehaviorSubject<List<String>>.seeded([]);
  final BehaviorSubject<List<String>> existingSchoolBoard =
      BehaviorSubject<List<String>>.seeded([]);
  final BehaviorSubject<List<String>> gradeTypes =
      BehaviorSubject<List<String>>.seeded([]);

  final BehaviorSubject<List<String>> psaSubType =
      BehaviorSubject<List<String>>.seeded([]);
  final BehaviorSubject<List<String>> psaSubCategory =
      BehaviorSubject<List<String>>.seeded([]);
  final BehaviorSubject<List<String>> psaCategory =
      BehaviorSubject<List<String>>.seeded([]);
  final BehaviorSubject<List<String>> periodOfService =
      BehaviorSubject<List<String>>.seeded([]);
  final BehaviorSubject<List<String>> psaBatch =
      BehaviorSubject<List<String>>.seeded([]);

  final BehaviorSubject<List<String>> gender =
      BehaviorSubject<List<String>>.seeded([]);

  final BehaviorSubject<List<String>> stream =
      BehaviorSubject<List<String>>.seeded([]);
  final BehaviorSubject<List<String>> course =
      BehaviorSubject<List<String>>.seeded([]);
  final BehaviorSubject<List<String>> shift =
      BehaviorSubject<List<String>>.seeded([]);
  final BehaviorSubject<List<String>> country =
      BehaviorSubject<List<String>>.seeded([]);
  final BehaviorSubject<List<String>> state =
      BehaviorSubject<List<String>>.seeded([]);
  final BehaviorSubject<List<String>> city =
      BehaviorSubject<List<String>>.seeded([]);
  final BehaviorSubject<List<String>> bloodGroup =
      BehaviorSubject<List<String>>.seeded([]);
  final BehaviorSubject<List<String>> occupation =
      BehaviorSubject<List<String>>.seeded([]);
  final BehaviorSubject<List<String>> qualifications =
      BehaviorSubject.seeded([]);
  final BehaviorSubject<List<String>> designations = BehaviorSubject.seeded([]);
  final BehaviorSubject<List<String>> organizations =
      BehaviorSubject.seeded([]);
  final BehaviorSubject<List<String>> personalisedLearningNeeds =
      BehaviorSubject.seeded([]);
  final BehaviorSubject<List<String>> relationWithChild =
      BehaviorSubject.seeded([]);

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
  List<MdmAttributeModel>? occupationAttribute;
  List<MdmAttributeModel>? qualificationAttribute;
  List<MdmAttributeModel>? casteAttribute;
  List<MdmAttributeModel>? subCasteAttribute;
  List<MdmAttributeModel>? religionAttribute;
  List<MdmAttributeModel>? motherTongueAttribute;
  List<MdmAttributeModel>? designationAttribute;
  List<MdmAttributeModel>? organizationAttribute;
  List<MdmAttributeModel>? nationality;
  List<MdmAttributeModel>? personalisedLearningNeedsAttribute;
  List<MdmAttributeModel>? relationWithChildAttribute;

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
  CommonDataClass? selectedPersonalisedLearningNeed;

  List<ValueNotifier<bool>> isDocumentUploaded = [];

  EnquiryStage? getSchoolVisitStage() {
    return enquiryDetails?.enquiryStage?.firstWhere(
      (element) =>
          element.stageName?.toLowerCase().contains('school visit') ?? false,
      orElse: () => EnquiryStage(),
    );
  }

  EnquiryStage? getCompetencyStage() {
    return enquiryDetails?.enquiryStage?.firstWhere(
      (element) =>
          element.stageName?.toLowerCase().contains('competency test') ?? false,
      orElse: () => EnquiryStage(),
    );
  }

  bool isDetailView() {
    final schoolVisitStage = getSchoolVisitStage();
    return schoolVisitStage?.status?.toLowerCase() == "in progress";
  }

  bool isDetailViewCompetency() {
    final competencyStage = getCompetencyStage();
    return competencyStage?.status != "Open";
  }

  Future<void> fetchAllDetails(String enquiryID, String infoType) async {
    exceptionHandlerBinder.handle(block: () {
      GetRegistrationDetailUsecaseParams params =
          GetRegistrationDetailUsecaseParams(
              enquiryID: enquiryID, infoType: infoType);

      // parentDetail.add(Resource.loading());
      // contactDetail.add(Resource.loading());
      // medicalDetail.add(Resource.loading());
      // bankDetail.add(Resource.loading());

      RequestManager<SingleResponse>(
        params,
        createCall: () => getRegistrationDetailUsecase.execute(params: params),
      ).asFlow().listen((result) {
        if (result.status == Status.success) {
          if (infoType == 'ParentInfo') {
            parentDetail.add(Resource.success(data: result.data?.data));
            parentInfo = result.data?.data;
            addParentDetails(result.data?.data ?? ParentInfo());
          } else if (infoType == 'ContactInfo') {
            contactDetail.add(Resource.success(data: result.data?.data));
            contactDetails = result.data?.data;
            addContactDetails(result.data?.data ?? ContactDetails());
          } else if (infoType == 'MedicalInfo') {
            medicalDetail.add(Resource.success(data: result.data?.data));
            medicalDetails = result.data?.data;
            addMedicalDetails(result.data?.data ?? MedicalDetails());
          } else {
            bankDetail.add(Resource.success(data: result.data?.data));
            bankDetails = result.data?.data;
            addBankDetails(result.data?.data ?? BankDetails());
          }
          isLoading.value = false;
        }
        if (result.status == Status.error) {
          if (infoType == 'ParentInfo') {
            parentDetail.add(Resource.error());
          } else if (infoType == 'ContactInfo') {
            contactDetail.add(Resource.error());
          } else if (infoType == 'MedicalInfo') {
            medicalDetail.add(Resource.error());
          } else if (infoType == 'BankInfo') {
            bankDetail.add(Resource.error());
          }
          isLoading.value = false;
          flutterToastErrorPresenter.show(
              result.dealSafeAppError!.throwable,
              navigatorKey.currentContext!,
              result.dealSafeAppError?.error.message ?? '');
        }
      });
    }).execute();
  }

  Future<void> updateParentDetail(
      String enquiryID, ParentInfoEntity parentInfoEntity) async {
    exceptionHandlerBinder.handle(block: () {
      final params = UpdateParentDetailsUsecaseParams(
          enquiryID: enquiryID, parentInfo: parentInfoEntity);
      isLoading.value = true;
      RequestManager<SingleResponse>(params,
              createCall: () =>
                  updateParentDetailsUsecase.execute(params: params))
          .asFlow()
          .listen((result) {
        if (result.status == Status.success) {
          parentDetail.add(Resource.success(data: result.data?.data));
          parentInfo = result.data?.data;
          ProviderScope.containerOf(context!)
              .read(commonChipListProvider)
              .highlightIndex
              .add(ProviderScope.containerOf(context!)
                      .read(commonChipListProvider)
                      .highlightIndex
                      .value +
                  1);
          isLoading.value = false;
          showWidget.add(showWidget.value + 1);
          fetchAllDetails(enquiryID, "ContactInfo");
          controller.animateTo((showWidget.value + 1) * 50,
              duration: const Duration(milliseconds: 500),
              curve: Curves.linear);
          clearParentDetails();
        }
        if (result.status == Status.error) {
          isLoading.value = false;
          flutterToastErrorPresenter.show(
              result.dealSafeAppError!.throwable,
              navigatorKey.currentContext!,
              result.dealSafeAppError?.error.message ?? '');
        }
      });
    }).execute();
  }

  Future<void> selectOptionalSubjects(
    String enquiryID,
  ) async {
    exceptionHandlerBinder.handle(block: () {
      List<SubjectSelectionRequest> subjectList = [];
      subjects.forEach((element) {
        if (element.isCompulsory == 1) {
          subjectList.add(SubjectSelectionRequest(
            id: element.id,
            schoolId: element.schoolId,
            schoolBrandId: element.schoolBrandId,
            subjectId: element.subjectId,
            isCompulsory: element.isCompulsory,
            isOptionalCompulsory: element.isOptionalCompulsory,
            orderNo: element.orderNo,
            academicYearId: element.academicYearId,
            statusId: element.statusId,
            schoolName: element.schoolName,
            subjectName: element.subjectName,
            acYear: element.academicYear,
          ));
        }
      });
      subjects.forEach((element) {
        if (element.subjectName == selectedOptionalSubject.value) {
          subjectList.add(SubjectSelectionRequest(
            id: element.id,
            schoolId: element.schoolId,
            schoolBrandId: element.schoolBrandId,
            subjectId: element.subjectId,
            isCompulsory: element.isCompulsory,
            isOptionalCompulsory: element.isOptionalCompulsory,
            orderNo: element.orderNo,
            academicYearId: element.academicYearId,
            statusId: element.statusId,
            schoolName: element.schoolName,
            subjectName: element.subjectName,
            acYear: element.academicYear,
          ));
        }
      });
      SelectOptionalSubjectUsecaseParams params =
          SelectOptionalSubjectUsecaseParams(
              subjectSelectionRequest: subjectList, enquiryID: enquiryID);
      isLoading.value = true;
      RequestManager<SubjectDetailResponse>(params,
              createCall: () =>
                  selectOptionalSubjectUsecase.execute(params: params))
          .asFlow()
          .listen((result) {
        if (result.status == Status.success) {
          ProviderScope.containerOf(context!)
              .read(commonChipListProvider)
              .highlightIndex
              .add(ProviderScope.containerOf(context!)
                      .read(commonChipListProvider)
                      .highlightIndex
                      .value +
                  1);
          showWidget.add(showWidget.value + 1);
          controller.animateTo((showWidget.value + 1) * 50,
              duration: const Duration(milliseconds: 500),
              curve: Curves.linear);
          isLoading.value = false;
        }
        if (result.status == Status.error) {
          isLoading.value = false;
          flutterToastErrorPresenter.show(
              result.dealSafeAppError!.throwable,
              navigatorKey.currentContext!,
              result.dealSafeAppError?.error.message ?? '');
        }
      });
    }).execute();
  }

  Future<void> addVasOption(
    String enquiryID,
  ) async {
    exceptionHandlerBinder.handle(block: () {
      VasOptionRequest vasOptionRequest = VasOptionRequest(
        transport: radioButtonTransport.selectedItem == "Yes" ? true : false,
        kidsClub: radioButtonKidsClub.selectedItem == "Yes" ? true : false,
        psa: radioButtonPsa.selectedItem == "Yes" ? true : false,
        hostel: radioButtonHostel.selectedItem == "Yes" ? true : false,
        cafeteria: radioButtonCafeteria.selectedItem == "Yes" ? true : false,
      );
      AddVasOptionUsecaseParams params = AddVasOptionUsecaseParams(
          vasOptionRequest: vasOptionRequest, enquiryID: enquiryID);
      isLoading.value = true;
      RequestManager<VasOptionResponse>(params,
              createCall: () => addVasOptionUsecase.execute(params: params))
          .asFlow()
          .listen((result) {
        if (result.status == Status.success) {
          isLoading.value = false;
          showPopUP(context,
              message: "Admission Details Submitted Successfully");
        }
        if (result.status == Status.error) {
          isLoading.value = false;
          flutterToastErrorPresenter.show(
              result.dealSafeAppError!.throwable,
              navigatorKey.currentContext!,
              result.dealSafeAppError?.error.message ?? '');
        }
      });
    }).execute();
  }

  Future<void> fetchSubjectList() async {
    exceptionHandlerBinder.handle(block: () {
      GetSubjectListUsecaseParams params = GetSubjectListUsecaseParams(
          subjectListingRequest: SubjectListingRequest(
              streamId: enquiryDetails?.streamId,
              pageSize: 1000,
              schoolId: enquiryDetails?.schoolId,
              academicYearId: enquiryDetails?.academicYearId,
              brandId: 1,
              boardId: enquiryDetails?.boardId,
              termId: 1,
              gradeID: enquiryDetails?.gradeId));
      RequestManager<SubjectListResponse>(params,
              createCall: () => getSubjectListUsecase.execute(params: params))
          .asFlow()
          .listen((result) {
        _getSubjectList.add(result);
        if (result.status == Status.success) {
          subjects = result.data?.data?.data ?? [];
          for (var element in (result.data?.data?.data ?? [])) {
            if (element.isCompulsory == 1) {
              complusorySubjectList.value.add(element.subjectName ?? '');
            }
            if (element.isOptionalCompulsory == 1) {
              optionalSubject.value.add(element.subjectName ?? '');
            }
          }
          for (var element in optionalSubject.value) {
            optionalSubjects.add({"name": element, "isSelected": false});
          }
        }
        if (result.status == Status.error) {
          flutterToastErrorPresenter.show(
              result.dealSafeAppError!.throwable,
              navigatorKey.currentContext!,
              result.dealSafeAppError?.error.message ?? '');
        }
      });
    }).execute();
  }

  Future<void> removeVasDetail(String enquiryID, String vasOption) async {
    exceptionHandlerBinder.handle(block: () {
      RemoveVasDetailUsecaseParams params =
          RemoveVasDetailUsecaseParams(enquiryID: enquiryID, type: vasOption);
      isLoading.value = true;
      RequestManager<VasOptionResponse>(params,
              createCall: () => removeVasDetailUsecase.execute(params: params))
          .asFlow()
          .listen((result) {
        if (result.status == Status.success) {
          isLoading.value = false;
        }
        if (result.status == Status.error) {
          isLoading.value = false;
          flutterToastErrorPresenter.show(
              result.dealSafeAppError!.throwable,
              navigatorKey.currentContext!,
              result.dealSafeAppError?.error.message ?? '');
        }
      });
    }).execute();
  }

  Future<void> makePaymentRequest(String enquiryID) async {
    exceptionHandlerBinder.handle(block: () {
      MakePaymentRequestUsecaseParams params = MakePaymentRequestUsecaseParams(
        enquiryID: enquiryID,
      );
      isLoading.value = true;
      RequestManager<VasOptionResponse>(params,
              createCall: () =>
                  makePaymentRequestUsecase.execute(params: params))
          .asFlow()
          .listen((result) {
        if (result.status == Status.success) {
          isLoading.value = false;
          showPopUP(context,
              message: "Admission Details Submitted Successfully",
              callback: () {
            navigatorKey.currentState?.pushNamed(
              RoutePaths.payments,
              arguments: PaymentArguments(
                phoneNo: '',
                enquiryId: enquiryDetailArgs?.enquiryId,
                enquiryNo: enquiryDetailArgs?.enquiryNumber,
                studentName: "${enquiryDetailArgs?.studentName} ",
              ),
            );
          });
        }
        if (result.status == Status.error) {
          isLoading.value = false;
          flutterToastErrorPresenter.show(
              result.dealSafeAppError!.throwable,
              navigatorKey.currentContext!,
              result.dealSafeAppError?.error.message ?? '');
        }
      });
    }).execute();
  }

  Future<void> updateMedicalDetail(
      String enquiryID, MedicalDetailsEntity medicalEntity) async {
    exceptionHandlerBinder.handle(block: () {
      final params = UpdateMedicalDetailsUsecaseParams(
          enquiryID: enquiryID, medicalDetails: medicalEntity);
      isLoading.value = true;
      RequestManager<SingleResponse>(params,
              createCall: () =>
                  updateMedicalDetailsUsecase.execute(params: params))
          .asFlow()
          .listen((result) {
        if (result.status == Status.success) {
          medicalDetail.add(Resource.success(data: result.data?.data));
          medicalDetails = result.data?.data;
          ProviderScope.containerOf(context!)
              .read(commonChipListProvider)
              .highlightIndex
              .add(ProviderScope.containerOf(context!)
                      .read(commonChipListProvider)
                      .highlightIndex
                      .value +
                  1);
          isLoading.value = false;
          fetchAllDetails(enquiryID, "BankInfo");
          showWidget.add(showWidget.value + 1);
          controller.animateTo((showWidget.value + 1) * 50,
              duration: const Duration(milliseconds: 500),
              curve: Curves.linear);
          clearMedicalDetails();
        }
        if (result.status == Status.error) {
          isLoading.value = false;
          flutterToastErrorPresenter.show(
              result.dealSafeAppError!.throwable,
              navigatorKey.currentContext!,
              result.dealSafeAppError?.error.message ?? '');
        }
      });
    }).execute();
  }

  Future<void> updateContactDetail(
      String enquiryID, ContactDetailsEntity contactInfoEntity) async {
    exceptionHandlerBinder.handle(block: () {
      final params = UpdateContactDetailsUsecaseParams(
          enquiryID: enquiryID, contactDetails: contactInfoEntity);
      isLoading.value = true;
      RequestManager<SingleResponse>(params,
              createCall: () =>
                  updateContactDetailsUsecase.execute(params: params))
          .asFlow()
          .listen((result) {
        if (result.status == Status.success) {
          contactDetail.add(Resource.success(data: result.data?.data));
          contactDetails = result.data?.data;
          ProviderScope.containerOf(context!)
              .read(commonChipListProvider)
              .highlightIndex
              .add(ProviderScope.containerOf(context!)
                      .read(commonChipListProvider)
                      .highlightIndex
                      .value +
                  1);
          isLoading.value = false;
          fetchAllDetails(enquiryID, "MedicalInfo");
          showWidget.add(showWidget.value + 1);
          controller.animateTo((showWidget.value + 1) * 50,
              duration: const Duration(milliseconds: 500),
              curve: Curves.linear);
          clearContactDetails();
        }
        if (result.status == Status.error) {
          isLoading.value = false;
          flutterToastErrorPresenter.show(
              result.dealSafeAppError!.throwable,
              navigatorKey.currentContext!,
              result.dealSafeAppError?.error.message ?? '');
        }
      });
    }).execute();
  }

  Future<void> updateBankDetail(
      String enquiryID, BankDetailsEntity bankDetailEntity) async {
    exceptionHandlerBinder.handle(block: () {
      final params = UpdateBankDetailsUsecaseParams(
          enquiryID: enquiryID, bankDetails: bankDetailEntity);
      isLoading.add(true);
      RequestManager<SingleResponse>(params,
              createCall: () =>
                  updateBankDetailsUsecase.execute(params: params))
          .asFlow()
          .listen((result) {
        if (result.status == Status.success) {
          bankDetail.add(Resource.success(data: result.data?.data));
          bankDetails = result.data?.data;
          ProviderScope.containerOf(context!)
              .read(commonChipListProvider)
              .highlightIndex
              .add(ProviderScope.containerOf(context!)
                      .read(commonChipListProvider)
                      .highlightIndex
                      .value +
                  1);
          isLoading.value = false;
          getEnquiryDetail(enquiryID: enquiryID);
          showWidget.add(showWidget.value + 1);
          controller.animateTo((showWidget.value + 1) * 50,
              duration: const Duration(milliseconds: 500),
              curve: Curves.linear);
          clearBankDetails();
        }
        if (result.status == Status.error) {
          isLoading.value = false;
          flutterToastErrorPresenter.show(
              result.dealSafeAppError!.throwable,
              navigatorKey.currentContext!,
              result.dealSafeAppError?.error.message ?? '');
        }
      });
    }).execute();
  }

  Future<void> getNewAdmissionDetails(
      {required String enquiryID, bool isEdit = false}) async {
    exceptionHandlerBinder.handle(block: () {
      GetNewAdmissionDetailUseCaseParams params =
          GetNewAdmissionDetailUseCaseParams(
        enquiryID: enquiryID,
      );

      RequestManager<NewAdmissionBase>(
        params,
        createCall: () => getNewAdmissionDetailUseCase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        _newAdmissionDetails.add(result);
        if (result.status == Status.success) {
          newAdmissionDetailSubject
              ?.add(result.data?.data ?? NewAdmissionDetail());
          if (isEdit) {
            addNewAdmissionDetails(result.data?.data ?? NewAdmissionDetail(),
                enquiryDetailArgs ?? EnquiryDetailArgs());
          }
        }
        if (result.status == Status.error) {
          isLoading.value = false;
          flutterToastErrorPresenter.show(
              result.dealSafeAppError!.throwable,
              navigatorKey.currentContext!,
              result.dealSafeAppError?.error.message ?? '');
        }
        // activeStep.add()
      });
    }).execute();
  }

  BehaviorSubject<String> siblingInitialGender = BehaviorSubject.seeded('');
  BehaviorSubject<String> siblingGrades = BehaviorSubject.seeded('');

  Future<void> getSiblingDetails({required String enrollmentNumber}) async {
    GetSiblingDetailRequest request = GetSiblingDetailRequest(
      enrollmentNumber: enrollmentNumber,
    );
    GetSiblingDetailsUsecaseParams params = GetSiblingDetailsUsecaseParams(
      getSiblingDetailRequest: request,
    );
    isLoading.value = true;
    exceptionHandlerBinder.handle(block: () {
      RequestManager(params,
          createCall: () =>
              getSiblingDetailsUsecase.execute(params: params)).asFlow().listen(
        (result) {
          if (result.status == Status.success) {
            siblingDetail.add(Resource.success(data: result.data));
            final siblingProfile = result.data?.data?.siblingProfile;
            siblingFirstNameController.text = siblingProfile?.firstName ?? '';
            siblingLastNameController.text = siblingProfile?.lastName ?? '';
            siblingsSchoolController.text = siblingProfile?.schoolName ?? "";
            siblingDOB = siblingProfile?.dob ?? DateTime.now();
            if (siblingProfile?.gender != null &&
                (siblingProfile?.gender ?? '').isNotEmpty) {
              final gender = genderAttribute?.firstWhere(
                  (e) => e.attributes?.name == siblingProfile?.gender);
              siblingInitialGender.value = gender?.attributes?.name ?? "";
              selectedSiblingGender = CommonDataClass(
                  id: gender?.id, value: gender?.attributes?.name);
            }
            if (siblingProfile?.gradeId != null) {
              final grade = gradeTypesAttribute
                  ?.firstWhere((e) => e.id == siblingProfile?.gradeId);
              siblingGrades.value = grade?.attributes?.name ?? "";
              selectedSiblingGrade = CommonDataClass(
                  id: grade?.id, value: grade?.attributes?.name);
            }
            isLoading.value = false;
          }
          if (result.status == Status.error) {
            isLoading.value = false;
            ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
                content: CommonText(
              text: '${result.dealSafeAppError?.error.message}',
            )));
          }
        },
        onDone: () {},
      );
    }).execute();
  }

  void onFormFieldSubmitted(String value) {
    if (value.isNotEmpty) {
      getSiblingDetails(enrollmentNumber: value);
    }
  }

  void addFocusNodeListener() {
    enrollmentNode.addListener(() {
      if (!enrollmentNode.hasFocus) {
        if (siblingsEnrollmentController.text.trim().isNotEmpty) {
          getSiblingDetails(
              enrollmentNumber: siblingsEnrollmentController.text.trim());
        }
      }
    });
  }

  Future<void> getIvtDetails(
      {required String enquiryID, bool isEdit = false}) async {
    exceptionHandlerBinder.handle(block: () {
      GetIvtDetailUsecaseParams params = GetIvtDetailUsecaseParams(
        enquiryID: enquiryID,
      );

      RequestManager<IVTBase>(
        params,
        createCall: () => getIvtDetailUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        ivtDetails
            .add(Resource.success(data: result.data?.data ?? IVTDetail()));
        if (isEdit) {
          addIvtDetails(result.data?.data ?? IVTDetail(),
              enquiryDetailArgs ?? EnquiryDetailArgs());
        }
        if (result.status == Status.error) {
          flutterToastErrorPresenter.show(
              result.dealSafeAppError!.throwable,
              navigatorKey.currentContext!,
              result.dealSafeAppError?.error.message ?? '');
        }
        // activeStep.add()
      });
    }).execute();
  }

  Future<void> getPsaDetails(
      {required String enquiryID, bool isEdit = false}) async {
    exceptionHandlerBinder.handle(block: () {
      GetPsaDetailUsecaseParams params = GetPsaDetailUsecaseParams(
        enquiryID: enquiryID,
      );

      RequestManager<PsaResponse>(
        params,
        createCall: () => getPsaDetailUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        psaDetails
            .add(Resource.success(data: result.data?.data ?? PSADetail()));
        if (isEdit) {
          addPsaDetails(result.data?.data ?? PSADetail(),
              enquiryDetailArgs ?? EnquiryDetailArgs());
        }
        if (result.status == Status.error) {
          flutterToastErrorPresenter.show(
              result.dealSafeAppError!.throwable,
              navigatorKey.currentContext!,
              result.dealSafeAppError?.error.message ?? '');
        }
        // activeStep.add()
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
        _enquiryDetail.add(result);
        if (result.status == Status.error) {
          flutterToastErrorPresenter.show(
              result.dealSafeAppError!.throwable,
              navigatorKey.currentContext!,
              result.dealSafeAppError?.error.message ?? '');
        }
        // activeStep.add()
      });
    }).execute();
  }

  Future<void> updatePsaDetails(
      {required String enquiryID,
      required PsaDetailResponseEntity psaDetail}) async {
    exceptionHandlerBinder.handle(block: () {
      UpdatePsaDetailUsecaseParams params = UpdatePsaDetailUsecaseParams(
          enquiryID: enquiryID, psaDetail: psaDetail);
      isLoading.value = true;
      RequestManager<PsaResponse>(
        params,
        createCall: () => updatePsaDetailUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        if (result.status == Status.success) {
          psaDetailSubject?.add(result.data?.data ?? PSADetail());
          isLoading.value = false;
          ProviderScope.containerOf(context!)
              .read(commonChipListProvider)
              .highlightIndex
              .add(ProviderScope.containerOf(context!)
                      .read(commonChipListProvider)
                      .highlightIndex
                      .value +
                  1);
          fetchAllDetails(enquiryID, "ParentInfo");
          showWidget.add(showWidget.value + 1);
          controller.animateTo((showWidget.value + 1) * 50,
              duration: const Duration(milliseconds: 500),
              curve: Curves.linear);
          clearPsaDetails();
        }
        if (result.status == Status.error) {
          isLoading.value = false;
          flutterToastErrorPresenter.show(
              result.dealSafeAppError!.throwable,
              navigatorKey.currentContext!,
              result.dealSafeAppError?.error.message ?? '');
        }
      });
    }).execute();
  }

  Future<void> updateIvtDetails(
      {required String enquiryID,
      required IvtDetailResponseEntity ivtDetail}) async {
    exceptionHandlerBinder.handle(block: () {
      UpdateIvtDetailUsecaseParams params = UpdateIvtDetailUsecaseParams(
          enquiryID: enquiryID, ivtDetail: ivtDetail);
      isLoading.value = true;
      RequestManager<IVTBase>(
        params,
        createCall: () => updateIvtDetailUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        if (result.status == Status.success) {
          ivtDetailSubject?.add(result.data?.data ?? IVTDetail());
          isLoading.value = false;
          ProviderScope.containerOf(context!)
              .read(commonChipListProvider)
              .highlightIndex
              .add(ProviderScope.containerOf(context!)
                      .read(commonChipListProvider)
                      .highlightIndex
                      .value +
                  1);
          fetchAllDetails(enquiryID, "ParentInfo");
          showWidget.add(showWidget.value + 1);
          controller.animateTo((showWidget.value + 1) * 50,
              duration: const Duration(milliseconds: 500),
              curve: Curves.linear);
          clearIvtDetails();
        }
        if (result.status == Status.error) {
          isLoading.value = false;
          flutterToastErrorPresenter.show(
              result.dealSafeAppError!.throwable,
              navigatorKey.currentContext!,
              result.dealSafeAppError?.error.message ?? '');
        }
      });
    }).execute();
  }

  Future<void> updateNewAdmissionDetails(
      {required String enquiryID,
      required NewAdmissionDetailEntity newAdmissionDetail}) async {
    exceptionHandlerBinder.handle(block: () {
      UpdateNewAdmissionUsecaseUseCaseParams params =
          UpdateNewAdmissionUsecaseUseCaseParams(
              enquiryID: enquiryID, newAdmissionDetail: newAdmissionDetail);
      isLoading.value = true;
      RequestManager<NewAdmissionBase>(
        params,
        createCall: () => updateNewAdmissionUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        if (result.status == Status.success) {
          isLoading.value = false;
          ProviderScope.containerOf(context!)
              .read(commonChipListProvider)
              .highlightIndex
              .add(ProviderScope.containerOf(context!)
                      .read(commonChipListProvider)
                      .highlightIndex
                      .value +
                  1);
          isLoading.value = false;
          fetchAllDetails(enquiryID, "ParentInfo");
          showWidget.add(showWidget.value + 1);
          controller.animateTo((showWidget.value + 1) * 50,
              duration: const Duration(milliseconds: 500),
              curve: Curves.linear);
          clearNewAdmissionDetails();
        }
        if (result.status == Status.error) {
          isLoading.value = false;
          flutterToastErrorPresenter.show(
              result.dealSafeAppError!.throwable,
              navigatorKey.currentContext!,
              result.dealSafeAppError?.error.message ?? '');
        }
      });
    }).execute();
  }

  Future<void> getMdmAttribute({required String infoType, int? id}) async {
    exceptionHandlerBinder.handle(block: () {
      GetMdmAttributeUsecaseParams params;
      if (infoType == "state" || infoType == "city") {
        params = GetMdmAttributeUsecaseParams(infoType: infoType, id: id);
      } else {
        params = GetMdmAttributeUsecaseParams(
          infoType: infoType,
        );
      }
      RequestManager<MdmAttributeBaseModel>(
        params,
        createCall: () async => await getMdmAttributeUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        if (result.status == Status.success) {
          if (infoType == "grade") {
            gradeTypesAttribute = result.data?.data;
            gradeTypes.add(result.data?.data
                    ?.map((e) => e.attributes?.name ?? '')
                    .toList() ??
                []);
          }
          if (infoType == "schoolLocation") {
            schoolLocationTypesAttribute = result.data?.data;
            schoolLocationTypes.add(result.data?.data
                    ?.map((e) => e.attributes?.name ?? '')
                    .toList() ??
                []);
          }
          if (infoType == "gender") {
            genderAttribute = result.data?.data;
            gender.add(result.data?.data
                    ?.map((e) => e.attributes?.name ?? '')
                    .toList() ??
                []);
          }
          if (infoType == "board") {
            existingSchoolBoardAttribute = result.data?.data;
            existingSchoolBoard.add(result.data?.data
                    ?.map((e) => e.attributes?.name ?? '')
                    .toList() ??
                []);
          }
          if (infoType == "psaCategory") {
            psaCategoryAttribute = result.data?.data;
            psaCategory.add(result.data?.data
                    ?.map((e) => e.attributes?.name ?? '')
                    .toList() ??
                []);
          }
          if (infoType == "psaSubCategory") {
            psaSubCategoryAttribute = result.data?.data;
            psaSubCategory.add(result.data?.data
                    ?.map((e) => e.attributes?.name ?? '')
                    .toList() ??
                []);
          }
          if (infoType == "psaSubType") {
            psaSubTypeAttribute = result.data?.data;
            psaSubType.add(result.data?.data
                    ?.map((e) => e.attributes?.name ?? '')
                    .toList() ??
                []);
          }
          if (infoType == "periodOfService") {
            periodOfServiceAttribute = result.data?.data;
            periodOfService.add(result.data?.data
                    ?.map((e) => e.attributes?.name ?? '')
                    .toList() ??
                []);
          }
          if (infoType == "batch") {
            psaBatchAttribute = result.data?.data;
            psaBatch.add(result.data?.data
                    ?.map((e) => e.attributes?.name ?? '')
                    .toList() ??
                []);
          }
          if (infoType == "stream") {
            streamTypeAttribute = result.data?.data;
            stream.add(result.data?.data
                    ?.map((e) => e.attributes?.name ?? '')
                    .toList() ??
                []);
          }
          if (infoType == "course") {
            courseTypeAttribute = result.data?.data;
            course.add(result.data?.data
                    ?.map((e) => e.attributes?.name ?? '')
                    .toList() ??
                []);
          }
          if (infoType == "shift") {
            shiftTypeAttribute = result.data?.data;
            shift.add(result.data?.data
                    ?.map((e) => e.attributes?.name ?? '')
                    .toList() ??
                []);
          }
          if (infoType == "country") {
            countryAttribute = result.data?.data;
            country.add(result.data?.data
                    ?.map((e) => e.attributes?.name ?? '')
                    .toList() ??
                []);
          }
          if (infoType == "state") {
            stateAttribute = result.data?.data;
            state.add(result.data?.data
                    ?.map((e) => e.attributes?.name ?? '')
                    .toList() ??
                []);
          }
          if (infoType == "city") {
            cityAttribute = result.data?.data;
            city.add(result.data?.data
                    ?.map((e) => e.attributes?.name ?? '')
                    .toList() ??
                []);
          }
          if (infoType == "bloodGroup") {
            bloodGroupAttribute = result.data?.data;
            bloodGroup.add(result.data?.data
                    ?.map((e) => e.attributes?.group ?? '')
                    .toList() ??
                []);
          }
          if (infoType == "occupation") {
            occupationAttribute = result.data?.data;
            occupation.add(result.data?.data
                    ?.map((e) => e.attributes?.occupation ?? '')
                    .toList() ??
                []);
          }
          if (infoType == "qualification") {
            qualificationAttribute = result.data?.data;
            qualifications.add(result.data?.data
                    ?.map((e) => e.attributes?.education ?? '')
                    .toList() ??
                []);
          }
          if (infoType == "religion") {
            religionAttribute = result.data?.data;
            religions.add(result.data?.data
                    ?.map((e) => e.attributes?.name ?? '')
                    .toList() ??
                []);
          }
          if (infoType == "caste") {
            casteAttribute = result.data?.data;
            castes.add(result.data?.data
                    ?.map((e) => e.attributes?.name ?? '')
                    .toList() ??
                []);
          }
          if (infoType == "subcaste") {
            subCasteAttribute = result.data?.data;
            subCastes.add(result.data?.data
                    ?.map((e) => e.attributes?.name ?? '')
                    .toList() ??
                []);
          }
          if (infoType == "mother_tongue") {
            motherTongueAttribute = result.data?.data;
            motherTongues.add(result.data?.data
                    ?.map((e) => e.attributes?.name ?? '')
                    .toList() ??
                []);
          }
          if (infoType == 'nationality') {
            nationality = result.data?.data;
            nationalities.add(result.data?.data
                    ?.map((e) => e.attributes?.nationality ?? '')
                    .toList() ??
                []);
          }
          if (infoType == 'designation') {
            designationAttribute = result.data?.data;
            designations.add(result.data?.data
                    ?.map((e) => e.attributes?.designation ?? '')
                    .toList() ??
                []);
          }
          if (infoType == 'organization') {
            organizationAttribute = result.data?.data;
            organizations.add(result.data?.data
                    ?.map((e) => e.attributes?.name ?? '')
                    .toList() ??
                []);
          }
          if (infoType == 'personalise_learning_needs') {
            personalisedLearningNeedsAttribute = result.data?.data;
            personalisedLearningNeeds.add(result.data?.data
                    ?.map((e) => e.attributes?.name ?? '')
                    .toList() ??
                []);
          }
          if (infoType == "relationWithChild") {
            relationWithChildAttribute = result.data?.data;
            relationWithChild.add(result.data?.data
                    ?.map((e) => e.attributes?.name ?? '')
                    .toList() ??
                []);
          }
        }
        if (result.status == Status.error) {
          flutterToastErrorPresenter.show(
              result.dealSafeAppError!.throwable,
              navigatorKey.currentContext!,
              result.dealSafeAppError?.error.message ?? '');
        }
      });
    }).execute();
  }

  Future<void> getCityAndStateByPincode(
      {required String pincode, required String infoType}) async {
    exceptionHandlerBinder.handle(block: () {
      GetCityStateByPincodeUsecaseParams params =
          GetCityStateByPincodeUsecaseParams(
        pincode: pincode,
      );
      isLoading.add(true);
      RequestManager<CityAndStateResponse>(
        params,
        createCall: () => getCityStateByPincodeUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((result) async {
        if (result.status == Status.success) {
          isLoading.add(false);
          if (infoType == "fatherInfo") {
            await getMdmAttribute(
                infoType: "city",
                id: result.data?.data?[0].attributes?.districtOrCity?.data?.id);
            await getMdmAttribute(
                infoType: "state",
                id: result.data?.data?[0].attributes?.state?.data?.id);
            selectedFatherCitySubject.add(result.data?.data?[0].attributes
                    ?.districtOrCity?.data?.attributes?.name ??
                '');
            selectedFatherCityEntity = CommonDataClass(
                id: result.data?.data?[0].attributes?.districtOrCity?.data?.id,
                value: result.data?.data?[0].attributes?.districtOrCity?.data
                    ?.attributes?.name);
            selectedFatherStateSubject.add(result
                    .data?.data?[0].attributes?.state?.data?.attributes?.name ??
                '');
            selectedFatherStateEntity = CommonDataClass(
                id: result.data?.data?[0].attributes?.state?.data?.id,
                value: result
                    .data?.data?[0].attributes?.state?.data?.attributes?.name);
          }
          if (infoType == "motherInfo") {
            await getMdmAttribute(
                infoType: "city",
                id: result.data?.data?[0].attributes?.districtOrCity?.data?.id);
            await getMdmAttribute(
                infoType: "state",
                id: result.data?.data?[0].attributes?.state?.data?.id);
            selectedMotherCitySubject.add(result.data?.data?[0].attributes
                    ?.districtOrCity?.data?.attributes?.name ??
                '');
            selectedMotherCityEntity = CommonDataClass(
                id: result.data?.data?[0].attributes?.districtOrCity?.data?.id,
                value: result.data?.data?[0].attributes?.districtOrCity?.data
                    ?.attributes?.name);
            selectedMotherStateSubject.add(result
                    .data?.data?[0].attributes?.state?.data?.attributes?.name ??
                '');
            selectedMotherStateEntity = CommonDataClass(
                id: result.data?.data?[0].attributes?.state?.data?.id,
                value: result
                    .data?.data?[0].attributes?.state?.data?.attributes?.name);
          }
          if (infoType == "guardianInfo") {
            await getMdmAttribute(
                infoType: "city",
                id: result.data?.data?[0].attributes?.districtOrCity?.data?.id);
            await getMdmAttribute(
                infoType: "state",
                id: result.data?.data?[0].attributes?.state?.data?.id);
            selectedGuardianCitySubject.add(result.data?.data?[0].attributes
                    ?.districtOrCity?.data?.attributes?.name ??
                '');
            selectedGuardianCityEntity = CommonDataClass(
                id: result.data?.data?[0].attributes?.districtOrCity?.data?.id,
                value: result.data?.data?[0].attributes?.districtOrCity?.data
                    ?.attributes?.name);
            selectedGuardianStateSubject.add(result
                    .data?.data?[0].attributes?.state?.data?.attributes?.name ??
                '');
            selectedGuardianStateEntity = CommonDataClass(
                id: result.data?.data?[0].attributes?.state?.data?.id,
                value: result
                    .data?.data?[0].attributes?.state?.data?.attributes?.name);
          }
          if (infoType == "currentAddress") {
            await getMdmAttribute(
                infoType: "city",
                id: result.data?.data?[0].attributes?.districtOrCity?.data?.id);
            await getMdmAttribute(
                infoType: "state",
                id: result.data?.data?[0].attributes?.state?.data?.id);
            selectedResidentialCity.add(result.data?.data?[0].attributes
                    ?.districtOrCity?.data?.attributes?.name ??
                '');
            selectedCityEntity = CommonDataClass(
                id: result.data?.data?[0].attributes?.districtOrCity?.data?.id,
                value: result.data?.data?[0].attributes?.districtOrCity?.data
                    ?.attributes?.name);
            selectedResidentialState.add(result
                    .data?.data?[0].attributes?.state?.data?.attributes?.name ??
                '');
            selectedStateEntity = CommonDataClass(
                id: result.data?.data?[0].attributes?.state?.data?.id,
                value: result
                    .data?.data?[0].attributes?.state?.data?.attributes?.name);
          }
          if (infoType == "permanentAddress") {
            await getMdmAttribute(
                infoType: "city",
                id: result.data?.data?[0].attributes?.districtOrCity?.data?.id);
            await getMdmAttribute(
                infoType: "state",
                id: result.data?.data?[0].attributes?.state?.data?.id);
            selectedPermanentResidentialCity.add(result.data?.data?[0]
                    .attributes?.districtOrCity?.data?.attributes?.name ??
                '');
            permanentResidentialCity = CommonDataClass(
                id: result.data?.data?[0].attributes?.districtOrCity?.data?.id,
                value: result.data?.data?[0].attributes?.districtOrCity?.data
                    ?.attributes?.name);
            selectedPermanentResidentialState.add(result
                    .data?.data?[0].attributes?.state?.data?.attributes?.name ??
                '');
            permanentResidentialState = CommonDataClass(
                id: result.data?.data?[0].attributes?.state?.data?.id,
                value: result
                    .data?.data?[0].attributes?.state?.data?.attributes?.name);
          }
        }
        if (result.status == Status.error) {
          isLoading.add(false);
          flutterToastErrorPresenter.show(
              result.dealSafeAppError!.throwable,
              navigatorKey.currentContext!,
              result.dealSafeAppError?.error.message ?? '');
        }
        // activeStep.add()
      });
    }).execute();
  }

  void pickFile(UpoladFileTypeEnum fileTypeEnum, String documentID,
      String enquiryID, int index) {
    exceptionHandlerBinder.handle(block: () {
      final params = ChooseFileUseCaseParams(fileTypeEnum: fileTypeEnum);
      RequestManager<UploadFile>(params,
              createCall: () => chooseFileUseCase.execute(params: params))
          .asFlow()
          .listen((result) {
        if (result.status == Status.success) {
          uploadEnquiryDocument(
              enquiryID: enquiryID,
              documentID: documentID,
              file: result.data!.file!,
              index: index);
        }
      }).onError((error) {});
    }).execute();
  }

  Future<void> uploadEnquiryDocument(
      {required String enquiryID,
      required String documentID,
      required File file,
      int? index}) async {
    exceptionHandlerBinder.handle(block: () {
      UploadEnquiryDocumentUsecaseParams params =
          UploadEnquiryDocumentUsecaseParams(
              documentID: documentID, enquiryID: enquiryID, file: file);
      isLoading.value = true;
      RequestManager<EnquiryFileUploadBase>(
        params,
        createCall: () => uploadEnquiryDocumentUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        if (result.status == Status.success) {
          uploadEnquiryFile.add(
              Resource.success(data: result.data ?? EnquiryFileUploadBase()));
          isDocumentUploaded[index ?? 0].value = true;
          isLoading.value = false;
        }
        if (result.status == Status.error) {
          isLoading.value = false;
          flutterToastErrorPresenter.show(
              result.dealSafeAppError!.throwable,
              navigatorKey.currentContext!,
              result.dealSafeAppError?.error.message ?? '');
        }
        // activeStep.add()
      });
    }).execute();
  }

  Future<void> deleteEnquiryDocument(
      {required String enquiryID,
      required String documentID,
      int? index}) async {
    exceptionHandlerBinder.handle(block: () {
      DeleteEnquiryDocumentUsecaseParams params =
          DeleteEnquiryDocumentUsecaseParams(
              documentID: documentID,
              enquiryID: enquiryID,
              delete: 'true',
              verifyDoc: 'false');
      isLoading.value = true;
      RequestManager<DeleteEnquiryFileBase>(
        params,
        createCall: () => deleteEnquiryDocumentUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        if (result.status == Status.success) {
          deleteEnquiryFile.add(
              Resource.success(data: result.data ?? DeleteEnquiryFileBase()));
          isDocumentUploaded[index ?? 0].value = false;
          isLoading.value = false;
        }
        if (result.status == Status.error) {
          isLoading.value = false;
          flutterToastErrorPresenter.show(
              result.dealSafeAppError!.throwable,
              navigatorKey.currentContext!,
              result.dealSafeAppError?.error.message ?? '');
        }
        // activeStep.add()
      });
    }).execute();
  }

  Future<void> downloadEnquiryDocument(
      {required String enquiryID, required String documentID}) async {
    exceptionHandlerBinder.handle(block: () {
      DownloadEnquiryDocumentUsecaseParams params =
          DownloadEnquiryDocumentUsecaseParams(
              documentID: documentID, enquiryID: enquiryID, download: 'true');
      isLoading.value = true;
      RequestManager<DownloadEnquiryFileBase>(
        params,
        createCall: () => downloadEnquiryDocumentUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        if (result.status == Status.success) {
          getEnquiryFile.add(
              Resource.success(data: result.data ?? DownloadEnquiryFileBase()));
          downloadDocument(fileUrl: result.data?.data?['url'] ?? '');
        }
        if (result.status == Status.error) {
          isLoading.value = false;
          flutterToastErrorPresenter.show(
              result.dealSafeAppError!.throwable,
              navigatorKey.currentContext!,
              result.dealSafeAppError?.error.message ?? '');
        }
      });
    }).execute();
  }

  Future<void> downloadDocument({required String fileUrl}) async {
    exceptionHandlerBinder.handle(block: () {
      DownloadFileUsecaseParams params =
          DownloadFileUsecaseParams(fileUrl: fileUrl);
      RequestManager<Uint8List>(
        params,
        createCall: () => downloadFileUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((result) async {
        if (result.status == Status.success) {
          try {
            Directory? directory;
            if (Platform.isAndroid) {
              directory = Directory('storage/emulated/0/Download');
            } else {
              directory = await getApplicationDocumentsDirectory();
            }
            final fullPath = directory.path;
            final fileExtension = extractFileExtension(fileUrl);
            final fileName =
                '${DateTime.now().millisecondsSinceEpoch}.$fileExtension';
            final file = File('$fullPath/$fileName');
            await file.writeAsBytes(result.data ?? Uint8List(0));
            isLoading.value = false;
            OpenFilex.open(file.path);
            ScaffoldMessenger.of(context!).showSnackBar(
              SnackBar(
                  content:
                      Text('File Downloaded Successfully at: ${file.path}')),
            );
          } catch (e) {
            isLoading.value = false;
            ScaffoldMessenger.of(context!).showSnackBar(
              SnackBar(content: Text('Error: $e')),
            );
          }
        }
        if (result.status == Status.error) {
          isLoading.value = false;
          flutterToastErrorPresenter.show(
              result.dealSafeAppError!.throwable,
              navigatorKey.currentContext!,
              result.dealSafeAppError?.error.message ?? '');
        }
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

  addNewAdmissionDetails(
      NewAdmissionDetail detail, EnquiryDetailArgs enquiryDetail) {
    enquiryNumberController.text = enquiryDetail.enquiryNumber ?? '';
    enquiryTypeController.text = enquiryDetail.enquiryType ?? '';
    enquiryDateController.text = detail.enquiryDate ?? '';
    studentFirstNameController.text = detail.studentDetails?.firstName ?? '';
    studentLastNameController.text = detail.studentDetails?.lastName ?? '';
    schoolLocationController.text = detail.schoolLocation?.value ?? '';
    if (!(detail.studentDetails?.dob ?? '')
        .toLowerCase()
        .contains("invalid date")) {
      studentDob = (detail.studentDetails?.dob ?? '').isNotEmpty
          ? DateTime.parse(
              (detail.studentDetails?.dob ?? '').split('-').reversed.join('-'))
          : DateTime.now();
    }
    studentEligibleGradeController.text =
        detail.studentDetails?.eligibleGrade ?? '';
    studentAadharController.text = detail.studentDetails?.aadhar ?? '';
    placeOfBirthController.text = detail.studentDetails?.placeOfBirth ?? '';
    // religionController.text = detail.studentDetails?.religion ?? '';
    selectedReligionSubject.add(detail.studentDetails?.religion?.value ?? '');
    selectedReligion = detail.studentDetails?.religion;
    // casteController.text = detail.studentDetails?.caste ?? '';
    selectedCasteSubject.add(detail.studentDetails?.caste?.value ?? '');
    selectedCaste = detail.studentDetails?.caste;
    // subCasteController.text = detail.studentDetails?.subCaste ?? '';
    selectedSubCasteSubject.add(detail.studentDetails?.subCaste?.value ?? '');
    selectedSubCaste = detail.studentDetails?.subCaste;
    // nationalityController.text = detail.studentDetails?.nationality ?? '';
    selectedNationalitySubject
        .add(detail.studentDetails?.nationality?.value ?? '');
    selectedNationality = detail.studentDetails?.nationality;
    // motherTongueController.text = detail.studentDetails?.motherTongue ?? '';
    selectedMotherTongueSubject
        .add(detail.studentDetails?.motherTongue?.value ?? '');
    selectedMotherTongue = detail.studentDetails?.motherTongue;
    existingSchoolNameController.text =
        detail.existingSchoolDetails?.name ?? '';
    selectedGradeSubject.add(detail.studentDetails?.grade?.value ?? '');
    selectedGradeEntity = detail.studentDetails?.grade;
    selectedSchoolLocationSubject.add(detail.schoolLocation?.value ?? '');
    if (schoolLocationTypesAttribute != null) {
      selectedSchoolLocationSubjectAttribute.add(schoolLocationTypesAttribute
          ?.firstWhere((element) => element.id == detail.schoolLocation?.id));
    }
    selectedSchoolLocationEntity = detail.schoolLocation;
    selectedExistingSchoolGradeSubject
        .add(detail.existingSchoolDetails?.grade?.value ?? '');
    selectedExistingSchoolGradeEntity = detail.existingSchoolDetails?.grade;
    selectedExistingSchoolBoardSubject
        .add(detail.existingSchoolDetails?.board?.value ?? '');
    selectedExistingSchoolBoardEntity = detail.existingSchoolDetails?.board;
    selectedGenderSubject.add(detail.studentDetails?.gender?.value ?? '');
    selectedGenderEntity = detail.studentDetails?.gender;
    // parentTypeController.text = detail.enquirerParent??'';
    selectedParentTypeSubject.add(detail.enquirerParent ?? '');
    // fatherGlobalIdController.text =
    //     detail.parentDetails?.fatherDetails?.globalId ?? '';
    // motherGlobalIdController.text =
    //     detail.parentDetails?.motherDetails?.globalId ?? '';
    studentsFatherFirstNameController.text =
        detail.parentDetails?.fatherDetails?.firstName ?? '';
    studentsFatherLastNameController.text =
        detail.parentDetails?.fatherDetails?.lastName ?? '';
    studentsFatherContactController.text =
        detail.parentDetails?.fatherDetails?.mobile ?? '';
    studentsFatherEmailController.text =
        detail.parentDetails?.fatherDetails?.email ?? '';
    studentsMotherFirstNameController.text =
        detail.parentDetails?.motherDetails?.firstName ?? '';
    studentsMotherLastNameController.text =
        detail.parentDetails?.motherDetails?.lastName ?? '';
    studentsMotherContactController.text =
        detail.parentDetails?.motherDetails?.mobile ?? '';
    studentsMotherEmailController.text =
        detail.parentDetails?.motherDetails?.email ?? '';
  }

  addPsaDetails(PSADetail detail, EnquiryDetailArgs enquiryDetail) {
    enquiryNumberController.text = enquiryDetail.enquiryNumber ?? '';
    enquiryTypeController.text = enquiryDetail.enquiryType ?? '';
    enquiryDateController.text = detail.enquiryDate ?? '';
    studentFirstNameController.text = detail.studentDetails?.firstName ?? '';
    studentLastNameController.text = detail.studentDetails?.lastName ?? '';
    dobController.text =
        (detail.studentDetails?.dob ?? '').replaceAll('-', '/');
    studentEligibleGradeController.text =
        detail.studentDetails?.eligibleGrade ?? '';
    studentAadharController.text = detail.studentDetails?.aadhar ?? '';
    studentDob = (detail.studentDetails?.dob ?? '').isNotEmpty
        ? DateTime.parse(
            (detail.studentDetails?.dob ?? '').split('-').reversed.join('-'))
        : DateTime.now();
    placeOfBirthController.text = detail.studentDetails?.placeOfBirth ?? '';
    // religionController.text = detail.studentDetails?.religion ?? '';
    selectedReligionSubject.add(detail.studentDetails?.religion?.value ?? '');
    selectedReligion = detail.studentDetails?.religion;
    // casteController.text = detail.studentDetails?.caste ?? '';
    selectedCasteSubject.add(detail.studentDetails?.caste?.value ?? '');
    selectedCaste = detail.studentDetails?.caste;
    // subCasteController.text = detail.studentDetails?.subCaste ?? '';
    selectedSubCasteSubject.add(detail.studentDetails?.subCaste?.value ?? '');
    selectedSubCaste = detail.studentDetails?.subCaste;
    // nationalityController.text = detail.studentDetails?.nationality ?? '';
    selectedMotherTongueSubject
        .add(detail.studentDetails?.motherTongue?.value ?? '');
    selectedMotherTongue = detail.studentDetails?.motherTongue;
    // motherTongueController.text = detail.studentDetails?.motherTongue ?? '';
    selectedMotherTongueSubject
        .add(detail.studentDetails?.motherTongue?.value ?? '');
    selectedMotherTongue = detail.studentDetails?.motherTongue;
    existingSchoolNameController.text =
        detail.existingSchoolDetails?.name ?? '';
    selectedGradeSubject.add(detail.studentDetails?.grade?.value ?? '');
    selectedGradeEntity = detail.studentDetails?.grade;
    selectedSchoolLocationSubject.add(detail.schoolLocation?.value ?? '');
    selectedSchoolLocationEntity = detail.schoolLocation;
    selectedExistingSchoolGradeSubject
        .add(detail.existingSchoolDetails?.grade?.value ?? '');
    selectedExistingSchoolGradeEntity = detail.existingSchoolDetails?.grade;
    selectedExistingSchoolBoardSubject
        .add(detail.existingSchoolDetails?.board?.value ?? '');
    selectedExistingSchoolBoardEntity = detail.existingSchoolDetails?.board;
    selectedGenderSubject.add(detail.studentDetails?.gender?.value ?? '');
    selectedGenderEntity = detail.studentDetails?.gender;
    psaSubTypeSubject.add(detail.psaSubType?.value ?? '');
    selectedPsaSubTypeEntity = detail.psaSubType;
    psaCategorySubject.add(detail.psaCategory?.value ?? '');
    selectedPsaCategoryEntity = detail.psaCategory;
    psaSubCategorySubject.add(detail.psaSubCategory?.value ?? '');
    selectedPsaSubCategoryEntity = detail.psaSubCategory;
    periodOfServiceSubject.add(detail.psaPeriodOfService?.value ?? '');
    selectedPeriodOfServiceEntity = detail.psaPeriodOfService;
    psaBatchSubject.add(detail.psaBatch?.value ?? '');
    selectedPsaBatchEntity = detail.psaBatch;
    selectedParentTypeSubject.add(detail.enquirerParent ?? '');
    // fatherGlobalIdController.text =
    //     detail.parentDetails?.fatherDetails?.globalId ?? '';
    // motherGlobalIdController.text =
    //     detail.parentDetails?.motherDetails?.globalId ?? '';
    studentsFatherFirstNameController.text =
        detail.parentDetails?.fatherDetails?.firstName ?? '';
    studentsFatherLastNameController.text =
        detail.parentDetails?.fatherDetails?.lastName ?? '';
    studentsFatherContactController.text =
        detail.parentDetails?.fatherDetails?.mobile ?? '';
    studentsFatherEmailController.text =
        detail.parentDetails?.fatherDetails?.email ?? '';
    studentsMotherFirstNameController.text =
        detail.parentDetails?.motherDetails?.firstName ?? '';
    studentsMotherLastNameController.text =
        detail.parentDetails?.motherDetails?.lastName ?? '';
    studentsMotherContactController.text =
        detail.parentDetails?.motherDetails?.mobile ?? '';
    studentsMotherEmailController.text =
        detail.parentDetails?.motherDetails?.email ?? '';
  }

  addIvtDetails(IVTDetail detail, EnquiryDetailArgs enquiryDetail) {
    enquiryNumberController.text = enquiryDetail.enquiryNumber ?? '';
    enquiryTypeController.text = enquiryDetail.enquiryType ?? '';
    enquiryDateController.text = detail.enquiryDate ?? '';
    studentFirstNameController.text = detail.studentDetails?.firstName ?? '';
    studentLastNameController.text = detail.studentDetails?.lastName ?? '';
    dobController.text =
        (detail.studentDetails?.dob ?? '').replaceAll('-', '/');
    studentEligibleGradeController.text =
        detail.studentDetails?.eligibleGrade ?? '';
    studentAadharController.text = detail.studentDetails?.aadhar ?? '';
    studentDob = (detail.studentDetails?.dob ?? '').isNotEmpty
        ? DateTime.parse(
            (detail.studentDetails?.dob ?? '').split('-').reversed.join('-'))
        : DateTime.now();
    placeOfBirthController.text = detail.studentDetails?.placeOfBirth ?? '';
    // religionController.text = detail.studentDetails?.religion ?? '';
    selectedReligionSubject.add(detail.studentDetails?.religion?.value ?? '');
    selectedReligion = detail.studentDetails?.religion;
    // casteController.text = detail.studentDetails?.caste ?? '';
    selectedCasteSubject.add(detail.studentDetails?.caste?.value ?? '');
    selectedCaste = detail.studentDetails?.caste;
    // subCasteController.text = detail.studentDetails?.subCaste ?? '';
    selectedSubCasteSubject.add(detail.studentDetails?.subCaste?.value ?? '');
    selectedSubCaste = detail.studentDetails?.subCaste;
    // nationalityController.text = detail.studentDetails?.nationality ?? '';
    selectedMotherTongueSubject
        .add(detail.studentDetails?.motherTongue?.value ?? '');
    selectedMotherTongue = detail.studentDetails?.motherTongue;
    // motherTongueController.text = detail.studentDetails?.motherTongue ?? '';
    selectedMotherTongueSubject
        .add(detail.studentDetails?.motherTongue?.value ?? '');
    selectedMotherTongue = detail.studentDetails?.motherTongue;
    existingSchoolNameController.text =
        detail.existingSchoolDetails?.name ?? '';
    selectedGradeSubject.add(detail.studentDetails?.grade?.value ?? '');
    selectedGradeEntity = detail.studentDetails?.grade;
    selectedSchoolLocationSubject.add(detail.schoolLocation?.value ?? '');
    selectedSchoolLocationEntity = detail.schoolLocation;
    selectedExistingSchoolGradeSubject
        .add(detail.existingSchoolDetails?.grade?.value ?? '');
    selectedExistingSchoolGradeEntity = detail.existingSchoolDetails?.grade;
    selectedExistingSchoolBoardSubject
        .add(detail.existingSchoolDetails?.board?.value ?? '');
    selectedExistingSchoolBoardEntity = detail.existingSchoolDetails?.board;
    selectedGenderSubject.add(detail.studentDetails?.gender?.value ?? '');
    selectedGenderEntity = detail.studentDetails?.gender;
    ivtBoardSubject.add(detail.board?.value ?? '');
    ivtCourseSubject.add(detail.course?.value ?? '');
    ivtStreamSubject.add(detail.stream?.value ?? '');
    ivtShiftSubject.add(detail.shift?.value ?? '');
    selectedParentTypeSubject.add(detail.enquirerParent ?? '');
    // fatherGlobalIdController.text =
    //     detail.parentDetails?.fatherDetails?.globalId ?? '';
    // motherGlobalIdController.text =
    //     detail.parentDetails?.motherDetails?.globalId ?? '';
    studentsFatherFirstNameController.text =
        detail.parentDetails?.fatherDetails?.firstName ?? '';
    studentsFatherLastNameController.text =
        detail.parentDetails?.fatherDetails?.lastName ?? '';
    studentsFatherContactController.text =
        detail.parentDetails?.fatherDetails?.mobile ?? '';
    studentsFatherEmailController.text =
        detail.parentDetails?.fatherDetails?.email ?? '';
    studentsMotherFirstNameController.text =
        detail.parentDetails?.motherDetails?.firstName ?? '';
    studentsMotherLastNameController.text =
        detail.parentDetails?.motherDetails?.lastName ?? '';
    studentsMotherContactController.text =
        detail.parentDetails?.motherDetails?.mobile ?? '';
    studentsMotherEmailController.text =
        detail.parentDetails?.motherDetails?.email ?? '';
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
      CommonRadioButton<String>("Yes");

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

  final CommonRadioButton<String> radioButtonTransport =
      CommonRadioButton<String>(null);
  final CommonRadioButton<String> radioButtonCafeteria =
      CommonRadioButton<String>(null);
  final CommonRadioButton<String> radioButtonHostel =
      CommonRadioButton<String>(null);
  final CommonRadioButton<String> radioButtonKidsClub =
      CommonRadioButton<String>(null);
  final CommonRadioButton<String> radioButtonPsa =
      CommonRadioButton<String>(null);
  final CommonRadioButton<String> radioButtonSummerCamp =
      CommonRadioButton<String>(null);

  addParentDetails(ParentInfo parentDetails) {
    fatherFirstNameController.text =
        parentDetails.fatherDetails?.firstName ?? "";
    fatherLastNameController.text = parentDetails.fatherDetails?.lastName ?? "";
    fatherAdharCardController.text =
        parentDetails.fatherDetails?.aadharNumber ?? "";
    fatherPanCardController.text = parentDetails.fatherDetails?.panNumber ?? "";
    // qualificationController.text =
    //     parentDetails.fatherDetails?.qualification ?? "";
    if (parentDetails.fatherDetails?.qualification is CommonDataClass) {
      selectedFatherQualification = parentDetails.fatherDetails?.qualification;
      selectedFatherQualificationSubject
          .add(parentDetails.fatherDetails?.qualification?.value ?? '');
    }
    if (parentDetails.fatherDetails?.organisationName is CommonDataClass) {
      selectedFatherOrganization =
          parentDetails.fatherDetails?.organisationName;
      selectedFatherOrganizationSubject
          .add(parentDetails.fatherDetails?.organisationName?.value ?? '');
    }
    // organizationNameController.text =
    //     parentDetails.fatherDetails?.organisationName ?? "";
    // designationController.text =
    //     parentDetails.fatherDetails?.designationName ?? "";
    if (parentDetails.fatherDetails?.designationName is CommonDataClass) {
      selectedFatherDesignation = parentDetails.fatherDetails?.designationName;
      selectedFatherDesignationSubject
          .add(parentDetails.fatherDetails?.designationName?.value ?? '');
    }
    pinCodeController.text = parentDetails.fatherDetails?.pinCode ?? "";
    fatherEmailController.text = parentDetails.fatherDetails?.emailId ?? "";
    fatherMobileController.text =
        parentDetails.fatherDetails?.mobileNumber ?? "";
    // fatherOccupation = parentDetails.fatherDetails?.occupation ?? "";
    if (parentDetails.fatherDetails?.occupation is CommonDataClass) {
      selectedFatherOccupation = parentDetails.fatherDetails?.occupation;
      selectedFatherOccupationSubject
          .add(parentDetails.fatherDetails?.occupation?.value ?? '');
    }
    // fatherArea = parentDetails.fatherDetails?.area ?? "";
    fatherOfficeAreaController.text = parentDetails.fatherDetails?.area ?? "";
    if (pinCodeController.text.trim().isNotEmpty) {
      getCityAndStateByPincode(
          pincode: pinCodeController.text.trim(), infoType: "fatherInfo");
    }
    if (parentDetails.fatherDetails?.country is CommonDataClass) {
      selectedFatherCountrySubject
          .add(parentDetails.fatherDetails?.country?.value ?? '');
      selectedFatherCountryEntity = parentDetails.fatherDetails?.country;
    } else {
      selectedFatherCountrySubject
          .add(parentDetails.fatherDetails?.country ?? '');
      if ((countryAttribute ?? []).any((element) =>
          element.attributes?.name == parentDetails.fatherDetails?.country)) {
        var country = countryAttribute?.firstWhere((element) =>
            element.attributes?.name == parentDetails.fatherDetails?.country);
        selectedFatherCountryEntity =
            CommonDataClass(id: country?.id, value: country?.attributes?.name);
      }
    }
    // if(parentDetails.fatherDetails?.state is CommonDataClass){
    //   selectedFatherStateSubject
    //       .add(parentDetails.fatherDetails?.state?.value ?? '');
    //   selectedFatherStateEntity =
    //       (parentDetails.fatherDetails?.state is CommonDataClass)
    //           ? parentDetails.fatherDetails?.state
    //           : null;
    // } else{
    //   selectedFatherStateSubject.add(parentDetails.fatherDetails?.state ?? '');
    //   if((stateAttribute??[]).any((element)=>element.attributes?.name==parentDetails.fatherDetails?.state)){
    //     var state=stateAttribute?.firstWhere((element)=>element.attributes?.name==parentDetails.fatherDetails?.state);
    //     selectedFatherStateEntity=CommonDataClass(id: state?.id,value: state?.attributes?.name);
    //   }
    // }
    // if(parentDetails.fatherDetails?.city is CommonDataClass){
    //   selectedFatherCitySubject
    //       .add(parentDetails.fatherDetails?.city?.value ?? '');
    //   selectedFatherCityEntity = parentDetails.fatherDetails?.city;
    // } else {
    //   selectedFatherCitySubject.add(parentDetails.fatherDetails?.city ?? '');
    //     if ((cityAttribute ?? []).any((element) =>
    //       element.attributes?.name == parentDetails.fatherDetails?.city)) {
    //     var city = cityAttribute?.firstWhere((element) =>
    //         element.attributes?.name == parentDetails.fatherDetails?.city);
    //     selectedFatherCityEntity = CommonDataClass(
    //         id: city?.id, value: city?.attributes?.name);
    //   }
    // }
    // if(parentDetails.fatherDetails?.qualification is CommonDataClass){
    //   selectedFatherQualificationSubject
    //       .add(parentDetails.fatherDetails?.qualification?.value ?? '');
    //   selectedFatherQualification = parentDetails.fatherDetails?.qualification;
    // } else {
    //   selectedFatherQualificationSubject.add(parentDetails.fatherDetails?.qualification ?? '');
    //     if ((qualificationAttribute ?? []).any((element) =>
    //       element.attributes?.education == parentDetails.fatherDetails?.qualification)) {
    //     var qualification = qualificationAttribute?.firstWhere((element) =>
    //         element.attributes?.education == parentDetails.fatherDetails?.qualification);
    //     selectedFatherQualification = CommonDataClass(
    //         id: qualification?.id, value: qualification?.attributes?.education);
    //   }
    // }
    selectedFatherAreaSubject.add(parentDetails.fatherDetails?.area ?? '');
    // selectedFatherOccupationSubject
    //     .add(parentDetails.fatherDetails?.occupation ?? '');

    motherFirstNameController.text =
        parentDetails.motherDetails?.firstName ?? "";
    motherLastNameController.text = parentDetails.motherDetails?.lastName ?? "";
    motherAdharCardController.text =
        parentDetails.motherDetails?.aadharNumber ?? "";
    motherPanCardController.text = parentDetails.motherDetails?.panNumber ?? "";
    // motherQualificationController.text =
    //     parentDetails.motherDetails?.qualification ?? "";
    // motherOrganizationNameController.text =
    //     parentDetails.motherDetails?.organisationName ?? "";
    // motherDesignationController.text =
    //     parentDetails.motherDetails?.designationName ?? "";
    motherOfficeAddressController.text =
        parentDetails.motherDetails?.officeAddress ?? "";
    motherPinCodeController.text = parentDetails.motherDetails?.pinCode ?? "";
    motherEmailController.text = parentDetails.motherDetails?.emailId ?? "";
    motherMobileController.text =
        parentDetails.motherDetails?.mobileNumber ?? "";
    if (motherPinCodeController.text.trim().isNotEmpty) {
      getCityAndStateByPincode(
          pincode: motherPinCodeController.text.trim(), infoType: "motherInfo");
    }
    // motherOccupation = parentDetails.motherDetails?.occupation ?? "";
    if (parentDetails.motherDetails?.organisationName is CommonDataClass) {
      selectedMotherOrganization =
          parentDetails.motherDetails?.organisationName;
      selectedMotherOrganizationSubject
          .add(parentDetails.motherDetails?.organisationName?.value ?? '');
    }
    if (parentDetails.motherDetails?.designationName is CommonDataClass) {
      selectedMotherDesignation = parentDetails.motherDetails?.designationName;
      selectedMotherDesignationSubject
          .add(parentDetails.motherDetails?.designationName?.value ?? '');
    }
    if (parentDetails.motherDetails?.occupation is CommonDataClass) {
      selectedMotherOccupation = parentDetails.motherDetails?.occupation;
      selectedMotherOccupationSubject
          .add(parentDetails.motherDetails?.occupation?.value ?? '');
    }
    motherArea = parentDetails.motherDetails?.area ?? "";
    motherOfficeAreaController.text = parentDetails.motherDetails?.area ?? "";
    if (parentDetails.motherDetails?.country is CommonDataClass) {
      selectedMotherCountrySubject
          .add(parentDetails.motherDetails?.country?.value ?? '');
      selectedMotherCountryEntity = parentDetails.motherDetails?.country;
    } else {
      selectedMotherCountrySubject
          .add(parentDetails.motherDetails?.country ?? '');
      if ((countryAttribute ?? []).any((element) =>
          element.attributes?.name == parentDetails.motherDetails?.country)) {
        var country = countryAttribute?.firstWhere((element) =>
            element.attributes?.name == parentDetails.motherDetails?.country);
        selectedMotherCountryEntity =
            CommonDataClass(id: country?.id, value: country?.attributes?.name);
      }
    }
    // if(parentDetails.motherDetails?.state is CommonDataClass){
    //   selectedMotherStateSubject
    //       .add(parentDetails.motherDetails?.state?.value ?? '');
    //   selectedMotherStateEntity =
    //       (parentDetails.motherDetails?.state is CommonDataClass)
    //           ? parentDetails.motherDetails?.state
    //           : null;
    // } else {
    //   selectedMotherStateSubject.add(parentDetails.motherDetails?.state ?? '');
    //   if ((stateAttribute ?? []).any((element) =>
    //       element.attributes?.name == parentDetails.motherDetails?.state)) {
    //     var state = stateAttribute?.firstWhere((element) =>
    //         element.attributes?.name == parentDetails.motherDetails?.state);
    //     selectedMotherStateEntity = CommonDataClass(
    //         id: state?.id, value: state?.attributes?.name);
    //   }
    // }
    // if(parentDetails.motherDetails?.city is CommonDataClass){
    //   selectedMotherCitySubject
    //       .add(parentDetails.motherDetails?.city?.value ?? '');
    //   selectedMotherCityEntity = parentDetails.motherDetails?.city;
    // } else {
    //   selectedMotherCitySubject.add(parentDetails.motherDetails?.city ?? '');
    //   if ((cityAttribute ?? []).any((element) =>
    //       element.attributes?.name == parentDetails.motherDetails?.city)) {
    //     var city = cityAttribute?.firstWhere((element) =>
    //         element.attributes?.name == parentDetails.motherDetails?.city);
    //     selectedMotherCityEntity = CommonDataClass(
    //         id: city?.id, value: city?.attributes?.name);
    //   }
    // }
    if (parentDetails.motherDetails?.qualification is CommonDataClass) {
      selectedMotherQualificationSubject
          .add(parentDetails.motherDetails?.qualification?.value ?? '');
      selectedMotherQualification = parentDetails.motherDetails?.qualification;
    } else {
      selectedMotherQualificationSubject
          .add(parentDetails.motherDetails?.qualification ?? '');
      if ((qualificationAttribute ?? []).any((element) =>
          element.attributes?.education ==
          parentDetails.motherDetails?.qualification)) {
        var qualification = qualificationAttribute?.firstWhere((element) =>
            element.attributes?.education ==
            parentDetails.motherDetails?.qualification);
        selectedMotherOccupation = CommonDataClass(
            id: qualification?.id,
            value: qualification?.attributes?.description);
      }
    }
    selectedMotherAreaSubject.add(parentDetails.motherDetails?.area ?? '');
    // selectedMotherOccupationSubject
    //     .add(parentDetails.motherDetails?.occupation ?? '');

    radioButtonController2.selectItem(
        parentDetails.childCustodyDetail?.areParentsSeparated ?? "No");
    if (radioButtonController.selectedItem == "Yes") {
      radioButtonController10
          .selectItem(parentDetails.childCustodyDetail?.childCustody ?? "");
    }

    guardianFirstNameController.text =
        parentDetails.guardianDetails?.firstName ?? "";
    guardianLastNameController.text =
        parentDetails.guardianDetails?.lastName ?? "";
    guardianAdharCardController.text =
        parentDetails.guardianDetails?.aadharNumber ?? "";
    guardianPanCardController.text =
        parentDetails.guardianDetails?.panNumber ?? "";
    guardianHouseNumberController.text =
        parentDetails.guardianDetails?.houseNumber ?? "";
    guardianStreetController.text = parentDetails.guardianDetails?.street ?? "";
    guardianLandmarkController.text =
        parentDetails.guardianDetails?.landmark ?? "";
    guardianPinCodeController.text =
        parentDetails.guardianDetails?.pincode ?? "";
    radioButtonController
        .selectItem(parentDetails.guardianDetails?.guardianType ?? "");
    if (guardianPinCodeController.text.trim().isNotEmpty) {
      getCityAndStateByPincode(
          pincode: guardianPinCodeController.text.trim(),
          infoType: "guardianInfo");
    }
    guardianEmailController.text = parentDetails.guardianDetails?.emailId ?? "";
    guardianMobileController.text =
        parentDetails.guardianDetails?.mobileNumber ?? "";
    if (parentDetails.guardianDetails?.relationWithChild is CommonDataClass) {
      selectedRelationWithChildSubject
          .add(parentDetails.guardianDetails?.relationWithChild?.value ?? '');
      selectedRelationWithChildEntity =
          parentDetails.guardianDetails?.relationWithChild;
    } else {
      selectedRelationWithChildSubject
          .add(parentDetails.guardianDetails?.relationWithChild ?? '');
      if ((relationWithChildAttribute ?? []).any((element) =>
          element.attributes?.name ==
          parentDetails.guardianDetails?.relationWithChild)) {
        var relationWithChild = relationWithChildAttribute?.firstWhere(
            (element) =>
                element.attributes?.name ==
                parentDetails.guardianDetails?.relationWithChild);
        selectedGuardianCountryEntity = CommonDataClass(
            id: relationWithChild?.id,
            value: relationWithChild?.attributes?.name);
      }
    }
    if (parentDetails.guardianDetails?.country is CommonDataClass) {
      selectedGuardianCountrySubject
          .add(parentDetails.guardianDetails?.country?.value ?? '');
      selectedGuardianCountryEntity = parentDetails.guardianDetails?.country;
    } else {
      selectedGuardianCountrySubject
          .add(parentDetails.guardianDetails?.country ?? '');
      if ((countryAttribute ?? []).any((element) =>
          element.attributes?.name == parentDetails.guardianDetails?.country)) {
        var country = countryAttribute?.firstWhere((element) =>
            element.attributes?.name == parentDetails.guardianDetails?.country);
        selectedGuardianCountryEntity =
            CommonDataClass(id: country?.id, value: country?.attributes?.name);
      }
    }
    // if(parentDetails.guardianDetails?.state is CommonDataClass){
    //   selectedGuardianStateSubject
    //       .add(parentDetails.guardianDetails?.state?.value ?? '');
    //   selectedGuardianStateEntity =
    //       (parentDetails.guardianDetails?.state is CommonDataClass)
    //           ? parentDetails.guardianDetails?.state
    //           : null;
    // } else {
    //   selectedGuardianStateSubject.add(parentDetails.guardianDetails?.state ?? '');
    //   if ((stateAttribute ?? []).any((element) =>
    //       element.attributes?.name == parentDetails.guardianDetails?.state)) {
    //     var state = stateAttribute?.firstWhere((element) =>
    //         element.attributes?.name == parentDetails.guardianDetails?.state);
    //     selectedGuardianStateEntity = CommonDataClass(
    //         id: state?.id, value: state?.attributes?.name);
    //   }
    // }
    // if(parentDetails.guardianDetails?.city is CommonDataClass){
    //   selectedGuardianCitySubject
    //       .add(parentDetails.guardianDetails?.city?.value ?? '');
    //   selectedGuardianCityEntity = parentDetails.guardianDetails?.city;
    // } else {
    //   selectedGuardianCitySubject.add(parentDetails.guardianDetails?.city ?? '');
    //   if ((cityAttribute ?? []).any((element) =>
    //       element.attributes?.name == parentDetails.guardianDetails?.city)) {
    //     var city = cityAttribute?.firstWhere((element) =>
    //         element.attributes?.name == parentDetails.guardianDetails?.city);
    //     selectedGuardianCityEntity = CommonDataClass(
    //         id: city?.id, value: city?.attributes?.name);
    //   }
    // }

    if ((parentDetails.siblingDetails ?? []).isNotEmpty &&
        !parentDetails.siblingDetails![0].isOnlyDOB()) {
      radioButtonController1.selectItem(parentDetails.siblingDetails?[0].type);
      siblingFirstNameController.text =
          parentDetails.siblingDetails?[0].firstName ?? '';
      siblingLastNameController.text =
          parentDetails.siblingDetails?[0].lastName ?? '';
      siblingsEnrollmentController.text =
          parentDetails.siblingDetails?[0].enrollmentNumber ?? '';
      siblingsSchoolController.text =
          parentDetails.siblingDetails?[0].school ?? '';
      if (!(parentDetails.siblingDetails?[0].dob ?? "").isEmptyOrNull()) {
        if (DateFormat('dd/MM/yyyy').parse(
                (parentDetails.siblingDetails?[0].dob ?? '')
                    .replaceAll('-', '/')) !=
            DateTime.now()) {
          siblingDOB = DateFormat('dd/MM/yyyy').parse(
              (parentDetails.siblingDetails?[0].dob ?? '')
                  .replaceAll('-', '/'));
        }
      }
      if (parentDetails.siblingDetails?[0].gender is CommonDataClass) {
        siblingGender.add(parentDetails.siblingDetails?[0].gender?.value ?? '');
        selectedSiblingGender = parentDetails.siblingDetails?[0].gender;
      } else {
        siblingGender.value = parentDetails.siblingDetails?[0].gender;
        if ((genderAttribute ?? []).any((element) =>
            (element.attributes?.name ?? '')
                .contains(parentDetails.siblingDetails?[0].gender ?? ''))) {
          var gender = genderAttribute?.firstWhere((element) =>
              (element.attributes?.name ?? '')
                  .contains(parentDetails.siblingDetails?[0].gender ?? ''));
          selectedSiblingGender =
              CommonDataClass(id: gender?.id, value: gender?.attributes?.name);
        }
      }
      if (parentDetails.siblingDetails?[0].grade is CommonDataClass) {
        siblingGrade.add(parentDetails.siblingDetails?[0].grade?.value ?? '');
        selectedSiblingGrade = parentDetails.siblingDetails?[0].grade;
      } else {
        siblingGrade.value = parentDetails.siblingDetails?[0].grade;
        if ((gradeTypesAttribute ?? []).any((element) =>
            (element.attributes?.name ?? '')
                .contains(parentDetails.siblingDetails?[0].grade ?? ''))) {
          var grade = gradeTypesAttribute?.firstWhere((element) =>
              (element.attributes?.name ?? '')
                  .contains(parentDetails.siblingDetails?[0].grade ?? ''));
          selectedSiblingGrade =
              CommonDataClass(id: grade?.id, value: grade?.attributes?.name);
        }
      }
    }
  }

  addContactDetails(ContactDetails contactDetails) {
    emergencyContact.value =
        contactDetails.pointOfContact?.firstPreference?.emailOfParent ?? '';
    houseOrBuildingController.text =
        contactDetails.residentialAddress?.currentAddress?.house ?? "";
    streetNameController.text =
        contactDetails.residentialAddress?.currentAddress?.street ?? "";
    landMarkController.text =
        contactDetails.residentialAddress?.currentAddress?.landmark ?? "";
    if (contactDetails.residentialAddress?.currentAddress?.country
            is CommonDataClass ||
        contactDetails.residentialAddress?.currentAddress?.city
            is CommonDataClass) {
      residentialCountry =
          contactDetails.residentialAddress?.currentAddress?.country;
      residentialState =
          contactDetails.residentialAddress?.currentAddress?.state;
      residentialCity = contactDetails.residentialAddress?.currentAddress?.city;
      selectedResidentialCity.value =
          contactDetails.residentialAddress?.currentAddress?.country?.value ??
              '';
      selectedResidentialState.value =
          contactDetails.residentialAddress?.currentAddress?.state?.value ?? '';
      selectedResidentialCountry.value =
          contactDetails.residentialAddress?.currentAddress?.country?.value ??
              '';
    } else {
      selectedResidentialCity.value =
          contactDetails.residentialAddress?.currentAddress?.city ?? '';
      selectedResidentialState.value =
          contactDetails.residentialAddress?.currentAddress?.state ?? '';
      selectedResidentialCountry.value =
          contactDetails.residentialAddress?.currentAddress?.country ?? '';
      residentialPinCodeController.text =
          contactDetails.residentialAddress?.currentAddress?.pinCode ?? "";
      if (residentialPinCodeController.text.isNotEmpty) {
        getCityAndStateByPincode(
            pincode: residentialPinCodeController.text,
            infoType: "currentAddress");
      }
      if ((countryAttribute ?? []).any((element) =>
          element.attributes?.name == selectedResidentialCountry.value)) {
        var country = countryAttribute?.firstWhere((element) =>
            (element.attributes?.name ?? '')
                .contains(selectedResidentialCountry.value));
        residentialCountry =
            CommonDataClass(id: country?.id, value: country?.attributes?.name);
      }
      //   if ((stateAttribute ?? []).any((element) =>
      //       element.attributes?.name == selectedResidentialState.value)) {
      //     var state = stateAttribute?.firstWhere((element) =>
      //         (element.attributes?.name ?? '')
      //             .contains(selectedResidentialState.value));
      //     residentialState =
      //         CommonDataClass(id: state?.id, value: state?.attributes?.name);
      //   }
      //   if ((cityAttribute ?? []).any((element) =>
      //       element.attributes?.name == selectedResidentialCity.value)) {
      //     var city = cityAttribute?.firstWhere((element) =>
      //         (element.attributes?.name ?? '')
      //             .contains(selectedResidentialCity.value));
      //     residentialCity =
      //         CommonDataClass(id: city?.id, value: city?.attributes?.name);
      //   }
      // }
      if (contactDetails.residentialAddress?.permanentAddress != null) {
        permanentHouseOrBuildingController.text =
            contactDetails.residentialAddress?.permanentAddress?.house ?? "";
        permanentStreetNameController.text =
            contactDetails.residentialAddress?.permanentAddress?.street ?? "";
        permanentLandMarkController.text =
            contactDetails.residentialAddress?.currentAddress?.landmark ?? "";
        permanentResidentialPinCodeController.text =
            contactDetails.residentialAddress?.permanentAddress?.pinCode ?? "";
        if (permanentResidentialPinCodeController.text.isNotEmpty) {
          getCityAndStateByPincode(
              pincode: permanentResidentialPinCodeController.text,
              infoType: "permanentAddress");
        }

        // if (contactDetails.residentialAddress?.permanentAddress?.country is CommonDataClass ||
        //     contactDetails.residentialAddress?.permanentAddress?.city is CommonDataClass) {
        //   permanentResidentialCountry = contactDetails.residentialAddress?.permanentAddress?.country;
        //   permanentResidentialState = contactDetails.residentialAddress?.permanentAddress?.state;
        //   permanentResidentialCity = contactDetails.residentialAddress?.permanentAddress?.city;
        //   selectedPermanentResidentialCity.value =
        //       contactDetails.residentialAddress?.permanentAddress?.city?.value ?? '';
        //   selectedPermanentResidentialState.value =
        //       contactDetails.residentialAddress?.permanentAddress?.state?.value ?? '';
        //   selectedPermanentResidentialCountry.value =
        //       contactDetails.residentialAddress?.permanentAddress?.country?.value ?? '';
        // } else {
        //   selectedPermanentResidentialCity.value =
        //       contactDetails.residentialAddress?.permanentAddress?.city ?? '';
        //   selectedPermanentResidentialState.value =
        //       contactDetails.residentialAddress?.permanentAddress?.state ?? '';
        //   selectedPermanentResidentialCountry.value =
        //       contactDetails.residentialAddress?.permanentAddress?.country ?? '';
        //   if ((countryAttribute ?? []).any((element) =>
        //       element.attributes?.name == selectedPermanentResidentialCountry.value)) {
        //     var country = countryAttribute?.firstWhere((element) =>
        //         (element.attributes?.name ?? '')
        //             .contains(selectedResidentialCountry.value));
        //     permanentResidentialCountry =
        //         CommonDataClass(id: country?.id, value: country?.attributes?.name);
        //   }
        // if ((stateAttribute ?? []).any((element) =>
        //     element.attributes?.name == selectedPermanentResidentialState.value)) {
        //   var state = stateAttribute?.firstWhere((element) =>
        //       (element.attributes?.name ?? '')
        //           .contains(selectedPermanentResidentialState.value));
        //   permanentResidentialState =
        //       CommonDataClass(id: state?.id, value: state?.attributes?.name);
        // }
        // if ((cityAttribute ?? []).any((element) =>
        //     element.attributes?.name == selectedPermanentResidentialCity.value)) {
        //   var city = cityAttribute?.firstWhere((element) =>
        //       (element.attributes?.name ?? '')
        //           .contains(selectedPermanentResidentialCity.value));
        //   permanentResidentialCity =
        //       CommonDataClass(id: city?.id, value: city?.attributes?.name);
        // }
      }
    }
    if (contactDetails.pointOfContact?.firstPreference != null) {
      parentEmailIdController1.text =
          contactDetails.pointOfContact?.firstPreference?.email ?? '';
      parentMobileNumberController1.text =
          contactDetails.pointOfContact?.firstPreference?.mobile ?? '';
      contactParentTypePhone1.value =
          contactDetails.pointOfContact?.firstPreference?.mobileOfParent ?? '';
      contactParentTypeEmail1.value =
          contactDetails.pointOfContact?.firstPreference?.emailOfParent ?? '';
    }
    if (contactDetails.pointOfContact?.secondPreference != null) {
      parentEmailIdController2.text =
          contactDetails.pointOfContact?.secondPreference?.email ?? '';
      parentMobileNumberController2.text =
          contactDetails.pointOfContact?.secondPreference?.mobile ?? '';
      contactParentTypePhone2.value =
          contactDetails.pointOfContact?.secondPreference?.mobileOfParent ?? '';
      contactParentTypeEmail2.value =
          contactDetails.pointOfContact?.secondPreference?.emailOfParent ?? '';
    }
    if (contactDetails.pointOfContact?.thirdPreference != null) {
      parentEmailIdController3.text =
          contactDetails.pointOfContact?.thirdPreference?.email ?? '';
      parentMobileNumberController3.text =
          contactDetails.pointOfContact?.thirdPreference?.mobile ?? '';
      contactParentTypePhone3.value =
          contactDetails.pointOfContact?.thirdPreference?.mobileOfParent ?? '';
      contactParentTypeEmail3.value =
          contactDetails.pointOfContact?.thirdPreference?.emailOfParent ?? '';
    }
    radioButtonController3.selectItem(
        ((contactDetails.residentialAddress?.isPermanentAddress ??
                    ''.toLowerCase()) ==
                'yes')
            ? "Yes"
            : "No");
  }

  addMedicalDetails(MedicalDetails medicalDetails) {
    yearOfHospitalizationController.text =
        medicalDetails.yearOfHospitalization ?? "";
    reasonOfHospitalizationController.text =
        medicalDetails.reasonOfHopitalization ?? "";
    specificDisabilityController.text =
        medicalDetails.physicalDisabilityDescription ?? "";
    specifyMedicalHistoryController.text =
        medicalDetails.medicalHistoryDescription ?? "";
    specifyAllergiesController.text = medicalDetails.allergyDescription ?? "";
    if (medicalDetails.bloodGroup is CommonDataClass) {
      selectedBloodGroup.add(medicalDetails.bloodGroup?.value ?? '');
      selectedBloodGroupEntity = medicalDetails.bloodGroup;
    } else {
      selectedBloodGroup.value = medicalDetails.bloodGroup ?? '';
      if ((bloodGroupAttribute ?? []).any((element) =>
          (element.attributes?.name ?? '')
              .contains(medicalDetails.bloodGroup ?? ''))) {
        var bloodGroup = bloodGroupAttribute?.firstWhere((element) =>
            (element.attributes?.name ?? '')
                .contains(medicalDetails.bloodGroup ?? ''));
        selectedBloodGroupEntity = CommonDataClass(
            id: bloodGroup?.id, value: bloodGroup?.attributes?.name);
      }
    }
    if (medicalDetails.personalisedLearningNeedsDescription
        is CommonDataClass) {
      selectedPersonalisedLearningNeedSubject.add(
          medicalDetails.personalisedLearningNeedsDescription?.value ?? '');
      selectedPersonalisedLearningNeed =
          medicalDetails.personalisedLearningNeedsDescription;
    } else {
      selectedPersonalisedLearningNeedSubject.value =
          medicalDetails.personalisedLearningNeedsDescription ?? '';
      if ((personalisedLearningNeedsAttribute ?? []).any((element) =>
          (element.attributes?.name ?? '').contains(
              medicalDetails.personalisedLearningNeedsDescription ?? ''))) {
        var personalisedLearningNeeds = personalisedLearningNeedsAttribute
            ?.firstWhere((element) => (element.attributes?.name ?? '').contains(
                medicalDetails.personalisedLearningNeedsDescription ?? ''));
        selectedPersonalisedLearningNeed = CommonDataClass(
            id: personalisedLearningNeeds?.id,
            value: personalisedLearningNeeds?.attributes?.name);
      }
    }
    // personalisedLearningNeedsController.text =
    //     medicalDetails.personalisedLearningNeedsDescription ?? '';
    radioButtonController4.selectItem(
        (medicalDetails.isChildHospitalised ?? false) ? "Yes" : "No");
    radioButtonController5.selectItem(
        (medicalDetails.hasPhysicalDisability ?? false) ? "Yes" : "No");
    radioButtonController7
        .selectItem((medicalDetails.hasMedicalHistory ?? false) ? "Yes" : "No");
    radioButtonController8
        .selectItem((medicalDetails.hasAllergy ?? false) ? "Yes" : "No");
    radioButtonController9.selectItem(
        (medicalDetails.hasPersonalisedLearningNeeds ?? false) ? "Yes" : "No");
  }

  addBankDetails(BankDetails bankDetails) {
    ifscCodeController.text = bankDetails.ifscCode ?? "";
    bankNameController.text = bankDetails.bankName ?? "";
    branchNameController.text = bankDetails.branchName ?? "";
    accountHolderNameController.text = bankDetails.accountHolderName ?? "";
    accountTypeController.text = bankDetails.accountType ?? "";
    accountNumberController.text = bankDetails.accountNumber ?? "";
    upiController.text = bankDetails.upiInfo ?? "";
  }

  Future<void> saveParentDetails(String enquiryId) async {
    ParentInfoEntity parentInfoEntity = ParentInfoEntity();

    parentInfo?.fatherDetails?.firstName =
        fatherFirstNameController.text.trim();
    parentInfo?.fatherDetails?.lastName = fatherLastNameController.text.trim();
    parentInfo?.fatherDetails?.aadharNumber =
        fatherAdharCardController.text.trim();
    parentInfo?.fatherDetails?.panNumber = fatherPanCardController.text.trim();
    parentInfo?.fatherDetails?.qualification = selectedFatherQualification;
    parentInfo?.fatherDetails?.organisationName = selectedFatherOrganization;
    parentInfo?.fatherDetails?.designationName = selectedFatherDesignation;
    parentInfo?.fatherDetails?.officeAddress =
        officeAddressController.text.trim();
    parentInfo?.fatherDetails?.pinCode = pinCodeController.text.trim();
    parentInfo?.fatherDetails?.emailId = fatherEmailController.text.trim();
    parentInfo?.fatherDetails?.mobileNumber =
        fatherMobileController.text.trim();
    parentInfo?.fatherDetails?.occupation = selectedFatherOccupation;
    parentInfo?.fatherDetails?.area = fatherOfficeAreaController.text.trim();
    parentInfo?.fatherDetails?.country = selectedFatherCountryEntity;
    parentInfo?.fatherDetails?.state = selectedFatherStateEntity;
    parentInfo?.fatherDetails?.city = selectedFatherCityEntity;

    parentInfo?.motherDetails?.firstName =
        motherFirstNameController.text.trim();
    parentInfo?.motherDetails?.lastName = motherLastNameController.text.trim();
    parentInfo?.motherDetails?.aadharNumber =
        motherAdharCardController.text.trim();
    parentInfo?.motherDetails?.panNumber = motherPanCardController.text.trim();
    parentInfo?.motherDetails?.qualification = selectedMotherQualification;
    parentInfo?.motherDetails?.organisationName = selectedMotherOrganization;
    parentInfo?.motherDetails?.designationName = selectedMotherDesignation;
    parentInfo?.motherDetails?.officeAddress =
        motherOfficeAddressController.text.trim();
    parentInfo?.motherDetails?.pinCode = motherPinCodeController.text.trim();
    parentInfo?.motherDetails?.emailId = motherEmailController.text.trim();
    parentInfo?.motherDetails?.mobileNumber =
        motherMobileController.text.trim();
    parentInfo?.motherDetails?.occupation = selectedMotherOccupation;
    parentInfo?.motherDetails?.area = motherOfficeAreaController.text.trim();
    parentInfo?.motherDetails?.country = selectedMotherCountryEntity;
    parentInfo?.motherDetails?.state = selectedMotherStateEntity;
    parentInfo?.motherDetails?.city = selectedMotherCityEntity;

    parentInfo?.guardianDetails?.firstName =
        guardianFirstNameController.text.trim();
    parentInfo?.guardianDetails?.lastName =
        guardianLastNameController.text.trim();
    parentInfo?.guardianDetails?.aadharNumber =
        guardianAdharCardController.text.trim();
    parentInfo?.guardianDetails?.panNumber =
        guardianPanCardController.text.trim();
    parentInfo?.guardianDetails?.houseNumber =
        guardianHouseNumberController.text.trim();
    parentInfo?.guardianDetails?.landmark =
        guardianLandmarkController.text.trim();
    parentInfo?.guardianDetails?.street = guardianStreetController.text.trim();
    parentInfo?.guardianDetails?.relationWithChild =
        selectedRelationWithChildEntity;
    parentInfo?.guardianDetails?.pincode =
        guardianPinCodeController.text.trim();
    parentInfo?.guardianDetails?.emailId = guardianEmailController.text.trim();
    parentInfo?.guardianDetails?.mobileNumber =
        guardianMobileController.text.trim();
    parentInfo?.guardianDetails?.guardianType =
        radioButtonController.selectedItem ?? '';
    parentInfo?.guardianDetails?.country = selectedGuardianCountryEntity;
    parentInfo?.guardianDetails?.state = selectedGuardianStateEntity;
    parentInfo?.guardianDetails?.city = selectedGuardianCityEntity;
    parentInfo?.childCustodyDetail?.areParentsSeparated =
        radioButtonController2.selectedItem ?? "No";
    parentInfo?.childCustodyDetail?.childCustody =
        (radioButtonController2.selectedItem == "No")
            ? ""
            : radioButtonController10.selectedItem;
    parentInfo?.siblingDetails?.add(SiblingDetail(
      type: radioButtonController1.selectedItem,
      enrollmentNumber:
          ((radioButtonController1.selectedItem ?? '') == "Vibgyor Student")
              ? siblingsEnrollmentController.text.trim()
              : "",
      dob: (siblingDOB == null)
          ? ""
          : DateFormat('dd-MM-yyyy').format(siblingDOB ?? DateTime.now()),
      firstName: siblingFirstNameController.text.trim(),
      lastName: siblingLastNameController.text.trim(),
      gender: selectedSiblingGender,
      grade: selectedSiblingGrade,
      school: siblingsSchoolController.text.trim(),
    ));
    parentInfo?.childCustodyDetail = ChildCustodyDetail(
      areParentsSeparated: radioButtonController2.selectedItem,
      childCustody: radioButtonController2.selectedItem == "Yes"
          ? radioButtonController10.selectedItem ?? ''
          : "",
    );
    parentInfoEntity = parentInfoEntity.restore(parentInfo ?? ParentInfo());
    await updateParentDetail(enquiryId, parentInfoEntity);
  }

  Future<void> saveMedicalDetails(String enquiryId) async {
    MedicalDetailsEntity medicalDetailsEntity = MedicalDetailsEntity();
    medicalDetails?.isChildHospitalised =
        radioButtonController4.selectedItem == "Yes" ? true : false;
    medicalDetails?.yearOfHospitalization =
        medicalDetails?.isChildHospitalised ?? false
            ? yearOfHospitalizationController.text.trim()
            : "";
    medicalDetails?.reasonOfHopitalization =
        medicalDetails?.isChildHospitalised ?? false
            ? reasonOfHospitalizationController.text.trim()
            : "";
    medicalDetails?.hasPhysicalDisability =
        radioButtonController5.selectedItem == "Yes" ? true : false;
    medicalDetails?.physicalDisabilityDescription =
        medicalDetails?.hasPhysicalDisability ?? false
            ? specificDisabilityController.text.trim()
            : "";
    medicalDetails?.hasMedicalHistory =
        radioButtonController7.selectedItem == "Yes" ? true : false;
    medicalDetails?.hasAllergy =
        radioButtonController8.selectedItem == "Yes" ? true : false;
    medicalDetails?.hasPersonalisedLearningNeeds =
        radioButtonController9.selectedItem == "Yes" ? true : false;
    medicalDetails?.bloodGroup = selectedBloodGroupEntity;
    medicalDetails?.medicalHistoryDescription =
        medicalDetails?.hasMedicalHistory ?? false
            ? specifyMedicalHistoryController.text.trim()
            : "";
    medicalDetails?.allergyDescription = medicalDetails?.hasAllergy ?? false
        ? specifyAllergiesController.text.trim()
        : "";
    medicalDetails?.personalisedLearningNeedsDescription =
        medicalDetails?.hasPersonalisedLearningNeeds ?? false
            ? selectedPersonalisedLearningNeed
            : null;
    medicalDetailsEntity = medicalDetailsEntity.restore(medicalDetails!);
    await updateMedicalDetail(enquiryId, medicalDetailsEntity);
  }

  Future<void> saveBankDetails(String enquiryId) async {
    BankDetailsEntity bankDetailsEntity = BankDetailsEntity();
    bankDetails?.ifscCode = ifscCodeController.text.trim();
    bankDetails?.bankName = bankNameController.text.trim();
    bankDetails?.branchName = branchNameController.text.trim();
    bankDetails?.accountHolderName = accountHolderNameController.text.trim();
    bankDetails?.accountType = accountTypeController.text.trim();
    bankDetails?.accountNumber = accountNumberController.text.trim();
    bankDetails?.upiInfo = upiController.text.trim();
    bankDetailsEntity = bankDetailsEntity.restore(bankDetails ?? BankDetails());
    await updateBankDetail(enquiryId, bankDetailsEntity);
  }

  Future<void> saveContactDetails(String enquiryId) async {
    ContactDetailsEntity contactDetail = ContactDetailsEntity();
    contactDetails = ContactDetails(
        residentialAddress: ResidentialAddressDetail(
            currentAddress: ResidentialAddress(
              house: houseOrBuildingController.text.trim(),
              street: streetNameController.text.trim(),
              landmark: landMarkController.text.trim(),
              country: residentialCountry,
              state: residentialState,
              city: residentialCity,
              pinCode: residentialPinCodeController.text.trim(),
            ),
            permanentAddress: radioButtonController3.selectedItem == "No"
                ? ResidentialAddress(
                    house: permanentHouseOrBuildingController.text.trim(),
                    street: permanentStreetNameController.text.trim(),
                    landmark: permanentLandMarkController.text.trim(),
                    country: permanentResidentialCountry,
                    state: permanentResidentialState,
                    city: permanentResidentialCity,
                    pinCode: permanentResidentialPinCodeController.text.trim(),
                  )
                : null,
            isPermanentAddress:
                (radioButtonController3.selectedItem ?? "No") == "No"
                    ? true
                    : false),
        emergencyContact: emergencyContact.value,
        pointOfContact: PointOfContactDetail(
          firstPreference: (parentEmailIdController1.text.isEmpty ||
                  parentMobileNumberController1.text.isEmpty ||
                  contactParentTypePhone1.value.isEmptyOrNull() ||
                  contactParentTypeEmail1.value.isEmptyOrNull())
              ? null
              : PreferenceDetail(
                  email: parentEmailIdController1.text.trim(),
                  emailOfParent: contactParentTypeEmail1.value,
                  mobile: parentMobileNumberController1.text.trim(),
                  mobileOfParent: contactParentTypePhone1.value,
                ),
          secondPreference: (parentEmailIdController2.text.isEmpty ||
                  parentMobileNumberController2.text.isEmpty ||
                  contactParentTypePhone2.value.isEmptyOrNull() ||
                  contactParentTypeEmail2.value.isEmptyOrNull())
              ? null
              : PreferenceDetail(
                  email: parentEmailIdController2.text.trim(),
                  emailOfParent: contactParentTypeEmail2.value,
                  mobile: parentMobileNumberController2.text.trim(),
                  mobileOfParent: contactParentTypePhone2.value,
                ),
        ));
    contactDetail = contactDetail.restore(contactDetails ?? ContactDetails());
    await updateContactDetail(enquiryId, contactDetail);
  }

  Future<void> saveStudentDetail() async {
    if ((enquiryDetailArgs?.enquiryType?.toLowerCase() ?? '') ==
        EnquiryTypeEnum.kidsClub.type) {
      IvtDetailResponseEntity ivtDetail = IvtDetailResponseEntity();
      ivtDetailSubject?.value.schoolLocation = selectedSchoolLocationEntity;
      ivtDetailSubject?.value.studentDetails?.firstName =
          studentFirstNameController.text.trim();
      ivtDetailSubject?.value.studentDetails?.lastName =
          studentLastNameController.text.trim();
      ivtDetailSubject?.value.studentDetails?.dob =
          DateFormat('dd-MM-yyyy').format((studentDob ?? DateTime.now()));
      ivtDetailSubject?.value.studentDetails?.aadhar =
          studentAadharController.text.trim();
      ivtDetailSubject?.value.studentDetails?.eligibleGrade =
          studentEligibleGradeController.text.trim();
      ivtDetailSubject?.value.studentDetails?.placeOfBirth =
          placeOfBirthController.text.trim();
      ivtDetailSubject?.value.studentDetails?.religion = selectedReligion;
      ivtDetailSubject?.value.studentDetails?.caste = selectedCaste;
      ivtDetailSubject?.value.studentDetails?.subCaste = selectedSubCaste;
      ivtDetailSubject?.value.studentDetails?.nationality = selectedNationality;
      ivtDetailSubject?.value.studentDetails?.motherTongue =
          selectedMotherTongue;
      ivtDetailSubject?.value.studentDetails?.gender = selectedGenderEntity;
      ivtDetailSubject?.value.studentDetails?.grade = selectedGradeEntity;
      ivtDetailSubject?.value.existingSchoolDetails?.name =
          existingSchoolNameController.text;
      ivtDetailSubject?.value.existingSchoolDetails?.grade =
          selectedExistingSchoolGradeEntity;
      ivtDetailSubject?.value.existingSchoolDetails?.board =
          selectedExistingSchoolGradeEntity;
      ivtDetailSubject?.value.board = selectedBoardEntity;
      ivtDetailSubject?.value.course = selectedCourseEntity;
      ivtDetailSubject?.value.stream = selectedStreamEntity;
      ivtDetailSubject?.value.shift = selectedShiftEntity;
      ivtDetailSubject?.value.enquirerParent = selectedParentTypeSubject.value;
      ivtDetailSubject?.value.parentDetails?.fatherDetails?.firstName =
          studentsFatherFirstNameController.text.trim();
      ivtDetailSubject?.value.parentDetails?.fatherDetails?.lastName =
          studentsFatherLastNameController.text.trim();
      ivtDetailSubject?.value.parentDetails?.fatherDetails?.mobile =
          studentsFatherContactController.text.trim();
      ivtDetailSubject?.value.parentDetails?.fatherDetails?.email =
          studentsFatherEmailController.text.trim();
      ivtDetailSubject?.value.parentDetails?.motherDetails?.firstName =
          studentsMotherFirstNameController.text.trim();
      ivtDetailSubject?.value.parentDetails?.motherDetails?.lastName =
          studentsMotherLastNameController.text.trim();
      ivtDetailSubject?.value.parentDetails?.motherDetails?.mobile =
          studentsMotherContactController.text.trim();
      ivtDetailSubject?.value.parentDetails?.motherDetails?.email =
          studentsMotherEmailController.text.trim();
      ivtDetail = ivtDetail.restore(ivtDetailSubject!.value);
      updateIvtDetails(
          enquiryID: enquiryDetailArgs?.enquiryId ?? '', ivtDetail: ivtDetail);
    } else if ((enquiryDetailArgs?.enquiryType ?? '') ==
        EnquiryTypeEnum.psa.type) {
      PsaDetailResponseEntity psaDetail = PsaDetailResponseEntity();
      psaDetailSubject?.value.schoolLocation = selectedSchoolLocationEntity;
      psaDetailSubject?.value.studentDetails?.firstName =
          studentFirstNameController.text.trim();
      psaDetailSubject?.value.studentDetails?.lastName =
          studentLastNameController.text.trim();
      psaDetailSubject?.value.studentDetails?.dob =
          DateFormat('dd-MM-yyyy').format((studentDob ?? DateTime.now()));
      psaDetailSubject?.value.studentDetails?.aadhar =
          studentAadharController.text.trim();
      psaDetailSubject?.value.studentDetails?.eligibleGrade =
          studentEligibleGradeController.text.trim();
      psaDetailSubject?.value.studentDetails?.placeOfBirth =
          placeOfBirthController.text.trim();
      psaDetailSubject?.value.studentDetails?.religion = selectedReligion;
      psaDetailSubject?.value.studentDetails?.caste = selectedCaste;
      psaDetailSubject?.value.studentDetails?.subCaste = selectedSubCaste;
      psaDetailSubject?.value.studentDetails?.nationality = selectedNationality;
      psaDetailSubject?.value.studentDetails?.motherTongue =
          selectedMotherTongue;
      psaDetailSubject?.value.studentDetails?.gender = selectedGenderEntity;
      psaDetailSubject?.value.studentDetails?.grade = selectedGradeEntity;
      psaDetailSubject?.value.existingSchoolDetails?.name =
          existingSchoolNameController.text.trim();
      psaDetailSubject?.value.existingSchoolDetails?.grade =
          selectedExistingSchoolGradeEntity;
      psaDetailSubject?.value.existingSchoolDetails?.board =
          selectedExistingSchoolBoardEntity;
      psaDetailSubject?.value.psaBatch = selectedPsaBatchEntity;
      psaDetailSubject?.value.psaCategory = selectedPsaCategoryEntity;
      psaDetailSubject?.value.psaSubCategory = selectedPsaSubCategoryEntity;
      psaDetailSubject?.value.psaSubType = selectedPsaSubTypeEntity;
      psaDetailSubject?.value.psaPeriodOfService =
          selectedPeriodOfServiceEntity;
      psaDetailSubject?.value.enquirerParent = selectedParentTypeSubject.value;
      psaDetailSubject?.value.parentDetails?.fatherDetails?.firstName =
          studentsFatherFirstNameController.text.trim();
      psaDetailSubject?.value.parentDetails?.fatherDetails?.lastName =
          studentsFatherLastNameController.text.trim();
      psaDetailSubject?.value.parentDetails?.fatherDetails?.mobile =
          studentsFatherContactController.text.trim();
      psaDetailSubject?.value.parentDetails?.fatherDetails?.email =
          studentsFatherEmailController.text.trim();
      psaDetailSubject?.value.parentDetails?.motherDetails?.firstName =
          studentsMotherFirstNameController.text.trim();
      psaDetailSubject?.value.parentDetails?.motherDetails?.lastName =
          studentsMotherLastNameController.text.trim();
      psaDetailSubject?.value.parentDetails?.motherDetails?.mobile =
          studentsMotherContactController.text.trim();
      psaDetailSubject?.value.parentDetails?.motherDetails?.email =
          studentsMotherEmailController.text.trim();
      psaDetail = psaDetail.restore(psaDetailSubject!.value);
      updatePsaDetails(
          enquiryID: enquiryDetailArgs?.enquiryId ?? '', psaDetail: psaDetail);
    } else {
      NewAdmissionDetailEntity newAdmissionDetail = NewAdmissionDetailEntity();
      newAdmissionDetailSubject?.value.schoolLocation =
          selectedSchoolLocationEntity!;
      newAdmissionDetailSubject?.value.studentDetails?.firstName =
          studentFirstNameController.text.trim();
      newAdmissionDetailSubject?.value.studentDetails?.lastName =
          studentLastNameController.text.trim();
      newAdmissionDetailSubject?.value.studentDetails?.dob =
          DateFormat('yyyy-MM-dd').format((studentDob ?? DateTime.now()));
      newAdmissionDetailSubject?.value.studentDetails?.aadhar =
          studentAadharController.text.trim();
      newAdmissionDetailSubject?.value.studentDetails?.eligibleGrade =
          studentEligibleGradeController.text.trim();
      newAdmissionDetailSubject?.value.studentDetails?.gender =
          selectedGenderEntity!;
      newAdmissionDetailSubject?.value.studentDetails?.grade =
          selectedGradeEntity!;
      newAdmissionDetailSubject?.value.studentDetails?.placeOfBirth =
          placeOfBirthController.text.trim();
      newAdmissionDetailSubject?.value.studentDetails?.religion =
          selectedReligion;
      newAdmissionDetailSubject?.value.studentDetails?.caste = selectedCaste;
      newAdmissionDetailSubject?.value.studentDetails?.subCaste =
          selectedSubCaste;
      newAdmissionDetailSubject?.value.studentDetails?.nationality =
          selectedNationality;
      newAdmissionDetailSubject?.value.studentDetails?.motherTongue =
          selectedMotherTongue;
      newAdmissionDetailSubject?.value.existingSchoolDetails?.name =
          existingSchoolNameController.text.trim();
      newAdmissionDetailSubject?.value.existingSchoolDetails?.grade =
          selectedExistingSchoolGradeEntity!;
      newAdmissionDetailSubject?.value.existingSchoolDetails?.board =
          selectedExistingSchoolBoardEntity!;
      newAdmissionDetailSubject?.value.enquirerParent =
          selectedParentTypeSubject.value;
      if (newAdmissionDetailSubject?.value.enquirerParent == "Father") {
        newAdmissionDetailSubject?.value.parentDetails?.fatherDetails
            ?.firstName = studentsFatherFirstNameController.text.trim();
        newAdmissionDetailSubject?.value.parentDetails?.fatherDetails
            ?.lastName = studentsFatherLastNameController.text.trim();
        newAdmissionDetailSubject?.value.parentDetails?.fatherDetails?.mobile =
            studentsFatherContactController.text.trim();
        newAdmissionDetailSubject?.value.parentDetails?.fatherDetails?.email =
            studentsFatherEmailController.text.trim();
      } else {
        newAdmissionDetailSubject?.value.parentDetails?.motherDetails
            ?.firstName = studentsMotherFirstNameController.text.trim();
        newAdmissionDetailSubject?.value.parentDetails?.motherDetails
            ?.lastName = studentsMotherLastNameController.text.trim();
        newAdmissionDetailSubject?.value.parentDetails?.motherDetails?.mobile =
            studentsMotherContactController.text.trim();
        newAdmissionDetailSubject?.value.parentDetails?.motherDetails?.email =
            studentsMotherEmailController.text.trim();
      }
      newAdmissionDetail =
          newAdmissionDetail.restore(newAdmissionDetailSubject!.value);
      updateNewAdmissionDetails(
          enquiryID: enquiryDetailArgs?.enquiryId ?? '',
          newAdmissionDetail: newAdmissionDetail);
    }
  }

  void clearBankDetails() {
    ifscCodeController.clear();
    bankNameController.clear();
    branchNameController.clear();
    accountHolderNameController.clear();
    accountTypeController.clear();
    accountNumberController.clear();
    upiController.clear();
  }

  void clearMedicalDetails() {
    yearOfHospitalizationController.clear();
    reasonOfHospitalizationController.clear();
    specificDisabilityController.clear();
    specifyMedicalHistoryController.clear();
    specifyAllergiesController.clear();
    personalisedLearningNeedsController.clear();
    selectedBloodGroup.add('');
    selectedBloodGroupEntity = null;
    radioButtonController4.selectItem(null);
    radioButtonController5.selectItem(null);
    radioButtonController7.selectItem(null);
    radioButtonController8.selectItem(null);
    radioButtonController9.selectItem(null);
  }

  void clearContactDetails() {
    houseOrBuildingController.clear();
    streetNameController.clear();
    landMarkController.clear();
    residentialPinCodeController.clear();
    parentEmailIdController1.clear();
    parentMobileNumberController1.clear();
    parentEmailIdController2.clear();
    parentMobileNumberController2.clear();
    contactParentTypePhone1.value = '';
    contactParentTypeEmail1.value = '';
    contactParentTypePhone2.value = '';
    contactParentTypeEmail2.value = '';
    emergencyContact.value = '';
    residentialCountry = null;
    residentialState = null;
    residentialCity = null;
    residentialPinCode = null;
    selectedResidentialCity.add('');
    selectedResidentialState.add('');
    selectedResidentialCountry.add('');
    radioButtonController3.selectItem(null);
  }

  void clearParentDetails() {
    // Father details
    fatherFirstNameController.clear();
    fatherLastNameController.clear();
    fatherAdharCardController.clear();
    fatherPanCardController.clear();
    qualificationController.clear();
    organizationNameController.clear();
    designationController.clear();
    pinCodeController.clear();
    fatherEmailController.clear();
    fatherMobileController.clear();
    fatherOccupation = null;
    fatherArea = null;
    selectedFatherCountryEntity = null;
    selectedFatherStateEntity = null;
    selectedFatherCityEntity = null;
    selectedFatherAreaSubject.add('');
    selectedFatherOccupationSubject.add('');
    selectedFatherCountrySubject.add('');
    selectedFatherStateSubject.add('');
    selectedFatherCitySubject.add('');

    // Mother details
    motherFirstNameController.clear();
    motherLastNameController.clear();
    motherAdharCardController.clear();
    motherPanCardController.clear();
    motherQualificationController.clear();
    motherOrganizationNameController.clear();
    motherDesignationController.clear();
    motherOfficeAddressController.clear();
    motherPinCodeController.clear();
    motherEmailController.clear();
    motherMobileController.clear();
    motherOccupation = null;
    motherArea = null;
    selectedMotherCountryEntity = null;
    selectedMotherStateEntity = null;
    selectedMotherCityEntity = null;
    selectedMotherAreaSubject.add('');
    selectedMotherOccupationSubject.add('');
    selectedMotherCountrySubject.add('');
    selectedMotherStateSubject.add('');
    selectedMotherCitySubject.add('');

    // Guardian details
    guardianFirstNameController.clear();
    guardianLastNameController.clear();
    guardianAdharCardController.clear();
    guardianPanCardController.clear();
    guardianPinCodeController.clear();
    guardianEmailController.clear();
    guardianMobileController.clear();
    selectedGuardianCountryEntity = null;
    selectedGuardianStateEntity = null;
    selectedGuardianCityEntity = null;
    selectedGuardianAreaSubject.add('');
    selectedGuardianOccupationSubject.add('');
    selectedGuardianCountrySubject.add('');
    selectedGuardianStateSubject.add('');
    selectedGuardianCitySubject.add('');

    // Other details
    radioButtonController.selectItem(null);
    radioButtonController1.selectItem(null);
    radioButtonController2.selectItem(null);
    radioButtonController10.selectItem(null);
    siblingFirstNameController.clear();
    siblingLastNameController.clear();
    siblingsEnrollmentController.clear();
    siblingsSchoolController.clear();
    siblingGender.value = "";
    siblingGrade.value = "";
  }

  void clearNewAdmissionDetails() {
    enquiryDateController.clear();
    enquiryNumberController.clear();
    enquiryTypeController.clear();
    studentFirstNameController.clear();
    studentLastNameController.clear();
    dobController.clear();
    existingSchoolNameController.clear();
    // fatherGlobalIdController.clear();
    // motherGlobalIdController.clear();
    parentTypeController.clear();
    studentsFatherFirstNameController.clear();
    studentsFatherLastNameController.clear();
    studentsFatherContactController.clear();
    studentsFatherEmailController.clear();
    studentsMotherFirstNameController.clear();
    studentsMotherLastNameController.clear();
    studentsMotherContactController.clear();
    studentsMotherEmailController.clear();
    religionController.clear();
    placeOfBirthController.clear();
    motherTongueController.clear();
    casteController.clear();
    subCasteController.clear();
    nationalityController.clear();

    selectedGradeSubject.add('');
    selectedSchoolLocationSubject.add('');
    selectedExistingSchoolGradeSubject.add('');
    selectedExistingSchoolBoardSubject.add('');
    selectedParentTypeSubject.add('');
    selectedGenderSubject.add('');

    selectedGradeEntity = null;
    selectedSchoolLocationEntity = null;
    selectedExistingSchoolGradeEntity = null;
    selectedExistingSchoolBoardEntity = null;
    selectedParentTypeEntity = null;
    selectedGenderEntity = null;
  }

  void clearPsaDetails() {
    clearNewAdmissionDetails(); // Clear common fields
    psaSubTypeSubject.add('');
    psaCategorySubject.add('');
    psaSubCategorySubject.add('');
    periodOfServiceSubject.add('');
    psaBatchSubject.add('');

    selectedPsaSubTypeEntity = null;
    selectedPsaCategoryEntity = null;
    selectedPsaSubCategoryEntity = null;
    selectedPeriodOfServiceEntity = null;
    selectedPsaBatchEntity = null;
  }

  void clearIvtDetails() {
    clearNewAdmissionDetails(); // Clear common fields
    ivtBoardSubject.add('');
    ivtCourseSubject.add('');
    ivtStreamSubject.add('');
    ivtShiftSubject.add('');

    selectedBoardEntity = null;
    selectedCourseEntity = null;
    selectedStreamEntity = null;
    selectedShiftEntity = null;
  }

  showPopUP(context, {String? message, VoidCallback? callback}) {
    Future.delayed(Duration.zero, () {
      CommonPopups().showSuccess(
          context, message ?? 'Student Registered Successfully', (shouldRoute) {
        Navigator.pop(context);
        callback?.call();
      });
    });
  }

  // VAS Selection
  CommonRadioButton<String> vasOne = CommonRadioButton(null);
  CommonRadioButton<String> vasTwo = CommonRadioButton(null);

  CommonRadioButton<String> vasThree = CommonRadioButton(null);

  CommonRadioButton<String> vasFour = CommonRadioButton(null);
  CommonRadioButton<String> vasFive = CommonRadioButton(null);

  final MoveToNextStageUsecase moveToNextStageUsecase;

  final BehaviorSubject<Resource<MoveToNextStageEnquiryResponse>>
      moveStageSubject = BehaviorSubject.seeded(Resource.none());

  Stream<Resource<MoveToNextStageEnquiryResponse>> get moveStageStream =>
      moveStageSubject.stream;
  void moveToNextStage({String from = "payment"}) {
    moveStageSubject.add(Resource.loading());
    MoveToNextStageUsecaseParams params = MoveToNextStageUsecaseParams(
      enquiryId: "${enquiryDetailArgs?.enquiryId}",
      currentStage: enquiryDetails?.currentStage,
    );
    exceptionHandlerBinder.handle(block: () {
      RequestManager(
        params,
        createCall: () => moveToNextStageUsecase.execute(params: params),
      ).asFlow().listen((data) {
        if (data.status == Status.error) {
          moveStageSubject.add(Resource.error(error: data.dealSafeAppError));
        }
        if (data.status == Status.success) {
          moveStageSubject.add(Resource.success(data: data.data));

          showPopUP(context);
        }
      });
    }).execute();
  }

  final BehaviorSubject<Resource<AdmissionVasDetailsResponse>>
      admissionVasDetailsResponse =
      BehaviorSubject<Resource<AdmissionVasDetailsResponse>>.seeded(
          Resource.none());
  void fetchVasAdmissionDetails() {
    admissionVasDetailsResponse.add(Resource.loading());
    GetAdmissionVasUsecaseParams params = GetAdmissionVasUsecaseParams(
        enquiryId: enquiryDetailArgs?.enquiryId ?? '');
    exceptionHandlerBinder.handle(block: () {
      RequestManager(
        params,
        createCall: () => getAdmissionVasUsecase.execute(params: params),
      ).asFlow().listen((data) {
        if (data.status == Status.success) {
          admissionVasDetailsResponse.add(Resource.success(data: data.data));
          final optTransport = data.data?.data?.optedForTransport;
          final optCafeteria = data.data?.data?.optedForCafeteria;
          final optKidsClub = data.data?.data?.optedForKidsClub;
          final optPsa = data.data?.data?.optedForPsa;
          final optSummerCamp = data.data?.data?.optedForSummerCamp;

          if (optTransport != null) {
            radioButtonTransport.selectItem(optTransport ? 'Yes' : 'No');
          }
          if (optCafeteria != null) {
            radioButtonCafeteria.selectItem(optCafeteria ? 'Yes' : 'No');
          }
          if (optKidsClub != null) {
            radioButtonKidsClub.selectItem(optKidsClub ? 'Yes' : 'No');
          }
          if (optPsa != null) {
            radioButtonPsa.selectItem(optPsa ? 'Yes' : 'No');
          }
          if (optSummerCamp != null) {
            radioButtonSummerCamp.selectItem(optSummerCamp ? 'Yes' : 'No');
          }
        } else if (data.status == Status.error) {
          admissionVasDetailsResponse
              .add(Resource.error(error: data.dealSafeAppError));
        }
      });
    }).execute();
  }

  // void setMenu() {
  //   if (enquiryDetailArgs?.enquiryType == EnquiryTypeEnum.psa.type) {
  //     final bookTestIndex =
  //         menuData.indexWhere((e) => e['name'].toLowerCase() == "book test");
  //     if (bookTestIndex != -1) {
  //       menuData[bookTestIndex]['isActive'] = false;
  //     }

  //   }
  // }
}
