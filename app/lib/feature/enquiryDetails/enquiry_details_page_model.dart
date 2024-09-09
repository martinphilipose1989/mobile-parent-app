import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/model/resource.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_popups.dart';
import 'package:app/utils/request_manager.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:network_retrofit/network_retrofit.dart';
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

  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
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
    this.enquiryDetails
  ){
    getEnquiryDetail(enquiryID: enquiryDetails.enquiryId ?? '');
    if (enquiryDetails.enquiryType == "IVT") {
      getIvtDetails(enquiryID: enquiryDetails.enquiryId ?? '');
    } else if (enquiryDetails.enquiryType == "PSA") {
      getPsaDetails(enquiryID: enquiryDetails.enquiryId ?? '');
    } else {
      getNewAdmissionDetails(
          enquiryID: enquiryDetails.enquiryId ?? '');
    }
  }
  late TabController tabController;
  bool visivilty = false;
  final formKey = GlobalKey<FormState>();
  BuildContext? context;

  final BehaviorSubject<int> selectedValue = BehaviorSubject<int>.seeded(0);
  BehaviorSubject<NewAdmissionDetail> ? newAdmissionDetails = BehaviorSubject<NewAdmissionDetail>.seeded(NewAdmissionDetail());
  BehaviorSubject<IVTDetail>? ivtDetails = BehaviorSubject<IVTDetail>.seeded(IVTDetail()); 
  BehaviorSubject<PSADetail>? psaDetails = BehaviorSubject<PSADetail>.seeded(PSADetail());
  final PublishSubject<Resource<NewAdmissionBase>> _newAdmissionDetail = PublishSubject();
  Stream<Resource<NewAdmissionBase>> get newAdmissionDetail => _newAdmissionDetail.stream;
  final PublishSubject<Resource<IVTBase>> _ivtDetail = PublishSubject(); 
  Stream<Resource<IVTBase>> get ivtDetail => _ivtDetail.stream;
  final PublishSubject<Resource<PsaResponse>> _psaDetail = PublishSubject();
  Stream<Resource<PsaResponse>> get psaDetail => _psaDetail.stream;
  BehaviorSubject<EnquiryDetail> enquiryDetail= BehaviorSubject.seeded(EnquiryDetail());
  final PublishSubject<Resource<EnquiryDetailBase>> _fetchEnquiryDetail = PublishSubject();
  Stream<Resource<EnquiryDetailBase>> get fetchEnquiryDetail => _fetchEnquiryDetail.stream;

  PublishSubject<Resource<EnquiryFileUploadBase>> uploadEnquiryFile = PublishSubject();
  PublishSubject<Resource<DeleteEnquiryFileBase>> deleteEnquiryFile = PublishSubject();
  PublishSubject<Resource<DownloadEnquiryFileBase>> getEnquiryFile = PublishSubject();
  PublishSubject<Resource<Uint8List>> downloadFile = PublishSubject();
  BehaviorSubject<int> showWidget = BehaviorSubject<int>.seeded(0);
  
  //New Admission Details
   TextEditingController enquiryNumberController = TextEditingController();
   TextEditingController enquiryTypeController = TextEditingController();
   TextEditingController studentFirstNameController = TextEditingController();
   TextEditingController studentLastNameController = TextEditingController();
   TextEditingController dobController = TextEditingController()  ;
   TextEditingController existingSchoolNameController = TextEditingController();
   TextEditingController globalIdController = TextEditingController();
   TextEditingController parentTypeController = TextEditingController();
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

  BehaviorSubject<bool> showMenuOnFloatingButton =
      BehaviorSubject<bool>.seeded(false);

  BehaviorSubject<bool> editRegistrationDetails =
      BehaviorSubject<bool>.seeded(false);

  final List menuData = [
    {'image': AppImages.registrationIcon, 'name': "Registration"},
    {'image': AppImages.call, 'name': "Call"},
    {'image': AppImages.email, 'name': "Email"},
    {'image': AppImages.editDetails, 'name': "Edit Details"},
    {'image': AppImages.schoolTour, 'name': "School Visit"},
    {'image': AppImages.timeline, 'name': "Timeline"},
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

  final BehaviorSubject<String> selectedGradeSubject = BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedSchoolLocationSubject = BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedExistingSchoolGradeSubject = BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedExistingSchoolBoardSubject = BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedParentTypeSubject = BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> selectedGenderSubject = BehaviorSubject<String>.seeded('');
  
  final BehaviorSubject<bool> selectedGenerType = BehaviorSubject<bool>.seeded(false);
  final BehaviorSubject<List<String>> schoolLocationTypes = BehaviorSubject<List<String>>.seeded([]);

  final List<String> parentType = ["Mother","Father","Guardian"];

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

  Future<void> getNewAdmissionDetails({required String enquiryID,bool isEdit = false}) async {
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
        _newAdmissionDetail.add(result);
        if(result.status == Status.success){
          print("Location: ${result.data?.data?.toString()}");
          newAdmissionDetails?.add(result.data?.data?? NewAdmissionDetail());
          if(isEdit){
            addNewAdmissionDetails(result.data?.data?? NewAdmissionDetail(),enquiryDetailArgs??EnquiryDetailArgs());
          }
        }
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
        createCall: () => getIvtDetailUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        _ivtDetail.add(result);
        if(result.status == Status.success){
          ivtDetails?.add(result.data?.data?? IVTDetail());
          if(isEdit){
            addIvtDetails(result.data?.data??IVTDetail(), enquiryDetailArgs??EnquiryDetailArgs());
          }
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
        createCall: () => getPsaDetailUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        _psaDetail.add(result);
        if(result.status == Status.success){
          psaDetails?.add(result.data?.data?? PSADetail());
          if(isEdit){
            addPsaDetails(result.data?.data??PSADetail(), enquiryDetailArgs??EnquiryDetailArgs());
          }
        }
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

      isLoading.value = true;
      
      RequestManager<PsaResponse>(
        params,
        createCall: () => updatePsaDetailUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        if(result.status == Status.success){
          psaDetails?.add(result.data?.data?? PSADetail());
          isLoading.value = false;
        }
        // activeStep.add()
      }).onError((error) {
        isLoading.value = false;
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
      isLoading.value = true;
      RequestManager<IVTBase>(
        params,
        createCall: () => updateIvtDetailUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        if(result.status == Status.success){
          ivtDetails?.add(result.data?.data??IVTDetail());
          isLoading.value = false;
        }
        // activeStep.add()
      }).onError((error) {
        isLoading.value = false;
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
        _newAdmissionDetail.add(result);
        if(result.status == Status.success){
          newAdmissionDetails?.add(result.data?.data?? NewAdmissionDetail());
          selectedValue.add(selectedValue.value+1);
          isLoading.value = false;
          getEnquiryDetail(enquiryID: enquiryID);
        }
        // activeStep.add()
      }).onError((error) {
        isLoading.value = false;
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
        if(result.status == Status.success){
          enquiryDetail.add(result.data?.data?? EnquiryDetail());
        }
        // activeStep.add()
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  EnquiryStage? getSchoolVisitStage() {
    return enquiryDetail.value.enquiryStage
        ?.firstWhere(
          (element) => element.stageName?.contains('School Visit') ?? false,
          orElse: () => EnquiryStage(),
        );
  }

  bool isDetailView(){
    final schoolVisitStage = getSchoolVisitStage();
    return schoolVisitStage?.status == "In Progress";
  }

  bool isDetailViewCompetency(){
    return enquiryDetail.value.enquiryStage?.firstWhere((element)=>element.stageName == "Competency test").status == "In Progress";
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
          
          isDocumentUploaded[index??0].value = true;
          isLoading.value = false;
          ScaffoldMessenger.of(context!).showSnackBar(
            const SnackBar(content: Text('File uploaded successfully')),
          );
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
          isDocumentUploaded[index??0].value = false;
          isLoading.value = false;
          ScaffoldMessenger.of(context!).showSnackBar(
            const SnackBar(content: Text('File deleted successfully')),
          );
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
      ).asFlow().listen((result) async{
        if(result.status == Status.success){
          await downloadDocument(fileUrl: result.data?.data?["url"]?? '');
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
            log('$fullPath/$fileName');
            log("File Downloaded");
            isLoading.value = false;
            ScaffoldMessenger.of(context!).showSnackBar(
              SnackBar(content: Text('File downloaded successfully at: ${file.path}')),
            );
          } catch (e) {
            log(e.toString());
            isLoading.value = false;
            ScaffoldMessenger.of(context!).showSnackBar(
              SnackBar(content: Text('Error: $e')),
            );
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
    studentFirstNameController.text = detail.studentDetails?.firstName ?? '';
    studentLastNameController.text = detail.studentDetails?.lastName ?? '';
    dobController.text = (detail.studentDetails?.dob ?? '').replaceAll('-', '/'); 
    existingSchoolNameController.text = detail.existingSchoolDetails?.name?? '';
    selectedGradeSubject.add(detail.studentDetails?.grade?.value?? '');
    selectedGradeEntity = detail.studentDetails?.grade;
    selectedSchoolLocationSubject.add(detail.schoolLocation?.value?? '');
    selectedSchoolLocationEntity = detail.schoolLocation;
    selectedExistingSchoolGradeSubject.add(detail.existingSchoolDetails?.grade?.value?? '');
    selectedExistingSchoolGradeEntity = detail.existingSchoolDetails?.grade;
    selectedExistingSchoolBoardSubject.add(detail.existingSchoolDetails?.board?.value?? '');
    selectedExistingSchoolBoardEntity = detail.existingSchoolDetails?.board;
    selectedParentTypeSubject.add("Father");
    selectedGenderSubject.add(detail.studentDetails?.gender?.value?? '');
    selectedGenderEntity = detail.studentDetails?.gender;
    parentTypeController.text = detail.enquirerParent??'';
    globalIdController.text = detail.enquirerParent == "Father"? detail.parentDetails?.fatherDetails?.globalId??'' : detail.parentDetails?.fatherDetails?.globalId??'';
  }

  addPsaDetails(PSADetail detail,EnquiryDetailArgs enquiryDetail){
    enquiryNumberController.text = enquiryDetail.enquiryNumber ?? '';
    enquiryTypeController.text = enquiryDetail.enquiryType ?? '';
    studentFirstNameController.text = detail.studentDetails?.firstName ?? '';
    studentLastNameController.text = detail.studentDetails?.lastName ?? '';
    dobController.text = (detail.studentDetails?.dob ?? '').replaceAll('-', '/'); 
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
    parentTypeController.text = detail.enquirerParent??'';
    globalIdController.text = detail.enquirerParent == "Father"? detail.parentDetails?.fatherDetails?.globalId??'' : detail.parentDetails?.fatherDetails?.globalId??'';
  }

  addIvtDetails(IVTDetail detail,EnquiryDetailArgs enquiryDetail){
    enquiryNumberController.text = enquiryDetail.enquiryNumber ?? '';
    enquiryTypeController.text = enquiryDetail.enquiryType ?? '';
    studentFirstNameController.text = detail.studentDetails?.firstName ?? '';
    studentLastNameController.text = detail.studentDetails?.lastName ?? '';
    dobController.text = (detail.studentDetails?.dob ?? '').replaceAll('-', '/'); 
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
    parentTypeController.text = detail.enquirerParent??'';
    globalIdController.text = detail.enquirerParent == "Father"? detail.parentDetails?.fatherDetails?.globalId??'' : detail.parentDetails?.fatherDetails?.globalId??'';
  }

  showPopUP(context){
    Future.delayed(Duration.zero, ()
    {
      CommonPopups().showSuccess(
          context,
          'Enquiry Created Successfully',
              (shouldRoute) {
            Navigator.pop(context);
          });
    });
  }
}
