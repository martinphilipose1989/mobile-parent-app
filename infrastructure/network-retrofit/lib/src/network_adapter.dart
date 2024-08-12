import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:network_retrofit/util/safe_api_call.dart';

import 'services/retrofit_service.dart';

class NetworkAdapter implements NetworkPort {
  final RetrofitService apiService;

  NetworkAdapter(this.apiService);

  @override
  Future<Either<NetworkError, EnquiryListModel>> getEnquiryList({required String phone, required int pageNumber, int pageSize = 10}) async {
    var response = await safeApiCall(apiService.getEnquiryList(
         phone:  phone,pageNumber: pageNumber,pageSize: pageSize));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, AdmissionJourneyBase>> getAdmissionJourney({required String enquiryID}) async {
    var response = await safeApiCall(apiService.getAdmissionJourney(enquiryID: enquiryID));
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
  Future<Either<NetworkError, PsaResponse>> getPsaDetail({required String enquiryID}) async {
    var response = await safeApiCall(apiService.getPsaDetail(enquiryID: enquiryID));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, IVTBase>> getIvtDetail({required String enquiryID}) async {
    var response = await safeApiCall(apiService.getItvDetail(enquiryID: enquiryID));
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
  Future<Either<NetworkError, CompetencyTestBase>> getEnquiryDetail({required String enquiryID}) async{
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
  Future<Either<NetworkError, BaseInfo<T>>> getRegistrationDetail<T>({required String enquiryID, required String infoType}) async {
    var response = await safeApiCall(apiService.getRegistrationDetail(enquiryId: enquiryID, infoType: infoType));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, BaseInfo<T>>> updateParentDetails<T>({required String enquiryID, required ParentInfoEntity parentInfo}) async{
    var response = await safeApiCall(apiService.updateParentDetails(enquiryId: enquiryID,parentInfo: parentInfo));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, BaseInfo<T>>> updateBankDetails<T>({required String enquiryID, required BankDetailsEntity bankDetails}) async{
    var response = await safeApiCall(apiService.updateBankDetails(enquiryId: enquiryID,bankDetails: bankDetails));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, BaseInfo<T>>> updateContactDetails<T>({required String enquiryID, required ContactDetailsEntity contactDetails}) async{
    var response = await safeApiCall(apiService.updateContactDetails(enquiryId: enquiryID,contactDetails: contactDetails));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, BaseInfo<T>>> updateMedicalDetails<T>({required String enquiryID, required MedicalDetailsEntity medicalDetails}) async{
    var response = await safeApiCall(apiService.updateMedicalDetails(enquiryId: enquiryID,medicalDetails: medicalDetails));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }
}
