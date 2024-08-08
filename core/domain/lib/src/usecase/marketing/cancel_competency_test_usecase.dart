import 'package:domain/domain.dart';
import 'package:domain/src/repository/marketing/competency_test_repository.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:network_retrofit/network_retrofit.dart';

class CancelCompetencyTestUsecase extends BaseUseCase<BaseError,
    CancelCompetencyTestUsecaseParams, CompetencyTestCreation> {
  final CompetencyTestRepository _competencyTestRepository;

  CancelCompetencyTestUsecase(
    this._competencyTestRepository,
  );

  @override
  Future<Either<BaseError, CompetencyTestCreation>> execute({
    required CancelCompetencyTestUsecaseParams params,
  }) {
    return _competencyTestRepository.cancelCompetencyTest(
      competencyTest: params.competencyTest, cancelCompetencyTestRequest: params.cancelCompetencyTestRequest,
    );
  }
}

class CancelCompetencyTestUsecaseParams extends Params {
  final String competencyTest;
  final CancelCompetencyTestRequest cancelCompetencyTestRequest;
  CancelCompetencyTestUsecaseParams({
    required this.competencyTest,
    required this.cancelCompetencyTestRequest
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}