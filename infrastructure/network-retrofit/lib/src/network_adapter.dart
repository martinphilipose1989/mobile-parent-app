import 'dart:io';
import 'dart:typed_data';

import 'package:data/data.dart';
import 'package:network_retrofit/src/model/request/finance/get_academic_year_request.dart';
import 'package:network_retrofit/src/model/request/finance/get_guardian_student_details_request.dart';
import 'package:network_retrofit/src/model/request/finance/get_pending_fees_request.dart';
import 'package:network_retrofit/src/model/request/finance/get_school_name_request.dart';
import 'package:network_retrofit/src/model/request/finance/get_siblings_request.dart';
import 'package:network_retrofit/src/model/request/finance/get_token_generator_request.dart';
import 'package:network_retrofit/src/model/request/finance/get_validate_pay_now_request.dart';
import 'package:network_retrofit/src/model/request/finance/store_payment/fee_id_request.dart';
import 'package:network_retrofit/src/model/request/finance/store_payment/get_store_payment_request.dart';
import 'package:network_retrofit/src/model/request/finance/store_payment/payment_details_request.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:network_retrofit/src/util/safe_api_call.dart';

import 'services/retrofit_service.dart';

class NetworkAdapter implements NetworkPort {
  final RetrofitService apiService;

  NetworkAdapter(this.apiService);

  @override
  Future<Either<NetworkError, GetsibglingListModel>> getSiblingsList(
      {required int studentId, required List<int> lobIDs}) async {
    var response = await safeApiCall(apiService.getSiblingsList(
        GetSiblingsRequest(lobIDs: lobIDs, studentId: studentId)));
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) => Right(r.data.transform()),
    );
  }

  @override
  Future<Either<NetworkError, GetAcademicYearModel>> getAcademicYear(
      {required String type, required List<int> students}) async {
    var response = await safeApiCall(apiService.getAcademicYear(
        GetAcademicYearRequest(students: students, type: type)));
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) => Right(r.data.transform()),
    );
  }

  @override
  Future<Either<NetworkError, GetTokenGeneratorModel>> getTokenGenerator(
      {required int segmentLobId}) async {
    var response = await safeApiCall(apiService.getTokenGenerator(
        GetTokenGeneratorRequest(segmentLobId: segmentLobId)));
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) => Right(r.data.transform()),
    );
  }

  @override
  Future<Either<NetworkError, GetValidateOnPayModel>> getValidatePayNow(
      {required int paymentMode, required List<int> studentFeeIds}) async {
    var response = await safeApiCall(apiService.getValidatePayNow(
        GetValidatePayNowRequest(
            paymentMode: paymentMode, studentFeeIds: studentFeeIds)));
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) => Right(r.data.transform()),
    );
  }

  @override
  Future<Either<NetworkError, GetStorePaymentModel>> getStorePayment(
      {required StorePaymentModelRequest storePaymentModelRequest}) async {
    var response = await safeApiCall(apiService.getStorePayment(
        GetStorePaymentRequest(
            chequeInFavour: storePaymentModelRequest.chequeInFavour,
            lobID: storePaymentModelRequest.lobId,
            paymentAmount: storePaymentModelRequest.paymentAmount,
            paymentMode: storePaymentModelRequest.paymentMode,
            isManualEntry: storePaymentModelRequest.isManualEntry,
            manualReceiptImage: storePaymentModelRequest.manualReceiptImage,
            manualReceiptNo: storePaymentModelRequest.manualReceiptNo,
            feeIds: storePaymentModelRequest.feeIds
                .map((e) => FeeId(
                    studentFeeId: e.studentFeeId,
                    collected: e.collected,
                    feeOrder: e.feeOrder))
                .toList(),
            paymentDetails: storePaymentModelRequest.paymentDetails
                .map((e) => PaymentDetail(
                    amount: e.amount,
                    chequeDate: e.chequeDate,
                    chequeImage: e.chequeImage,
                    chequeNo: e.chequeNo,
                    bankName: e.bankName,
                    issuerIfsc: e.issuerIfsc,
                    issuerName: e.issuerName,
                    paymentModeId: e.paymentModeId,
                    tokenNo: e.tokenNo))
                .toList())));
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) => Right(r.data.transform()),
    );
  }

  @override
  Future<Either<NetworkError, GetGuardianStudentDetailsModel>>
      getGuardianStudentDetails({required int mobileNo}) async {
    var response = await safeApiCall(apiService.getGuardianStudentDetails(
        GetGuardianStudentDetailsRequest(mobileNo: mobileNo)));
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) => Right(r.data.transform()),
    );
  }

  @override
  Future<Either<NetworkError, GetPendingFeesModel>> getPendingFees(
      {required String type,
      required List<int> students,
      required List<int> academicYear,
      required int applicableTo}) async {
    var response = await safeApiCall(apiService.getPendingFees(
        GetPendingFeesRequest(
            type: type,
            students: students,
            academicYear: academicYear,
            applicableTo: applicableTo)));
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) => Right(r.data.transform()),
    );
  }

  @override
  Future<Either<NetworkError, SchoolNamesModel>> getSchoolNames(
      {required List<int> studentIds,
      required List<int> academicYearIds}) async {
    var response = await safeApiCall(apiService.getSchoolNames(
        SchoolNamesRequest(
            academicYearIds: academicYearIds, studentIds: studentIds)));
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) => Right(r.data.transform()),
    );
  }

  @override
  Future<Either<NetworkError, EnquiryListModel>> getEnquiryList({required String phone, required int pageNumber, int pageSize = 10}) async {
    var response = await safeApiCall(apiService.getEnquiryList(
         phone:  phone,pageNumber: pageNumber,pageSize: pageSize));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, AdmissionJourneyBase>> getAdmissionJourney({required String enquiryID,required String type}) async {
    var response = await safeApiCall(apiService.getAdmissionJourney(enquiryID: enquiryID,type: type));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, NewAdmissionBase>> getNewAdmissionDetail({required String enquiryID}) async {
    var response = await safeApiCall(apiService.getNewAdmissionDetail(enquiryID: enquiryID));
    return response.fold((l) {
      return Left(l);
    }, (r){
      var data = r.data.data?.schoolLocation?.value??'';
      var transformData = r.data.transform();
      print("School Location: $data");
      print("Transformed School Location: ${transformData.data?.schoolLocation?.value}");
      return Right(r.data.transform());
    });
  }

  @override
  Future<Either<NetworkError, NewAdmissionBase>> updateNewAdmissionDetail({required String enquiryID, required NewAdmissionDetailEntity newAdmissionDetail}) async{
    var response = await safeApiCall(apiService.updateNewAdmissionDetail(enquiryID: enquiryID, newAdmissionDetail: newAdmissionDetail));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, PsaResponse>> getPsaDetail({required String enquiryID}) async {
    var response = await safeApiCall(apiService.getPsaDetail(enquiryID: enquiryID));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, PsaResponse>> updatePsaDetail({required String enquiryID, required PsaDetailResponseEntity psaDetail}) async{
    var response = await safeApiCall(apiService.updatePsaDetail(enquiryID: enquiryID,psaDetail: psaDetail));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, IVTBase>> getIvtDetail({required String enquiryID}) async {
    var response = await safeApiCall(apiService.getIvtDetail(enquiryID: enquiryID));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, IVTBase>> updateIvtDetail({required String enquiryID, required IvtDetailResponseEntity ivtDetails}) async{
    var response = await safeApiCall(apiService.updateIvtDetail(enquiryID: enquiryID,ivtDetail: ivtDetails));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, Slots>> getSchoolVisitSlots({required String enquiryID, required String date}) async{
    var response = await safeApiCall(apiService.getSchoolVisitSlots(date: date, enquiryId: enquiryID));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, SchoolVisitDetailBase>> getSchoolVisitDetail({required String enquiryID}) async{
    var response = await safeApiCall(apiService.getSchoolVisitDetail(enquiryID: enquiryID));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, SchoolVisitDetailBase>> createSchoolVisit({required String enquiryID,required SchoolCreationRequest schoolCreationRequest}) async {
    var response = await safeApiCall(apiService.createSchoolVisit(enquiryID: enquiryID, schoolCreationRequest: schoolCreationRequest));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, SchoolVisitDetailBase>> rescheduleSchoolVisit({required String enquiryID,required RescheduleSchoolVisitRequest schoolCreationRequest}) async {
    var response = await safeApiCall(apiService.rescheduleSchoolVisit(schoolVisitID: enquiryID, schoolCreationRequest: schoolCreationRequest));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

    @override
  Future<Either<NetworkError, SchoolVisitDetailBase>> cancelSchoolVisit({required String enquiryID, required SchoolVisitCancelRequest cancelSchoolRequest}) async {
    var response = await safeApiCall(apiService.cancelSchoolVisit(enquiryID: enquiryID, schoolVisitCancelRequest: cancelSchoolRequest));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, Slots>> getCompetencyTestSlots({required String enquiryID, required date}) async{
    var response = await safeApiCall(apiService.getCompetencyTestSlots(date: date, enquiryId: enquiryID));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, AdmissionListBaseModel>> getAdmissionList({required String phone, required int pageNumber, int pageSize = 10}) async {
    var response = await safeApiCall(apiService.getAdmissionList(phone: phone, pageNumber: pageNumber, pageSize: pageSize));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, CompetencyTestDetailBase>> getCompetencyTestDetail({required String enquiryID}) async{
    var response = await safeApiCall(apiService.getCompetencyTestDetail(enquiryID: enquiryID));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError,CompetencyTestDetailBase>> createCompetencyTest({required String enquiryID,required CompetencyTestCreationRequest competencyTestCreationRequest}) async {
    var response = await safeApiCall(apiService.createCompetencyTest(enquiryID: enquiryID, competencyTestCreationRequest: competencyTestCreationRequest));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError,CompetencyTestDetailBase>> rescheduleCompetencyTest({required String enquiryID,required CompetencyTestRescheduleRequest competencyTestCreationRequest}) async {
    var response = await safeApiCall(apiService.rescheduleCompetencyTest(enquiryID: enquiryID, competencyTestCreationRequest: competencyTestCreationRequest));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, CompetencyTestDetailBase>> cancelCompetencyTest({required String enquiryID, required CancelCompetencyTestRequest cancelCompetencyTestRequest}) async {
    var response = await safeApiCall(apiService.cancelCompetencyTest(enquiryID: enquiryID, cancelCompetencyTestRequest: cancelCompetencyTestRequest));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, EnquiryDetailBase>> getEnquiryDetail({required String enquiryID}) async{
    var response = await safeApiCall(apiService.getEnquiryDetail(enquiryID: enquiryID));
    return response.fold((l){
      return Left(l);
    }, (r)=> Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, EnquiryTimeLineBase>> getEnquiryTimeline({required String enquiryID}) async{
    var response = await safeApiCall(apiService.getEnquiryTimeline(enquiryID: enquiryID));
    return response.fold((l){
      return Left(l);
    }, (r)=> Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, DownloadEnquiryFileBase>> downloadEnquiryDocument({required String enquiryID, required String documentID}) async{
    var response = await safeApiCall(apiService.downloadEnquiryDocument(enquiryID: enquiryID,documentID: documentID));
    return response.fold((l){
      return Left(l);
    }, (r)=> Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, Uint8List>> downloadFile({required String fileUrl}) async{
    var response = await safeApiCall(apiService.downloadFile(fileUrl: fileUrl));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(Uint8List.fromList(r.data)));
  }

  @override
  Future<Either<NetworkError, DeleteEnquiryFileBase>> deleteEnquiryDocument({required String enquiryID, required String documentID}) async {
    var response = await safeApiCall(apiService.deleteEnquiryDocument(enquiryID: enquiryID,documentID: documentID));
    return response.fold((l){
      return Left(l);
    }, (r)=> Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, EnquiryFileUploadBase>> uploadEnquiryDocument({required String enquiryID, required String documentID,required File file}) async{
    var response = await safeApiCall(apiService.uploadEnquiryDocument(file: file,documentID: documentID,enquiryID: enquiryID));
    return response.fold((l){
      return Left(l);
    }, (r)=> Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, SingleResponse>> getRegistrationDetail({required String enquiryID, required String infoType}) async {
    var response = await safeApiCall(apiService.
    getRegistrationDetail(enquiryId: enquiryID, infoType: infoType));
    return response.fold((l) {
      return Left(l);
    }, (r) {
      Map<String, dynamic> jsonData = r.data.data;
      if(infoType == "ParentInfo"){
        ParentInfoEntity parentInfo = ParentInfoEntity.fromJson(jsonData);
        return Right(SingleResponse<ParentInfo>(status: r.data.status ?? 0,message: r.data.message ?? "",data: parentInfo.transform()));
      }
      else if(infoType == "ContactInfo"){
        ContactDetailsEntity contactDetails = ContactDetailsEntity.fromJson(jsonData);
        return Right(SingleResponse<ContactDetails>(status: r.data.status ?? 0,message: r.data.message ?? "",data: contactDetails.transform()));
      }
      else if(infoType == "MedicalInfo"){
        MedicalDetailsEntity medicalDetails = MedicalDetailsEntity.fromJson(jsonData);
        return Right(SingleResponse<MedicalDetails>(status: r.data.status ?? 0,message: r.data.message ?? "",data: medicalDetails.transform()));
      }
      else{
        BankDetailsEntity bankDetails = BankDetailsEntity.fromJson(jsonData);
        return Right(SingleResponse<BankDetails>(status: r.data.status ?? 0,message: r.data.message ?? "",data: bankDetails.transform()));
      }
    });
  }

  @override
  Future<Either<NetworkError, SingleResponse>> updateParentDetails({required String enquiryID, required ParentInfoEntity parentInfo}) async{
    var response = await safeApiCall(apiService.updateParentDetails(enquiryId: enquiryID,parentInfo: parentInfo));
    return response.fold((l) {
      return Left(l);
  }, (r) {
      Map<String, dynamic> jsonData = r.data.data;
      ParentInfoEntity parentInfo = ParentInfoEntity.fromJson(jsonData);
      return Right(SingleResponse<ParentInfo>(status: r.data.status ?? 0,message: r.data.message ?? "",data: parentInfo.transform()));
    });
  }

  @override
  Future<Either<NetworkError, SingleResponse>> updateBankDetails({required String enquiryID, required BankDetailsEntity bankDetails}) async{
    var response = await safeApiCall(apiService.updateBankDetails(enquiryId: enquiryID,bankDetails: bankDetails));
    return response.fold((l) {
      return Left(l);
    }, (r) {
      Map<String, dynamic> jsonData = r.data.data;
      BankDetailsEntity bankDetails = BankDetailsEntity.fromJson(jsonData);
    return Right(SingleResponse<BankDetails>(status: r.data.status ?? 0,message: r.data.message ?? "",data: bankDetails.transform()));});
  }

  @override
  Future<Either<NetworkError, SingleResponse>> updateContactDetails({required String enquiryID, required ContactDetailsEntity contactDetails}) async{
    var response = await safeApiCall(apiService.updateContactDetails(enquiryId: enquiryID,contactDetails: contactDetails));
    return response.fold((l) {
      return Left(l);
    }, (r) {
      Map<String, dynamic> jsonData = r.data.data;
      ContactDetailsEntity contactDetails = ContactDetailsEntity.fromJson(jsonData);
    return Right(SingleResponse<ContactDetails>(status: r.data.status ?? 0,message: r.data.message ?? "",data: contactDetails.transform()));});
  }

  @override
  Future<Either<NetworkError, SingleResponse>> updateMedicalDetails({required String enquiryID, required MedicalDetailsEntity medicalDetails}) async{
    var response = await safeApiCall(apiService.updateMedicalDetails(enquiryId: enquiryID,medicalDetails: medicalDetails));
    return response.fold((l) {
      return Left(l);
    }, (r) {
      Map<String, dynamic> jsonData = r.data.data;
      MedicalDetailsEntity medicalDetails = MedicalDetailsEntity.fromJson(jsonData);
    return Right(SingleResponse<MedicalDetails>(status: r.data.status ?? 0,message: r.data.message ?? "",data: medicalDetails.transform()));});
  }

  @override
  Future<Either<NetworkError, MdmAttributeBaseModel>> getMdmAttribute({required String infoType}) async{
    
    switch (infoType) {
      case "schoolLocation":
        var response = await safeApiCall(apiService.getSchoolLocation(token: "Bearer daab45fc5eeed66cf456080a8300a68ca564b924891e154f5f36c80438873b6e70932225dac1bdf9e9e60e82bba5edbf4130ddcf9722ed148d5952a5bb059a514375393817e57c43d97a85dfca549a53a61e080f3eb57d18bf4555bee35b71d19e591649c45b2c2d93018930d9cab082a9a85bb888ab0aed2ccb9f1119e53933"));        
        return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
        
      case "country":
         var response = await safeApiCall(apiService.getCountries(token: "Bearer daab45fc5eeed66cf456080a8300a68ca564b924891e154f5f36c80438873b6e70932225dac1bdf9e9e60e82bba5edbf4130ddcf9722ed148d5952a5bb059a514375393817e57c43d97a85dfca549a53a61e080f3eb57d18bf4555bee35b71d19e591649c45b2c2d93018930d9cab082a9a85bb888ab0aed2ccb9f1119e53933"));       
         return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
        
      case "state":
        var response = await safeApiCall(apiService.getStates(token: "Bearer daab45fc5eeed66cf456080a8300a68ca564b924891e154f5f36c80438873b6e70932225dac1bdf9e9e60e82bba5edbf4130ddcf9722ed148d5952a5bb059a514375393817e57c43d97a85dfca549a53a61e080f3eb57d18bf4555bee35b71d19e591649c45b2c2d93018930d9cab082a9a85bb888ab0aed2ccb9f1119e53933"));        
        return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
      case "city":
        var response = await safeApiCall(apiService.getCities(token: "Bearer daab45fc5eeed66cf456080a8300a68ca564b924891e154f5f36c80438873b6e70932225dac1bdf9e9e60e82bba5edbf4130ddcf9722ed148d5952a5bb059a514375393817e57c43d97a85dfca549a53a61e080f3eb57d18bf4555bee35b71d19e591649c45b2c2d93018930d9cab082a9a85bb888ab0aed2ccb9f1119e53933"));        
        return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
      case "grade":
        var response = await safeApiCall(apiService.getGrades(token: "Bearer daab45fc5eeed66cf456080a8300a68ca564b924891e154f5f36c80438873b6e70932225dac1bdf9e9e60e82bba5edbf4130ddcf9722ed148d5952a5bb059a514375393817e57c43d97a85dfca549a53a61e080f3eb57d18bf4555bee35b71d19e591649c45b2c2d93018930d9cab082a9a85bb888ab0aed2ccb9f1119e53933"));        
        return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
      case "gender":
        var response = await safeApiCall(apiService.getGender(token: "Bearer daab45fc5eeed66cf456080a8300a68ca564b924891e154f5f36c80438873b6e70932225dac1bdf9e9e60e82bba5edbf4130ddcf9722ed148d5952a5bb059a514375393817e57c43d97a85dfca549a53a61e080f3eb57d18bf4555bee35b71d19e591649c45b2c2d93018930d9cab082a9a85bb888ab0aed2ccb9f1119e53933"));        
        return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
      case "stream":
        var response = await safeApiCall(apiService.getStreams(token: "Bearer daab45fc5eeed66cf456080a8300a68ca564b924891e154f5f36c80438873b6e70932225dac1bdf9e9e60e82bba5edbf4130ddcf9722ed148d5952a5bb059a514375393817e57c43d97a85dfca549a53a61e080f3eb57d18bf4555bee35b71d19e591649c45b2c2d93018930d9cab082a9a85bb888ab0aed2ccb9f1119e53933"));        
        return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
      case "shift":
        var response = await safeApiCall(apiService.getShifts(token: "Bearer daab45fc5eeed66cf456080a8300a68ca564b924891e154f5f36c80438873b6e70932225dac1bdf9e9e60e82bba5edbf4130ddcf9722ed148d5952a5bb059a514375393817e57c43d97a85dfca549a53a61e080f3eb57d18bf4555bee35b71d19e591649c45b2c2d93018930d9cab082a9a85bb888ab0aed2ccb9f1119e53933"));        
        return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
      case "board":
        var response = await safeApiCall(apiService.getSchoolBoard(token: "Bearer daab45fc5eeed66cf456080a8300a68ca564b924891e154f5f36c80438873b6e70932225dac1bdf9e9e60e82bba5edbf4130ddcf9722ed148d5952a5bb059a514375393817e57c43d97a85dfca549a53a61e080f3eb57d18bf4555bee35b71d19e591649c45b2c2d93018930d9cab082a9a85bb888ab0aed2ccb9f1119e53933"));        
        return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
      case "batch":
        var response = await safeApiCall(apiService.getBatch(token: "Bearer daab45fc5eeed66cf456080a8300a68ca564b924891e154f5f36c80438873b6e70932225dac1bdf9e9e60e82bba5edbf4130ddcf9722ed148d5952a5bb059a514375393817e57c43d97a85dfca549a53a61e080f3eb57d18bf4555bee35b71d19e591649c45b2c2d93018930d9cab082a9a85bb888ab0aed2ccb9f1119e53933"));        
        return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
      case "course":
        var response = await safeApiCall(apiService.getCourses(token: "Bearer daab45fc5eeed66cf456080a8300a68ca564b924891e154f5f36c80438873b6e70932225dac1bdf9e9e60e82bba5edbf4130ddcf9722ed148d5952a5bb059a514375393817e57c43d97a85dfca549a53a61e080f3eb57d18bf4555bee35b71d19e591649c45b2c2d93018930d9cab082a9a85bb888ab0aed2ccb9f1119e53933"));        
        return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
      case "psaSubType":
      var response = await safeApiCall(apiService.getPsaSubType(token: "Bearer daab45fc5eeed66cf456080a8300a68ca564b924891e154f5f36c80438873b6e70932225dac1bdf9e9e60e82bba5edbf4130ddcf9722ed148d5952a5bb059a514375393817e57c43d97a85dfca549a53a61e080f3eb57d18bf4555bee35b71d19e591649c45b2c2d93018930d9cab082a9a85bb888ab0aed2ccb9f1119e53933"));        
        return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
      case "psaCategory":
      var response = await safeApiCall(apiService.getPsaCategory(token: "Bearer daab45fc5eeed66cf456080a8300a68ca564b924891e154f5f36c80438873b6e70932225dac1bdf9e9e60e82bba5edbf4130ddcf9722ed148d5952a5bb059a514375393817e57c43d97a85dfca549a53a61e080f3eb57d18bf4555bee35b71d19e591649c45b2c2d93018930d9cab082a9a85bb888ab0aed2ccb9f1119e53933"));        
        return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
    case "psaSubCategory":
    var response = await safeApiCall(apiService.getPsaSubCategory(token: "Bearer daab45fc5eeed66cf456080a8300a68ca564b924891e154f5f36c80438873b6e70932225dac1bdf9e9e60e82bba5edbf4130ddcf9722ed148d5952a5bb059a514375393817e57c43d97a85dfca549a53a61e080f3eb57d18bf4555bee35b71d19e591649c45b2c2d93018930d9cab082a9a85bb888ab0aed2ccb9f1119e53933"));        
        return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
    case "periodOfService":
    var response = await safeApiCall(apiService.getPeriodOfService(token: "Bearer daab45fc5eeed66cf456080a8300a68ca564b924891e154f5f36c80438873b6e70932225dac1bdf9e9e60e82bba5edbf4130ddcf9722ed148d5952a5bb059a514375393817e57c43d97a85dfca549a53a61e080f3eb57d18bf4555bee35b71d19e591649c45b2c2d93018930d9cab082a9a85bb888ab0aed2ccb9f1119e53933"));        
        return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
    case "academicYear":
    var response = await safeApiCall(apiService.getAcademicYearAttribute(token: "Bearer daab45fc5eeed66cf456080a8300a68ca564b924891e154f5f36c80438873b6e70932225dac1bdf9e9e60e82bba5edbf4130ddcf9722ed148d5952a5bb059a514375393817e57c43d97a85dfca549a53a61e080f3eb57d18bf4555bee35b71d19e591649c45b2c2d93018930d9cab082a9a85bb888ab0aed2ccb9f1119e53933"));        
        return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
    case "bloodGroup":
    var response = await safeApiCall(apiService.getBloodGroupAttribute(token: "Bearer daab45fc5eeed66cf456080a8300a68ca564b924891e154f5f36c80438873b6e70932225dac1bdf9e9e60e82bba5edbf4130ddcf9722ed148d5952a5bb059a514375393817e57c43d97a85dfca549a53a61e080f3eb57d18bf4555bee35b71d19e591649c45b2c2d93018930d9cab082a9a85bb888ab0aed2ccb9f1119e53933"));        
        return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
      default:
        var response = await safeApiCall(apiService.getCancellationReason(token: "Bearer daab45fc5eeed66cf456080a8300a68ca564b924891e154f5f36c80438873b6e70932225dac1bdf9e9e60e82bba5edbf4130ddcf9722ed148d5952a5bb059a514375393817e57c43d97a85dfca549a53a61e080f3eb57d18bf4555bee35b71d19e591649c45b2c2d93018930d9cab082a9a85bb888ab0aed2ccb9f1119e53933"));        
        return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
    }
  }
}
