import 'dart:io';

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
    }, (r) => Right(r.data.transform()));
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
  Future<Either<NetworkError, SchoolVisitDetailBase>> rescheduleSchoolVisit({required String schoolVisitID,required SchoolCreationRequest schoolCreationRequest}) async {
    var response = await safeApiCall(apiService.rescheduleSchoolVisit(schoolVisitID: schoolVisitID, schoolCreationRequest: schoolCreationRequest));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

    @override
  Future<Either<NetworkError, SchoolVisitDetailBase>> cancelSchoolVisit({required String schoolVisitID, required SchoolVisitCancelRequest cancelSchoolRequest}) async {
    var response = await safeApiCall(apiService.cancelSchoolVisit(schoolVisitID: schoolVisitID, schoolVisitCancelRequest: cancelSchoolRequest));
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
  Future<Either<NetworkError,CompetencyTestDetailBase>> rescheduleCompetencyTest({required String competencyTest,required CompetencyTestCreationRequest competencyTestCreationRequest}) async {
    var response = await safeApiCall(apiService.rescheduleCompetencyTest(competencyTest: competencyTest, competencyTestCreationRequest: competencyTestCreationRequest));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, CompetencyTestDetailBase>> cancelCompetencyTest({required String competencyTest, required CancelCompetencyTestRequest cancelCompetencyTestRequest}) async {
    var response = await safeApiCall(apiService.cancelCompetencyTest(competencyTest: competencyTest, cancelCompetencyTestRequest: cancelCompetencyTestRequest));
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
  Future<Either<NetworkError, DeleteEnquiryFileBase>> deleteEnquiryDocument({required String enquiryID, required String documentID}) async{
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
  Future<Either<NetworkError, ParentInfo>> updateParentDetails({required String enquiryID, required ParentInfoEntity parentInfo}) async{
    var response = await safeApiCall(apiService.updateParentDetails(enquiryId: enquiryID,parentInfo: parentInfo));
    return response.fold((l) {
      return Left(l);
  }, (r) =>  Right(r.data.data!.transform()));
  }

  @override
  Future<Either<NetworkError, BankDetails>> updateBankDetails({required String enquiryID, required BankDetailsEntity bankDetails}) async{
    var response = await safeApiCall(apiService.updateBankDetails(enquiryId: enquiryID,bankDetails: bankDetails));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.data!.transform()));
  }

  @override
  Future<Either<NetworkError, ContactDetails>> updateContactDetails({required String enquiryID, required ContactDetailsEntity contactDetails}) async{
    var response = await safeApiCall(apiService.updateContactDetails(enquiryId: enquiryID,contactDetails: contactDetails));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.data!.transform()));
  }

  @override
  Future<Either<NetworkError, MedicalDetails>> updateMedicalDetails({required String enquiryID, required MedicalDetailsEntity medicalDetails}) async{
    var response = await safeApiCall(apiService.updateMedicalDetails(enquiryId: enquiryID,medicalDetails: medicalDetails));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.data!.transform()));
  }
}
