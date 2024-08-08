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
  Future<Either<NetworkError, SchoolVisitCreation>> createSchoolVisit({required String enquiryID,required SchoolCreationRequest schoolCreationRequest}) async {
    var response = await safeApiCall(apiService.createSchoolVisit(enquiryID: enquiryID, schoolCreationRequest: schoolCreationRequest));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, SchoolVisitCreation>> rescheduleSchoolVisit({required String schoolVisitID,required SchoolCreationRequest schoolCreationRequest}) async {
    var response = await safeApiCall(apiService.rescheduleSchoolVisit(schoolVisitID: schoolVisitID, schoolCreationRequest: schoolCreationRequest));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

    @override
  Future<Either<NetworkError, SchoolVisitCreation>> cancelSchoolVisit({required String schoolVisitID, required SchoolVisitCancelRequest cancelSchoolRequest}) async {
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
  Future<Either<NetworkError,CompetencyTestCreation>> createCompetencyTest({required String enquiryID,required CompetencyTestCreationRequest competencyTestCreationRequest}) async {
    var response = await safeApiCall(apiService.createCompetencyTest(enquiryID: enquiryID, competencyTestCreationRequest: competencyTestCreationRequest));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError,CompetencyTestCreation>> rescheduleCompetencyTest({required String competencyTest,required CompetencyTestCreationRequest competencyTestCreationRequest}) async {
    var response = await safeApiCall(apiService.rescheduleCompetencyTest(competencyTest: competencyTest, competencyTestCreationRequest: competencyTestCreationRequest));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<NetworkError, CompetencyTestCreation>> cancelCompetencyTest({required String competencyTest, required CancelCompetencyTestRequest cancelCompetencyTestRequest}) async {
    var response = await safeApiCall(apiService.cancelCompetencyTest(competencyTest: competencyTest, cancelCompetencyTestRequest: cancelCompetencyTestRequest));
    return response.fold((l) {
      return Left(l);
    }, (r) => Right(r.data.transform()));
  }
  // @override
  // Future<Either<NetworkError, IVTBase>> getRegistrationDetail({required String enquiryID, required String infoType}) async {
  //   var response = await safeApiCall(apiService.getRegistrationDetail(enquiryID: enquiryID));
  //   return response.fold((l) {
  //     return Left(l);
  //   }, (r) => Right(r.data.transform()));
  // }
}
