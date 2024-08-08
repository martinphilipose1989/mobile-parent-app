import 'package:domain/domain.dart';
import 'package:domain/src/repository/marketing/competency_test_repository.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:network_retrofit/network_retrofit.dart';

class RescheduleCompetencyTestUseCase extends BaseUseCase<BaseError,
    RescheduleCompetencyTestUseCaseParams, CompetencyTestCreation> {
  final CompetencyTestRepository _competencyTestRepository;

  RescheduleCompetencyTestUseCase(
    this._competencyTestRepository,
  );

  @override
  Future<Either<BaseError, CompetencyTestCreation>> execute({
    required RescheduleCompetencyTestUseCaseParams params,
  }) {
    return _competencyTestRepository.rescheduleCompetencyTest(
      competencyTest: params.competencyTest, competencyTestCreationRequest: params.competencyTestCreationRequest,
    );
  }
}

class RescheduleCompetencyTestUseCaseParams extends Params {
  final String competencyTest;
  final CompetencyTestCreationRequest competencyTestCreationRequest;
  RescheduleCompetencyTestUseCaseParams({
    required this.competencyTest,
    required this.competencyTestCreationRequest
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}