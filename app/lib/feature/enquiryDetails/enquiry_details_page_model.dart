import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:app/errors/flutter_toast_error_presenter.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/feature/payments/payments_pages/payments.dart';
import 'package:app/model/resource.dart';
import 'package:app/myapp.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_popups.dart';
import 'package:app/utils/enums/enquiry_enum.dart';
import 'package:app/utils/permission_handler.dart';
import 'package:app/utils/request_manager.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class EnquiriesDetailsPageModel extends BasePageViewModel {
  GetNewAdmissionDetailUseCase getNewAdmissionDetailUseCase;
  GetIvtDetailUsecase getIvtDetailUsecase;
  GetPsaDetailUsecase getPsaDetailUsecase;
  GetEnquiryDetailUseCase getEnquiryDetailUseCase;
  UpdatePsaDetailUsecase updatePsaDetailUsecase;
  UpdateIvtDetailUsecase updateIvtDetailUsecase;
  UpdateNewAdmissionUsecase updateNewAdmissionUsecase;
  GetMdmAttributeUsecase getMdmAttributeUsecase;
  DownloadEnquiryDocumentUsecase downloadEnquiryDocumentUsecase;
  UploadEnquiryDocumentUsecase uploadEnquiryDocumentUsecase;
  DeleteEnquiryDocumentUsecase deleteEnquiryDocumentUsecase;
  DownloadFileUsecase downloadFileUsecase;
  EnquiryDetailArgs enquiryDetails;
  final ChooseFileUseCase chooseFileUseCase;
  final FlutterToastErrorPresenter flutterToastErrorPresenter;
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final GetBrandUsecase getBrandUsecase;

  EnquiriesDetailsPageModel(
      this.exceptionHandlerBinder,
      this.getNewAdmissionDetailUseCase,
      this.getIvtDetailUsecase,
      this.getPsaDetailUsecase,
      this.getEnquiryDetailUseCase,
      this.getMdmAttributeUsecase,
      this.uploadEnquiryDocumentUsecase,
      this.deleteEnquiryDocumentUsecase,
      this.downloadEnquiryDocumentUsecase,
      this.updatePsaDetailUsecase,
      this.updateIvtDetailUsecase,
      this.updateNewAdmissionUsecase,
      this.downloadFileUsecase,
      this.enquiryDetails,
      this.chooseFileUseCase,
      this.flutterToastErrorPresenter,
      this.moveToNextStageUsecase,
      this.getBrandUsecase) {
    getBrandList();
    getEnquiryDetail(enquiryID: enquiryDetails.enquiryId ?? '');
    if (enquiryDetails.enquiryType?.toLowerCase() ==
        EnquiryTypeEnum.kidsClub.type.toLowerCase()) {
      getIvtDetails(enquiryID: enquiryDetails.enquiryId ?? '');
    } else if (enquiryDetails.enquiryType == EnquiryTypeEnum.psa.type) {
      getPsaDetails(enquiryID: enquiryDetails.enquiryId ?? '');
    } else {
      getNewAdmissionDetails(enquiryID: enquiryDetails.enquiryId ?? '');
    }
  }
  late TabController tabController;
  bool visivilty = false;
  final formKey = GlobalKey<FormState>();
  BuildContext? context;

  final PermissionHandlerService permissionHandler = PermissionHandlerService();
  final BehaviorSubject<int> selectedValue = BehaviorSubject<int>.seeded(0);
  BehaviorSubject<NewAdmissionDetail>? newAdmissionDetails =
      BehaviorSubject<NewAdmissionDetail>.seeded(NewAdmissionDetail());
  BehaviorSubject<IVTDetail>? ivtDetails =
      BehaviorSubject<IVTDetail>.seeded(IVTDetail());
  BehaviorSubject<PSADetail>? psaDetails =
      BehaviorSubject<PSADetail>.seeded(PSADetail());
  final PublishSubject<Resource<NewAdmissionBase>> _newAdmissionDetail =
      PublishSubject();
  Stream<Resource<NewAdmissionBase>> get newAdmissionDetail =>
      _newAdmissionDetail.stream;
  final PublishSubject<Resource<IVTBase>> _ivtDetail = PublishSubject();
  Stream<Resource<IVTBase>> get ivtDetail => _ivtDetail.stream;
  final PublishSubject<Resource<PsaResponse>> _psaDetail = PublishSubject();
  Stream<Resource<PsaResponse>> get psaDetail => _psaDetail.stream;
  BehaviorSubject<EnquiryDetail> enquiryDetail =
      BehaviorSubject.seeded(EnquiryDetail());
  final PublishSubject<Resource<EnquiryDetailBase>> _fetchEnquiryDetail =
      PublishSubject();
  Stream<Resource<EnquiryDetailBase>> get fetchEnquiryDetail =>
      _fetchEnquiryDetail.stream;

  PublishSubject<Resource<EnquiryFileUploadBase>> uploadEnquiryFile =
      PublishSubject();
  PublishSubject<Resource<DeleteEnquiryFileBase>> deleteEnquiryFile =
      PublishSubject();
  PublishSubject<Resource<DownloadEnquiryFileBase>> getEnquiryFile =
      PublishSubject();
  PublishSubject<Resource<Uint8List>> downloadFile = PublishSubject();
  BehaviorSubject<int> showWidget = BehaviorSubject<int>.seeded(0);

  //New Admission Details
  TextEditingController enquiryNumberController = TextEditingController();
  TextEditingController enquiryTypeController = TextEditingController();
  TextEditingController schoolLocationController = TextEditingController();
  TextEditingController studentFirstNameController = TextEditingController();
  TextEditingController studentLastNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController existingSchoolNameController = TextEditingController();
  TextEditingController globalIdController = TextEditingController();
  TextEditingController parentTypeController = TextEditingController();
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

  BehaviorSubject<bool> showMenuOnFloatingButton =
      BehaviorSubject<bool>.seeded(false);

  BehaviorSubject<bool> editRegistrationDetails =
      BehaviorSubject<bool>.seeded(false);

  DateTime? studentDob;

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
      'image': AppImages.editDetails,
      'name': "Edit Details",
      'isActive': true
    },
    {
      'id': 4,
      'image': AppImages.schoolTour,
      'name': "School Tour",
      'isActive': true
    },
    {
      'id': 5,
      'image': AppImages.timeline,
      'name': "Timeline",
      'isActive': true
    },
    {
      'id': 6,
      'image': AppImages.payments,
      'name': "Payments",
      'isActive': true,
    },
  ];

  List<ValueNotifier<bool>> isDocumentUploaded = [];

  EnquiryDetailArgs? enquiryDetailArgs;

  BehaviorSubject<bool> isLoading = BehaviorSubject.seeded(false);

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

  final BehaviorSubject<bool> selectedGenerType =
      BehaviorSubject<bool>.seeded(false);
  final BehaviorSubject<List<String>> schoolLocationTypes =
      BehaviorSubject<List<String>>.seeded([]);

  final List<String> parentType = ["Mother", "Father"];
  TextEditingController fatherGlobalIdController = TextEditingController();
  TextEditingController motherGlobalIdController = TextEditingController();
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
  final BehaviorSubject<List<String>> occupation =
      BehaviorSubject<List<String>>.seeded([]);

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
  List<MdmAttributeModel>? occupationAttribute;

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
  CommonDataClass? selectedBrandEntity;

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
        _newAdmissionDetail.add(result);
        removeRegistrationMenu();
        if (result.status == Status.success) {
          newAdmissionDetails?.add(result.data?.data ?? NewAdmissionDetail());
          if (isEdit) {
            addNewAdmissionDetails(result.data?.data ?? NewAdmissionDetail(),
                enquiryDetailArgs ?? EnquiryDetailArgs());
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
        _ivtDetail.add(result);
        if (result.status == Status.success) {
          removeRegistrationMenu();
          ivtDetails?.add(result.data?.data ?? IVTDetail());
          if (isEdit) {
            addIvtDetails(result.data?.data ?? IVTDetail(),
                enquiryDetailArgs ?? EnquiryDetailArgs());
          }
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

  void removeRegistrationMenu() {
    // if (enquiryDetailArgs?.status?.toLowerCase() != "completed" &&
    //     enquiryDetailArgs?.currentStage?.toLowerCase() == "registration fees") {
    //   final index =
    //       menuData.indexWhere((e) => e['name'].toLowerCase() == "registration");
    //   menuData[index]['isActive'] = false;
    // }
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
        _psaDetail.add(result);
        if (result.status == Status.success) {
          removeRegistrationMenu();
          psaDetails?.add(result.data?.data ?? PSADetail());
          if (isEdit) {
            addPsaDetails(result.data?.data ?? PSADetail(),
                enquiryDetailArgs ?? EnquiryDetailArgs());
          }
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
          psaDetails?.add(result.data?.data ?? PSADetail());
          selectedValue.add(selectedValue.value + 1);
          isLoading.value = false;
          getPsaDetails(enquiryID: enquiryID);
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
          ivtDetails?.add(result.data?.data ?? IVTDetail());
          isLoading.value = false;
          selectedValue.add(selectedValue.value + 1);
          getIvtDetails(enquiryID: enquiryID);
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
        createCall: () => updateNewAdmissionUsecase.execute(params: params),
      ).asFlow().listen((result) {
        _newAdmissionDetail.add(result);
        if (result.status == Status.success) {
          newAdmissionDetails?.add(result.data?.data ?? NewAdmissionDetail());
          selectedValue.add(selectedValue.value + 1);
          isLoading.value = false;
          getEnquiryDetail(enquiryID: enquiryID);
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
        removeRegistrationMenu();
        _fetchEnquiryDetail.add(result);
        if (result.status == Status.success) {
          if (enquiryDetailArgs?.enquiryType != EnquiryTypeEnum.psa.type ||
              enquiryDetailArgs?.enquiryType?.toLowerCase() !=
                  EnquiryTypeEnum.kidsClub.type.toLowerCase()) {
            bool isRegistrationFeesCompleted = result.data?.data?.enquiryStage
                    ?.any((stage) =>
                        stage.stageName == "Registration Fees" &&
                        stage.status == "Completed") ??
                false;
            // Update the isActive status for "Registration" in menuData
            for (var item in menuData) {
              if (item['name'] == "Registration") {
                item['isActive'] = isRegistrationFeesCompleted ? true : false;
              }
            }
          } else if (enquiryDetailArgs?.enquiryType ==
                  EnquiryTypeEnum.psa.type ||
              enquiryDetailArgs?.enquiryType?.toLowerCase() ==
                  EnquiryTypeEnum.kidsClub.type.toLowerCase()) {
            for (var item in menuData) {
              if (item['name'] == "Registration" ||
                  item['name'] == "Payments") {
                item['isActive'] = false;
              }
            }
          }

          enquiryDetail.add(result.data?.data ?? EnquiryDetail());
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

  EnquiryStage? getSchoolVisitStage() {
    return enquiryDetail.value.enquiryStage?.firstWhere(
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
    return enquiryDetail.value.enquiryStage
            ?.firstWhere((element) => element.stageName == "Competency test")
            .status !=
        "In Progress";
  }

  Future<void> getMdmAttribute({required String infoType}) async {
    exceptionHandlerBinder.handle(block: () {
      GetMdmAttributeUsecaseParams params = GetMdmAttributeUsecaseParams(
        infoType: infoType,
      );
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
          isDocumentUploaded[index ?? 0].value = true;
          isLoading.value = false;
          ScaffoldMessenger.of(context!).showSnackBar(
            const SnackBar(content: Text('File uploaded successfully')),
          );
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
          isDocumentUploaded[index ?? 0].value = false;
          isLoading.value = false;
          ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
            const SnackBar(content: Text('File deleted successfully')),
          );
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
      ).asFlow().listen((result) async {
        if (result.status == Status.success) {
          await downloadDocument(fileUrl: result.data?.data?["url"] ?? '');
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
                      Text('File downloaded successfully at: ${file.path}')),
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
    studentFirstNameController.text = detail.studentDetails?.firstName ?? '';
    studentLastNameController.text = detail.studentDetails?.lastName ?? '';
    if (!(detail.studentDetails?.dob ?? '')
        .toLowerCase()
        .contains("invalid date")) {
      studentDob = (detail.studentDetails?.dob ?? '').isNotEmpty
          ? DateTime.parse(
              (detail.studentDetails?.dob ?? '').split('-').reversed.join('-'))
          : DateTime.now();
    }
    existingSchoolNameController.text =
        detail.existingSchoolDetails?.name ?? '';
    selectedGradeSubject.add(detail.studentDetails?.grade?.value ?? '');
    selectedBrandSubject.add(enquiryDetail.brandName ?? '');
    selectedGradeEntity = detail.studentDetails?.grade;
    selectedSchoolLocationSubject.add(detail.schoolLocation?.value ?? '');
    if (schoolLocationTypesAttribute != null) {
      selectedSchoolLocationSubjectAttribute.add(schoolLocationTypesAttribute
          ?.firstWhere((element) => element.id == detail.schoolLocation?.id));
    } else {
      selectedSchoolLocationSubjectAttribute.add(MdmAttributeModel(
          id: detail.schoolLocation?.id,
          attributes:
              AttributesDetailsModel(name: detail.schoolLocation?.value)));
    }
    schoolLocationController.text = detail.schoolLocation?.value ?? '';
    selectedSchoolLocationEntity = detail.schoolLocation;
    selectedExistingSchoolGradeSubject
        .add(detail.existingSchoolDetails?.grade?.value ?? '');
    selectedExistingSchoolGradeEntity = detail.existingSchoolDetails?.grade;
    selectedExistingSchoolBoardSubject
        .add(detail.existingSchoolDetails?.board?.value ?? '');
    selectedExistingSchoolBoardEntity = detail.existingSchoolDetails?.board;
    selectedParentTypeSubject.add(detail.enquirerParent ?? '');
    selectedGenderSubject.add(detail.studentDetails?.gender?.value ?? '');
    selectedGenderEntity = detail.studentDetails?.gender;
    parentTypeController.text = detail.enquirerParent ?? '';
    fatherGlobalIdController.text =
        detail.parentDetails?.fatherDetails?.globalId ?? '';
    motherGlobalIdController.text =
        detail.parentDetails?.motherDetails?.globalId ?? '';
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
    studentFirstNameController.text = detail.studentDetails?.firstName ?? '';
    studentLastNameController.text = detail.studentDetails?.lastName ?? '';
    if (!(detail.studentDetails?.dob ?? '')
        .toLowerCase()
        .contains("invalid date")) {
      studentDob = (detail.studentDetails?.dob ?? '').isNotEmpty
          ? DateTime.parse(
              (detail.studentDetails?.dob ?? '').split('-').reversed.join('-'))
          : DateTime.now();
    }
    existingSchoolNameController.text =
        detail.existingSchoolDetails?.name ?? '';
    selectedGradeSubject.add(detail.studentDetails?.grade?.value ?? '');
    selectedGradeEntity = detail.studentDetails?.grade;
    selectedSchoolLocationSubject.add(detail.schoolLocation?.value ?? '');
    if (schoolLocationTypesAttribute != null) {
      selectedSchoolLocationSubjectAttribute.add(schoolLocationTypesAttribute
          ?.firstWhere((element) => element.id == detail.schoolLocation?.id));
    } else {
      selectedSchoolLocationSubjectAttribute.add(MdmAttributeModel(
          id: detail.schoolLocation?.id,
          attributes:
              AttributesDetailsModel(name: detail.schoolLocation?.value)));
    }
    schoolLocationController.text = detail.schoolLocation?.value ?? '';
    selectedSchoolLocationEntity = detail.schoolLocation;
    selectedExistingSchoolGradeSubject
        .add(detail.existingSchoolDetails?.grade?.value ?? '');
    selectedExistingSchoolGradeEntity = detail.existingSchoolDetails?.grade;
    selectedExistingSchoolBoardSubject
        .add(detail.existingSchoolDetails?.board?.value ?? '');
    selectedExistingSchoolBoardEntity = detail.existingSchoolDetails?.board;
    selectedParentTypeSubject.add(detail.enquirerParent ?? '');
    selectedGenderSubject.add(detail.studentDetails?.gender?.value ?? '');
    selectedGenderEntity = detail.studentDetails?.gender;
    parentTypeController.text = detail.enquirerParent ?? '';
    fatherGlobalIdController.text =
        detail.parentDetails?.fatherDetails?.globalId ?? '';
    motherGlobalIdController.text =
        detail.parentDetails?.motherDetails?.globalId ?? '';
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
    // PSA SUB TYPE AND CATEGORY
    psaSubTypeSubject.add(detail.psaSubType?.value ?? '');
    selectedPsaSubTypeEntity = detail.psaSubType;
    selectedPsaCategoryEntity = detail.psaCategory;
    psaCategorySubject.add(detail.psaCategory?.value ?? '');
    selectedPsaSubCategoryEntity = detail.psaSubCategory;
    psaSubCategorySubject.add(detail.psaSubCategory?.value ?? '');
    selectedPeriodOfServiceEntity = detail.psaPeriodOfService;
    periodOfServiceSubject.add(detail.psaPeriodOfService?.value ?? '');
    selectedPsaBatchEntity = detail.psaBatch;
    psaBatchSubject.add(detail.psaBatch?.value ?? '');
  }

  addIvtDetails(IVTDetail detail, EnquiryDetailArgs enquiryDetail) {
    enquiryNumberController.text = enquiryDetail.enquiryNumber ?? '';
    enquiryTypeController.text = enquiryDetail.enquiryType ?? '';
    studentFirstNameController.text = detail.studentDetails?.firstName ?? '';
    studentLastNameController.text = detail.studentDetails?.lastName ?? '';

    if (!(detail.studentDetails?.dob ?? '')
        .toLowerCase()
        .contains("invalid date")) {
      studentDob = (detail.studentDetails?.dob ?? '').isNotEmpty
          ? DateTime.parse((detail.studentDetails?.dob ?? ''))
          : DateTime.now();
    }
    schoolLocationController.text = detail.schoolLocation?.value ?? '';
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
    parentTypeController.text = detail.enquirerParent ?? '';
    fatherGlobalIdController.text =
        detail.parentDetails?.fatherDetails?.globalId ?? '';
    motherGlobalIdController.text =
        detail.parentDetails?.motherDetails?.globalId ?? '';
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
    selectedBoardEntity = detail.board;
    selectedCourseEntity = detail.course;
    selectedStreamEntity = detail.stream;
    selectedShiftEntity = detail.shift;
  }

  showPopUP(context) {
    Future.delayed(Duration.zero, () {
      CommonPopups().showSuccess(context, 'Enquiry edited Successfully',
          (shouldRoute) {
        Navigator.pop(context);
        if (enquiryDetailArgs?.enquiryType == EnquiryTypeEnum.psa.type ||
            enquiryDetailArgs?.enquiryType?.toLowerCase() ==
                EnquiryTypeEnum.kidsClub.type.toLowerCase()) {
          navigatorKey.currentState?.pushNamed(RoutePaths.trackerAdmissions);
        }
      });
    });
  }

  final MoveToNextStageUsecase moveToNextStageUsecase;
  final BehaviorSubject<Resource<MoveToNextStageEnquiryResponse>>
      moveStageSubject = BehaviorSubject.seeded(Resource.none());

  Stream<Resource<MoveToNextStageEnquiryResponse>> get moveStageStream =>
      moveStageSubject.stream;

  void moveToNextStage({String from = "payment"}) {
    isLoading.add(true);
    MoveToNextStageUsecaseParams params = MoveToNextStageUsecaseParams(
        enquiryId: "${enquiryDetailArgs?.enquiryId}");
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
          if (from != "payment") {
            showPopUP(context);
          } else {
            navigatorKey.currentState
                ?.pushNamed(
              RoutePaths.payments,
              arguments: PaymentArguments(
                phoneNo: '',
                module: Modules.enquiry,
                enquiryId: enquiryDetailArgs?.enquiryId,
                enquiryNo: enquiryDetailArgs?.enquiryNumber,
                studentName: "${enquiryDetails.studentName} ",
              ),
            )
                .then((val) {
              getEnquiryDetail(enquiryID: enquiryDetailArgs?.enquiryId ?? '');
            });
          }
        }
      });
    }).execute();
  }

  final BehaviorSubject<Resource<List<BrandData>>> brandListResponse =
      BehaviorSubject<Resource<List<BrandData>>>.seeded(Resource.none());

  final BehaviorSubject<String> selectedBrandSubject = BehaviorSubject();

  void getBrandList() {
    final GetBrandUsecaseParams params = GetBrandUsecaseParams();
    exceptionHandlerBinder.handle(
      block: () {
        RequestManager(params,
                createCall: () => getBrandUsecase.execute(params: params))
            .asFlow()
            .listen((result) {
          if (result.status == Status.success) {
            final brandList = result.data?.data;
            brandListResponse.add(Resource.success(data: brandList!));
          }
        }).onError((error) {
          brandListResponse.add(Resource.error(error: error));
        });
      },
    ).execute();
  }
}
