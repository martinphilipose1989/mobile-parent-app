import 'dart:io';

import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/model/resource.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/request_manager.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:network_retrofit/network_retrofit.dart';
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
  );
  late TabController tabController;
  bool visivilty = false;
  final BehaviorSubject<int> selectedValue = BehaviorSubject<int>.seeded(0);
  BehaviorSubject<NewAdmissionDetail> ? newAdmissionDetails = BehaviorSubject<NewAdmissionDetail>.seeded(NewAdmissionDetail());
  BehaviorSubject<IVTDetail>? ivtDetails = BehaviorSubject<IVTDetail>.seeded(IVTDetail()); 
  BehaviorSubject<PSADetail>? psaDetails = BehaviorSubject<PSADetail>.seeded(PSADetail());
  PublishSubject<Resource<EnquiryDetail>> enquiryDetail= PublishSubject();
  PublishSubject<Resource<EnquiryFileUploadBase>> uploadEnquiryFile = PublishSubject();
  PublishSubject<Resource<DeleteEnquiryFileBase>> deleteEnquiryFile = PublishSubject();
  PublishSubject<Resource<DownloadEnquiryFileBase>> getEnquiryFile = PublishSubject();
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
   BehaviorSubject<String> psaSubTypeSubject = BehaviorSubject<String>.seeded('');
   BehaviorSubject<String> psaCategorySubject = BehaviorSubject<String>.seeded('');
   BehaviorSubject<String> psaSubCategorySubject = BehaviorSubject<String>.seeded('');
   BehaviorSubject<String> periodOfServiceSubject = BehaviorSubject<String>.seeded('');
   BehaviorSubject<String> psaBatchSubject = BehaviorSubject<String>.seeded('');
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

  Future<void> getIvtDetails({required String enquiryID,bool isEdit = false}) async {
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

  Future<void> getPsaDetails({required String enquiryID,bool isEdit = false}) async {
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

  Future<void> updatePsaDetails({required String enquiryID,required PsaDetailResponseEntity psaDetail}) async{
    exceptionHandlerBinder.handle(block: () {
     
      UpdatePsaDetailUsecaseParams params = UpdatePsaDetailUsecaseParams(
        enquiryID: "66ba1b522c07e8497dde3061",
        psaDetail: psaDetail
      );
      
      RequestManager<PsaResponse>(
        params,
        createCall: () => updatePsaDetailUsecase.execute(
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

  Future<void> updateIvtDetails({required String enquiryID,required IvtDetailResponseEntity ivtDetail}) async{
    exceptionHandlerBinder.handle(block: () {
     
      UpdateIvtDetailUsecaseParams params = UpdateIvtDetailUsecaseParams(
        enquiryID: "66ba1b522c07e8497dde3061",
        ivtDetail: ivtDetail
      );
      
      RequestManager<IVTBase>(
        params,
        createCall: () => updateIvtDetailUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        ivtDetails?.add(result.data?.data??IVTDetail());
        // activeStep.add()
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  Future<void> updateNewAdmissionDetails({required String enquiryID,required NewAdmissionDetailEntity newAdmissionDetail}) async{
    exceptionHandlerBinder.handle(block: () {
     
      UpdateNewAdmissionUsecaseUseCaseParams params = UpdateNewAdmissionUsecaseUseCaseParams(
        enquiryID: "66ba1b522c07e8497dde3061",
        newAdmissionDetail: newAdmissionDetail
      );
      
      RequestManager<NewAdmissionBase>(
        params,
        createCall: () => updateNewAdmissionUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        newAdmissionDetails?.add(result.data?.data?? NewAdmissionDetail());
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
          gradeTypes.add(result.data?.data?.map((e) => e.attributes?.name?? '').toList()??[]);
        }
        if(infoType == "schoolLocation"){
          schoolLocationTypes.add(result.data?.data?.map((e) => e.attributes?.name?? '').toList()??[]);
        }
        if(infoType == "gender"){
          gender.add(result.data?.data?.map((e) => e.attributes?.name?? '').toList()??[]);
        }
        if(infoType == "board"){
          existingSchoolBoard.add(result.data?.data?.map((e) => e.attributes?.name?? '').toList()??[]);
        }
        if(infoType == "psaCategory"){
          psaCategory.add(result.data?.data?.map((e) => e.attributes?.name?? '').toList()??[]);
        }
        if(infoType == "psaSubCategory"){
          psaSubCategory.add(result.data?.data?.map((e) => e.attributes?.name?? '').toList()??[]);
        }
        if(infoType == "psaSubType"){
          psaSubType.add(result.data?.data?.map((e) => e.attributes?.name?? '').toList()??[]);
        }
        if(infoType == "periodOfService"){
          periodOfService.add(result.data?.data?.map((e) => e.attributes?.name?? '').toList()??[]);
        }
        if(infoType == "batch"){
          psaBatch.add(result.data?.data?.map((e) => e.attributes?.name?? '').toList()??[]);
        }
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  Future<void> uploadEnquiryDocument({required String enquiryID,required String documentID,required File file}) async{
    exceptionHandlerBinder.handle(block: () {
      
      UploadEnquiryDocumentUsecaseParams params = UploadEnquiryDocumentUsecaseParams(
        documentID: documentID,
        enquiryID: enquiryID,
        file: file
      );
      uploadEnquiryFile.add(Resource.loading());
      RequestManager<EnquiryFileUploadBase>(
        params,
        createCall: () => uploadEnquiryDocumentUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        uploadEnquiryFile.add(Resource.success(data: result.data?? EnquiryFileUploadBase()));
        // activeStep.add()
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  Future<void> deleteEnquiryDocument({required String enquiryID,required String documentID}) async{
    exceptionHandlerBinder.handle(block: () {
      
      DeleteEnquiryDocumentUsecaseParams params = DeleteEnquiryDocumentUsecaseParams(
        documentID: documentID,
        enquiryID: enquiryID,
      );
      deleteEnquiryFile.add(Resource.loading());
      RequestManager<DeleteEnquiryFileBase>(
        params,
        createCall: () => deleteEnquiryDocumentUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        deleteEnquiryFile.add(Resource.success(data: result.data?? DeleteEnquiryFileBase()));
        // activeStep.add()
      }).onError((error) {
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
      getEnquiryFile.add(Resource.loading());
      RequestManager<DownloadEnquiryFileBase>(
        params,
        createCall: () => downloadEnquiryDocumentUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        getEnquiryFile.add(Resource.success(data: result.data?? DownloadEnquiryFileBase()));
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
    psaSubTypeSubject.add(detail.psaSubType?.value?? '');
    psaCategorySubject.add(detail.psaCategory?.value?? '');
    psaSubCategorySubject.add(detail.psaSubCategory?.value?? '');
    periodOfServiceSubject.add(detail.psaPeriodOfService?.value?? '');
    psaBatchSubject.add(detail.psaBatch?.value?? '');
  }

  addIvtDetails(IVTDetail detail){
    ivtBoardController.text = detail.board?.value?? '';
    ivtCourseController.text = detail.course?.value?? '';
    ivtStreamController.text = detail.stream?.value?? '';
    ivtShiftController.text = detail.shift?.value?? '';
  }
}
