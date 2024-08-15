import 'package:app/dependencies.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_radio_button.dart/common_radio_button.dart';
import 'package:domain/domain.dart';
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
  final GetIvtDetailUsecase getIvtDetailUsecase;
  final GetPsaDetailUsecase getPsaDetailUsecase;

  RegistrationsDetailsViewModel(this.exceptionHandlerBinder,
      this.getRegistrationDetailUsecase,this.getNewAdmissionDetailUseCase,this.getIvtDetailUsecase,this.getPsaDetailUsecase) {
  }

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

  PublishSubject<Resource<NewAdmissionDetail>> newAdmissionDetails = PublishSubject();
  PublishSubject<Resource<IVTDetail>> ivtDetails = PublishSubject(); 
  PublishSubject<Resource<PSADetail>> psaDetails = PublishSubject();

  ParentInfo? parentInfo;
  ContactDetails? contactDetails;
  MedicalDetails? medicalDetails;
  BankDetails? bankDetails;

  Future<void> fetchAllDetails(String infoType) async {
    exceptionHandlerBinder.handle(block: () {
      GetRegistrationDetailUsecaseParams params =
      GetRegistrationDetailUsecaseParams(
          enquiryID: '6685346f0386eb1f0298cd51', infoType: infoType);

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
        } else if (infoType == 'ContactInfo'){
          contactDetail.add(Resource.success(data: result.data?.data));
          contactDetails = result.data?.data;
        } else if (infoType == 'MedicalInfo') {
          medicalDetail.add(Resource.success(data: result.data?.data));
          medicalDetails = result.data?.data;
        } else {
          bankDetail.add(Resource.success(data: result.data?.data));
          bankDetails = result.data?.data;
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
      RequestManager<ParentInfo>(
          params,
          createCall: () =>
              getIt.get<UpdateParentDetailsUsecase>().execute(params: params)
      ).asFlow().listen((result) {

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
              getIt.get<UpdateMedicalDetailsUsecase>().execute(params: params)
      ).asFlow().listen((result) {

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
              getIt.get<UpdateContactDetailsUsecase>().execute(params: params)
      ).asFlow().listen((result) {

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
              getIt.get<UpdateBankDetailsUsecase>().execute(params: params)
      ).asFlow().listen((result) {

      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
        isLoading.value = false;
      });
    }).execute();
  }

  Future<void> getNewAdmissionDetails({required String enquiryID}) async {
    exceptionHandlerBinder.handle(block: () {
     
      GetNewAdmissionDetailUseCaseParams params = GetNewAdmissionDetailUseCaseParams(
        enquiryID: enquiryID,
      );
      
      RequestManager<NewAdmissionBase>(
        params,
        createCall: () => getNewAdmissionDetailUseCase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        newAdmissionDetails.add(Resource.success(data: result.data?.data??NewAdmissionDetail()));
        // activeStep.add()
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  Future<void> getIvtDetails({required String enquiryID}) async {
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
        ivtDetails.add(Resource.success(data: result.data?.data?? IVTDetail()));
        // activeStep.add()
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  Future<void> getPsaDetails({required String enquiryID}) async {
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
        psaDetails.add(Resource.success(data: result.data?.data?? PSADetail()));
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


}
