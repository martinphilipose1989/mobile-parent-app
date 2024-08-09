import 'dart:io';

import 'package:domain/domain.dart';
import 'package:network_retrofit/network_retrofit.dart';


abstract class NetworkPort {
  Future<Either<NetworkError, EnquiryListModel>> getEnquiryList({required String phone, required int pageNumber, int pageSize = 10});
  Future<Either<NetworkError, CompetencyTestBase>> getEnquiryDetail({required String enquiryID});
  Future<Either<NetworkError, EnquiryTimeLineBase>> getEnquiryTimeline({required String enquiryID});
  Future<Either<NetworkError, AdmissionJourneyBase>> getAdmissionJourney({required String enquiryID});
  Future<Either<NetworkError, NewAdmissionBase>> getNewAdmissionDetail({required String enquiryID});
  Future<Either<NetworkError, PsaResponse>> getPsaDetail({required String enquiryID});
  Future<Either<NetworkError,  IVTBase>> getIvtDetail({required String enquiryID});
  // Future<Either<NetworkError, IVTBase>> getRegistrationDetail({required String enquiryID, required String infoType});
  Future<Either<NetworkError,SchoolVisitDetailBase>> getSchoolVisitDetail({required String enquiryID});
  Future<Either<NetworkError,SchoolVisitDetailBase>> createSchoolVisit({required String enquiryID,required SchoolCreationRequest schoolCreationRequest});
  Future<Either<NetworkError,SchoolVisitDetailBase>> rescheduleSchoolVisit({required String schoolVisitID,required SchoolCreationRequest schoolCreationRequest});
  Future<Either<NetworkError,SchoolVisitDetailBase>> cancelSchoolVisit({required String schoolVisitID,required SchoolVisitCancelRequest cancelSchoolRequest});
  
  Future<Either<NetworkError,AdmissionListBaseModel>> getAdmissionList({required String phone,required int pageNumber,int pageSize = 10});
  
  Future<Either<NetworkError,CompetencyTestDetailBase>> getCompetencyTestDetail({required String enquiryID,});
  Future<Either<NetworkError,CompetencyTestDetailBase>> createCompetencyTest({required String enquiryID,required CompetencyTestCreationRequest competencyTestCreationRequest});
  Future<Either<NetworkError,CompetencyTestDetailBase>> rescheduleCompetencyTest({required String competencyTest,required CompetencyTestCreationRequest competencyTestCreationRequest});
  Future<Either<NetworkError,CompetencyTestDetailBase>> cancelCompetencyTest({required String competencyTest,required CancelCompetencyTestRequest cancelCompetencyTestRequest});

  Future<Either<NetworkError,EnquiryFileUploadBase>> uploadEnquiryDocument({required String enquiryID,required String documentID,required File file});
  Future<Either<NetworkError,DownloadEnquiryFileBase>> downloadEnquiryDocument({required String enquiryID,required String documentID});
  Future<Either<NetworkError,DeleteEnquiryFileBase>> deleteEnquiryDocument({required String enquiryID,required String documentID});
  
}
  
