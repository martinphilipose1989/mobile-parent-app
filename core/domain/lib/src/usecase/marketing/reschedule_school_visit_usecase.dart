import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:network_retrofit/network_retrofit.dart';

class RescheduleSchoolVisitUseCase extends BaseUseCase<BaseError,
    RescheduleSchoolVisitUseCaseParams, SchoolVisitDetailBase> {
  final SchoolVisitRepository _schoolVisitRepository;

  RescheduleSchoolVisitUseCase(
    this._schoolVisitRepository,
  );

  @override
  Future<Either<BaseError, SchoolVisitDetailBase>> execute({
    required RescheduleSchoolVisitUseCaseParams params,
  }) {
    return _schoolVisitRepository.rescheduleSchoolVisit(
      schoolVisitID: params.schoolVisitID, schoolCreationRequest: params.schoolCreationRequest,
    );
  }
}

class RescheduleSchoolVisitUseCaseParams extends Params {
  final String schoolVisitID;
  final SchoolCreationRequest schoolCreationRequest;
  RescheduleSchoolVisitUseCaseParams({
    required this.schoolVisitID,
    required this.schoolCreationRequest
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}