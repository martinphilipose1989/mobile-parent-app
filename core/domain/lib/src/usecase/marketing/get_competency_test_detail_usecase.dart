import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetCompetencyTestDetailUseCase extends BaseUseCase<BaseError,
    GetCompetencyTestDetailUseCaseParams, CompetencyTestDetailBase> {
  final CompetencyTestRepository _competencyTestRepository;

  GetCompetencyTestDetailUseCase(
    this._competencyTestRepository,
  );

  @override
  Future<Either<BaseError, CompetencyTestDetailBase>> execute({
    required GetCompetencyTestDetailUseCaseParams params,
  }) {
    return _competencyTestRepository.getCompetencyTestDetail(
      enquiryID: params.enquiryID
    );
  }
}

class GetCompetencyTestDetailUseCaseParams extends Params {
  final String enquiryID;
  GetCompetencyTestDetailUseCaseParams({
    required this.enquiryID
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}