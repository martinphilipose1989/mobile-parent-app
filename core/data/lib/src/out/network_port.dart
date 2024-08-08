import 'package:domain/domain.dart';
import 'package:network_retrofit/network_retrofit.dart';


abstract class NetworkPort {
  Future<Either<NetworkError, EnquiryListModel>> getEnquiryList({required String phone, required int pageNumber, int pageSize = 10});
  Future<Either<NetworkError, AdmissionJourneyBase>> getAdmissionJourney({required String enquiryID});
  Future<Either<NetworkError, NewAdmissionBase>> getNewAdmissionDetail({required String enquiryID});
  Future<Either<NetworkError, PsaResponse>> getPsaDetail({required String enquiryID});
  Future<Either<NetworkError,  IVTBase>> getIvtDetail({required String enquiryID});
  // Future<Either<NetworkError, IVTBase>> getRegistrationDetail({required String enquiryID, required String infoType});
  Future<Either<NetworkError,SchoolVisitCreation>> createSchoolVisit({required String enquiryID,required SchoolCreationRequest schoolCreationRequest});
  Future<Either<NetworkError,SchoolVisitCreation>> rescheduleSchoolVisit({required String schoolVisitID,required SchoolCreationRequest schoolCreationRequest});
  Future<Either<NetworkError,SchoolVisitCreation>> cancelSchoolVisit({required String schoolVisitID,required SchoolVisitCancelRequest cancelSchoolRequest});
  
  Future<Either<NetworkError,AdmissionListBaseModel>> getAdmissionList({required String phone,required int pageNumber,int pageSize = 10});
  
  Future<Either<NetworkError,CompetencyTestCreation>> createCompetencyTest({required String enquiryID,required CompetencyTestCreationRequest competencyTestCreationRequest});
  Future<Either<NetworkError,CompetencyTestCreation>> rescheduleCompetencyTest({required String competencyTest,required CompetencyTestCreationRequest competencyTestCreationRequest});
  Future<Either<NetworkError,CompetencyTestCreation>> cancelCompetencyTest({required String competencyTest,required CancelCompetencyTestRequest cancelCompetencyTestRequest});
}
  
