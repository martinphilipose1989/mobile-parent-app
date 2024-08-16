import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:network_retrofit/network_retrofit.dart';

class RescheduleCompetencyTestUseCase extends BaseUseCase<BaseError,
    RescheduleCompetencyTestUseCaseParams, CompetencyTestDetailBase> {
  final CompetencyTestRepository _competencyTestRepository;

  RescheduleCompetencyTestUseCase(
    this._competencyTestRepository,
  );

  @override
  Future<Either<BaseError, CompetencyTestDetailBase>> execute({
    required RescheduleCompetencyTestUseCaseParams params,
  }) {
    return _competencyTestRepository.rescheduleCompetencyTest(
      enquiryID: params.enquiryID, competencyTestCreationRequest: params.competencyTestCreationRequest,
    );
  }
}

class RescheduleCompetencyTestUseCaseParams extends Params {
  final String enquiryID;
  final CompetencyTestCreationRequest competencyTestCreationRequest;
  RescheduleCompetencyTestUseCaseParams({
    required this.enquiryID,
    required this.competencyTestCreationRequest
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}