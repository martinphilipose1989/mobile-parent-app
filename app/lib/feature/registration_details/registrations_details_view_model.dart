import 'package:app/dependencies.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_radio_button.dart/common_radio_button.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:rxdart/subjects.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../model/resource.dart';
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

  RegistrationsDetailsViewModel(this.exceptionHandlerBinder,
      this.getRegistrationDetailUsecase, this.getNewAdmissionDetailUseCase,
      this.getIvtDetailUsecase, this.getPsaDetailUsecase,
      this.getEnquiryDetailUseCase, this.updateParentDetailsUsecase, this.updateMedicalDetailsUsecase,this.updateBankDetailsUsecase, this.updateContactDetailsUsecase) ;

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

  BehaviorSubject<int> showWidget = BehaviorSubject<int>.seeded(0);
  final BehaviorSubject<bool> isLoading = BehaviorSubject<bool>.seeded(true);
  final PublishSubject<Resource<ParentInfo>> parentDetail =
  PublishSubject();
  final PublishSubject<Resource<ContactDetails>> contactDetail =
  PublishSubject();
  final PublishSubject<Resource<MedicalDetails>> medicalDetail =
  PublishSubject();
  final PublishSubject<Resource<BankDetails>> bankDetail = PublishSubject();

  PublishSubject<
      Resource<NewAdmissionDetail>> newAdmissionDetails = PublishSubject();
  PublishSubject<Resource<IVTDetail>> ivtDetails = PublishSubject();
  PublishSubject<Resource<PSADetail>> psaDetails = PublishSubject();
  PublishSubject<Resource<EnquiryDetail>> enquiryDetail = PublishSubject();

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
  TextEditingController occupationController = TextEditingController();
  TextEditingController organizationNameController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController officeAddressController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController fatherEmailController = TextEditingController();
  TextEditingController fatherMobileController = TextEditingController();

//motherEditController
  TextEditingController motherFirstNameController = TextEditingController();
  TextEditingController motherLastNameController = TextEditingController();
  TextEditingController motherAdharCardController = TextEditingController();
  TextEditingController motherPanCardController = TextEditingController();
  TextEditingController motherQualificationController = TextEditingController();
  TextEditingController motherOccupationController = TextEditingController();
  TextEditingController motherOrganizationNameController = TextEditingController();
  TextEditingController motherDesignationController = TextEditingController();
  TextEditingController motherOfficeAddressController = TextEditingController();
  TextEditingController motherPinCodeController = TextEditingController();
  TextEditingController motherEmailController = TextEditingController();
  TextEditingController motherMobileController = TextEditingController();

//guardianEditDetails
  TextEditingController guardianFirstNameController = TextEditingController();
  TextEditingController guardianLastNameController = TextEditingController();
  TextEditingController guardianAdharCardController = TextEditingController();
  TextEditingController guardianPanCardController = TextEditingController();
  TextEditingController guardianQualificationController = TextEditingController();
  TextEditingController guardianOccupationController = TextEditingController();
  TextEditingController guardianOrganizationNameController = TextEditingController();
  TextEditingController guardianDesignationController = TextEditingController();
  TextEditingController guardianOfficeAddressController = TextEditingController();
  TextEditingController guardianPinCodeController = TextEditingController();
  TextEditingController guardianEmailController = TextEditingController();
  TextEditingController guardianMobileController = TextEditingController();

//siblingsEditDetails
  TextEditingController siblingFirstNameController = TextEditingController();
  TextEditingController siblingLastNameController = TextEditingController();
  TextEditingController siblingsEnrollmentController = TextEditingController();
  TextEditingController siblingsSchoolController = TextEditingController();

  //ResidentialDetails
  TextEditingController houseOrBuildingController= TextEditingController();
  TextEditingController streetNameController= TextEditingController();
  TextEditingController landMarkController=TextEditingController();

  //YearOfHospitalization
  TextEditingController yearOfHospitalizationController=TextEditingController();
  TextEditingController reasonOfHospitalizationController=TextEditingController();
  TextEditingController specificDisabilityController=TextEditingController();

  //BankDetails
  TextEditingController ifscCodeController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController branchNameController= TextEditingController();
  TextEditingController accountHolderNameController = TextEditingController();
  TextEditingController accountTypeController =TextEditingController();
  TextEditingController accountNumberController = TextEditingController();

  Future<void> fetchAllDetails(String infoType) async {
    exceptionHandlerBinder.handle(block: () {
      GetRegistrationDetailUsecaseParams params =
      GetRegistrationDetailUsecaseParams(
          enquiryID: '66ba1b522c07e8497dde3061', infoType: infoType);

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
          print(result.data?.message);
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
      RequestManager<ParentInfo>(
          params,
          createCall: () => updateParentDetailsUsecase.execute(params: params)

      ).asFlow().listen((result) {
        parentDetail.add(Resource.success(data: result.data));
       parentInfo = result.data;

        addParentDetails( result.data??ParentInfo());
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
      RequestManager<MedicalDetails>(
          params,
          createCall: () =>
              updateMedicalDetailsUsecase.execute(params: params)
      ).asFlow().listen((result) {
        medicalDetail.add(Resource.success(data: result.data));
        medicalDetails = result.data;
        addMedicalDetails( result.data??MedicalDetails());
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
      RequestManager<ContactDetails>(
          params,
          createCall: () =>
              updateContactDetailsUsecase.execute(params: params)
      ).asFlow().listen((result) {
        contactDetail.add(Resource.success(data: result.data));
        contactDetails = result.data;
        addContactDetails( result.data??ContactDetails());
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
      RequestManager<BankDetails>(
          params,
          createCall: () =>
              updateBankDetailsUsecase.execute(params: params)
      ).asFlow().listen((result) {
        bankDetail.add(Resource.success(data: result.data));
        bankDetails = result.data;
        addBankDetails( result.data??BankDetails());
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
        isLoading.value = false;
      });
    }).execute();
  }

  Future<void> getNewAdmissionDetails({required String enquiryID}) async {
    exceptionHandlerBinder.handle(block: () {
      GetNewAdmissionDetailUseCaseParams params = GetNewAdmissionDetailUseCaseParams(
        enquiryID: "66ba1b522c07e8497dde3061",
      );

      RequestManager<NewAdmissionBase>(
        params,
        createCall: () =>
            getNewAdmissionDetailUseCase.execute(
              params: params,
            ),
      ).asFlow().listen((result) {
        newAdmissionDetails.add(
            Resource.success(data: result.data?.data ?? NewAdmissionDetail()));
        // activeStep.add()
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
        createCall: () =>
            getIvtDetailUsecase.execute(
              params: params,
            ),
      ).asFlow().listen((result) {
        ivtDetails.add(
            Resource.success(data: result.data?.data ?? IVTDetail()));
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
        createCall: () =>
            getPsaDetailUsecase.execute(
              params: params,
            ),
      ).asFlow().listen((result) {
        psaDetails.add(
            Resource.success(data: result.data?.data ?? PSADetail()));
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
        createCall: () =>
            getEnquiryDetailUseCase.execute(
              params: params,
            ),
      ).asFlow().listen((result) {
        enquiryDetail.add(
            Resource.success(data: result.data?.data ?? EnquiryDetail()));
        // activeStep.add()
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }


  BehaviorSubject<bool> showMenuOnFloatingButton =
  BehaviorSubject<bool>.seeded(false);

  BehaviorSubject<bool> editRegistrationDetails =
  BehaviorSubject<bool>.seeded(false);

  final CommonRadioButton<String> radioButtonController =
  CommonRadioButton<String>(null);

  final CommonRadioButton<String> radioButtonController1 =
  CommonRadioButton<String>(null);

  final CommonRadioButton<String> radioButtonController2 =
  CommonRadioButton<String>(null);

  final CommonRadioButton<String> radioButtonController3 =
  CommonRadioButton<String>(null);

  final CommonRadioButton<String> radioButtonController4 =
  CommonRadioButton<String>(null);

  final CommonRadioButton<String> radioButtonController5 =
  CommonRadioButton<String>(null);

  final CommonRadioButton<String> radioButtonController6 =
  CommonRadioButton<String>(null);


  addParentDetails(ParentInfo parentDetails) {

    fatherFirstNameController.text = parentDetails.fatherDetails?.firstName??"";
    fatherLastNameController.text=parentDetails.fatherDetails?.lastName??"";
    fatherAdharCardController.text=parentDetails.fatherDetails?.aadharNumber??"";
    fatherPanCardController.text=parentDetails.fatherDetails?.panNumber??"";
    qualificationController.text=parentDetails.fatherDetails?.qualification??"";
    occupationController.text = parentDetails.fatherDetails?.occupation??"";
    organizationNameController.text = parentDetails.fatherDetails?.organisationName??"";
    designationController.text=parentDetails.fatherDetails?.designationName??"";
    pinCodeController.text=parentDetails.fatherDetails?.pinCode??"";
    fatherEmailController.text=parentDetails.fatherDetails?.emailId??"";
    fatherMobileController.text=parentDetails.fatherDetails?.mobileNumber??"";

     motherFirstNameController.text =parentDetails.motherDetails?.firstName??"";
     motherLastNameController.text = parentDetails.motherDetails?.lastName??"";
     motherAdharCardController.text = parentDetails.motherDetails?.aadharNumber??"";
     motherPanCardController.text=parentDetails.motherDetails?.panNumber??"";
     motherQualificationController.text=parentDetails.motherDetails?.qualification??"";
     motherOccupationController.text=parentDetails.motherDetails?.occupation??"";
     motherOrganizationNameController.text=parentDetails.motherDetails?.organisationName??"";
     motherDesignationController.text =parentDetails.motherDetails?.designationName??"";
     motherOfficeAddressController.text=parentDetails.motherDetails?.officeAddress??"";
     motherPinCodeController.text=parentDetails.motherDetails?.pinCode??"";
     motherEmailController.text=parentDetails.motherDetails?.emailId??"";
     motherMobileController.text=parentDetails.motherDetails?.mobileNumber??"";

    guardianFirstNameController.text =parentDetails.guardianDetails?.firstName??"";
    guardianLastNameController.text = parentDetails.guardianDetails?.lastName??"";
    guardianAdharCardController.text = parentDetails.guardianDetails?.aadharNumber??"";
    guardianPanCardController.text=parentDetails.guardianDetails?.panNumber??"";
    guardianQualificationController.text=parentDetails.guardianDetails?.qualification??"";
    guardianOccupationController.text=parentDetails.guardianDetails?.occupation??"";
    guardianOrganizationNameController.text=parentDetails.guardianDetails?.organisationName??"";
    guardianDesignationController.text =parentDetails.guardianDetails?.designationName??"";
    guardianOfficeAddressController.text=parentDetails.guardianDetails?.officeAddress??"";
    guardianPinCodeController.text=parentDetails.guardianDetails?.pincode??"";
    guardianEmailController.text=parentDetails.guardianDetails?.emailId??"";
    guardianMobileController.text=parentDetails.guardianDetails?.mobileNumber??"";
  }

  addContactDetails(ContactDetails contactDetails) {
    houseOrBuildingController.text= contactDetails.residentialAddress?.house??"";
    streetNameController.text= contactDetails.residentialAddress?.street??"";
    landMarkController.text= contactDetails.residentialAddress?.landmark??"";
  }

  addMedicalDetails(MedicalDetails medicalDetails){
    yearOfHospitalizationController.text=medicalDetails.yearOfHospitalization??"";
    reasonOfHospitalizationController.text=medicalDetails.reasonOfHopitalization??"";
    specificDisabilityController.text=medicalDetails.physicalDisabilityDescription??"";
  }

  addBankDetails(BankDetails bankDetails){
     ifscCodeController.text = bankDetails.ifscCode??"";
     bankNameController.text = bankDetails.bankName??"";
     branchNameController.text=bankDetails.branchName??"";
     accountHolderNameController.text =bankDetails.accountHolderName??"";
     accountTypeController.text=bankDetails.accountType??"";
     accountNumberController.text = bankDetails.accountNumber??"";

  }
  Future<void> saveParentDetails(String enquiryId)async {
    ParentInfoEntity parentInfoEntity=ParentInfoEntity();
    fatherFirstNameController.text = parentInfoEntity.fatherDetails?.firstName??"";
    fatherLastNameController.text=parentInfoEntity.fatherDetails?.lastName??"";
    fatherAdharCardController.text=parentInfoEntity.fatherDetails?.aadharNumber??"";
    fatherPanCardController.text=parentInfoEntity.fatherDetails?.panNumber??"";
    qualificationController.text=parentInfoEntity.fatherDetails?.qualification??"";
    occupationController.text = parentInfoEntity.fatherDetails?.occupation??"";
    organizationNameController.text = parentInfoEntity.fatherDetails?.organisationName??"";
    designationController.text=parentInfoEntity.fatherDetails?.designationName??"";
    pinCodeController.text=parentInfoEntity.fatherDetails?.pinCode??"";
    fatherEmailController.text=parentInfoEntity.fatherDetails?.emailId??"";
    fatherMobileController.text=parentInfoEntity.fatherDetails?.mobileNumber??"";

    motherFirstNameController.text =parentInfoEntity.motherDetails?.firstName??"";
    motherLastNameController.text = parentInfoEntity.motherDetails?.lastName??"";
    motherAdharCardController.text = parentInfoEntity.motherDetails?.aadharNumber??"";
    motherPanCardController.text=parentInfoEntity.motherDetails?.panNumber??"";
    motherQualificationController.text=parentInfoEntity.motherDetails?.qualification??"";
    motherOccupationController.text=parentInfoEntity.motherDetails?.occupation??"";
    motherOrganizationNameController.text=parentInfoEntity.motherDetails?.organisationName??"";
    motherDesignationController.text =parentInfoEntity.motherDetails?.designationName??"";
    motherOfficeAddressController.text=parentInfoEntity.motherDetails?.officeAddress??"";
    motherPinCodeController.text=parentInfoEntity.motherDetails?.pinCode??"";
    motherEmailController.text=parentInfoEntity.motherDetails?.emailId??"";
    motherMobileController.text=parentInfoEntity.motherDetails?.mobileNumber??"";

    guardianFirstNameController.text =parentInfoEntity.guardianDetails?.firstName??"";
    guardianLastNameController.text = parentInfoEntity.guardianDetails?.lastName??"";
    guardianAdharCardController.text = parentInfoEntity.guardianDetails?.aadharNumber??"";
    guardianPanCardController.text=parentInfoEntity.guardianDetails?.panNumber??"";
    guardianQualificationController.text=parentInfoEntity.guardianDetails?.qualification??"";
    guardianOccupationController.text=parentInfoEntity.guardianDetails?.occupation??"";
    guardianOrganizationNameController.text=parentInfoEntity.guardianDetails?.organizationName??"";
    guardianDesignationController.text =parentInfoEntity.guardianDetails?.designation??"";
    guardianOfficeAddressController.text=parentInfoEntity.guardianDetails?.officeAddress??"";
    guardianPinCodeController.text=parentInfoEntity.guardianDetails?.pincode??"";
    guardianEmailController.text=parentInfoEntity.guardianDetails?.emailId??"";
    guardianMobileController.text=parentInfoEntity.guardianDetails?.mobileNumber??"";
     await updateParentDetail(enquiryId, parentInfoEntity);
  }
  Future<void>saveMedicalDetails(String enquiryId) async{
    MedicalDetailsEntity medicalDetails = MedicalDetailsEntity();
    yearOfHospitalizationController.text=medicalDetails.yearOfHospitalization??"";
    reasonOfHospitalizationController.text=medicalDetails.reasonOfHopitalization??"";
    specificDisabilityController.text=medicalDetails.physicalDisabilityDescription??"";
  await updateMedicalDetail(enquiryId,medicalDetails);
  }
  Future<void>saveBankDetails(String enquiryId)async{
    BankDetailsEntity bankDetails = BankDetailsEntity();
    ifscCodeController.text = bankDetails.ifscCode??"";
    bankNameController.text = bankDetails.bankName??"";
    branchNameController.text=bankDetails.branchName??"";
    accountHolderNameController.text =bankDetails.accountHolderName??"";
    accountTypeController.text=bankDetails.accountType??"";
    accountNumberController.text = bankDetails.accountNumber??"";
    await updateBankDetail(enquiryId,bankDetails);
  }
  Future<void>saveContactDetails(String enquiryId)async{
    ContactDetailsEntity contactDetails =ContactDetailsEntity();
    houseOrBuildingController.text= contactDetails.residentialAddress?.house??"";
    streetNameController.text= contactDetails.residentialAddress?.street??"";
    landMarkController.text= contactDetails.residentialAddress?.landmark??"";
  await updateContactDetail(enquiryId,contactDetails);
  }
}