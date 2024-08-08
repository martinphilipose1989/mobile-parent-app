import 'package:domain/domain.dart';
import 'package:network_retrofit/network_retrofit.dart';

abstract class CompetencyTestRepository{
  Future<Either<NetworkError,CompetencyTestCreation>> createCompetencyTest({required String enquiryID,required CompetencyTestCreationRequest competencyTestCreationRequest});
  Future<Either<NetworkError,CompetencyTestCreation>> rescheduleCompetencyTest({required String competencyTest,required CompetencyTestCreationRequest competencyTestCreationRequest});
  Future<Either<NetworkError,CompetencyTestCreation>> cancelCompetencyTest({required String competencyTest,required CancelCompetencyTestRequest cancelCompetencyTestRequest});
}