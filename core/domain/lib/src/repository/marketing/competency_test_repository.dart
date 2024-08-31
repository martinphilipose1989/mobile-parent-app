import 'package:domain/domain.dart';
import 'package:network_retrofit/network_retrofit.dart';

abstract class CompetencyTestRepository{
  Future<Either<NetworkError,Slots>> getCompetencyTestSlots({required String enquiryID,required date});
  Future<Either<NetworkError,CompetencyTestDetailBase>> getCompetencyTestDetail({required String enquiryID});
  Future<Either<NetworkError,CompetencyTestDetailBase>> createCompetencyTest({required String enquiryID,required CompetencyTestCreationRequest competencyTestCreationRequest});
  Future<Either<NetworkError,CompetencyTestDetailBase>> rescheduleCompetencyTest({required String enquiryID,required CompetencyTestRescheduleRequest competencyTestCreationRequest});
  Future<Either<NetworkError,CompetencyTestDetailBase>> cancelCompetencyTest({required String enquiryID,required CancelCompetencyTestRequest cancelCompetencyTestRequest});
}