import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:network_retrofit/network_retrofit.dart';

class CancelCompetencyTestUsecase extends BaseUseCase<BaseError,
    CancelCompetencyTestUsecaseParams, CompetencyTestDetailBase> {
  final CompetencyTestRepository _competencyTestRepository;

  CancelCompetencyTestUsecase(
    this._competencyTestRepository,
  );

  @override
  Future<Either<BaseError, CompetencyTestDetailBase>> execute({
    required CancelCompetencyTestUsecaseParams params,
  }) {
    return _competencyTestRepository.cancelCompetencyTest(
      enquiryID: params.enquiryID, cancelCompetencyTestRequest: params.cancelCompetencyTestRequest,
    );
  }
}

class CancelCompetencyTestUsecaseParams extends Params {
  final String enquiryID;
  final CancelCompetencyTestRequest cancelCompetencyTestRequest;
  CancelCompetencyTestUsecaseParams({
    required this.enquiryID,
    required this.cancelCompetencyTestRequest,
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}