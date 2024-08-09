import 'package:domain/domain.dart';
import 'package:network_retrofit/network_retrofit.dart';

abstract class CompetencyTestRepository{
  Future<Either<NetworkError,CompetencyTestDetailBase>> getCompetencyTestDetail({required String enquiryID});
  Future<Either<NetworkError,CompetencyTestDetailBase>> createCompetencyTest({required String enquiryID,required CompetencyTestCreationRequest competencyTestCreationRequest});
  Future<Either<NetworkError,CompetencyTestDetailBase>> rescheduleCompetencyTest({required String competencyTest,required CompetencyTestCreationRequest competencyTestCreationRequest});
  Future<Either<NetworkError,CompetencyTestDetailBase>> cancelCompetencyTest({required String competencyTest,required CancelCompetencyTestRequest cancelCompetencyTestRequest});
}