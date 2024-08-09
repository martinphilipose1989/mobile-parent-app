import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:network_retrofit/network_retrofit.dart';

class CreateCompetencyTestUsecase extends BaseUseCase<BaseError,
    CreateCompetencyTestUsecaseParams, CompetencyTestDetailBase> {
  final CompetencyTestRepository _competencyTestRepository;

  CreateCompetencyTestUsecase(
    this._competencyTestRepository,
  );

  @override
  Future<Either<BaseError, CompetencyTestDetailBase>> execute({
    required CreateCompetencyTestUsecaseParams params,
  }) {
    return _competencyTestRepository.createCompetencyTest(
      enquiryID: params.enquiryID, competencyTestCreationRequest: params.competencyTestCreationRequest,
    );
  }
}

class CreateCompetencyTestUsecaseParams extends Params {
  final String enquiryID;
  final CompetencyTestCreationRequest competencyTestCreationRequest;
  CreateCompetencyTestUsecaseParams({
    required this.enquiryID,
    required this.competencyTestCreationRequest
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}