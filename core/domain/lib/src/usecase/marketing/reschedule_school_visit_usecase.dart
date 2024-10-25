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
      enquiryID: params.enquiryID, schoolCreationRequest: params.schoolCreationRequest,
    );
  }
}

class RescheduleSchoolVisitUseCaseParams extends Params {
  final String enquiryID;
  final RescheduleSchoolVisitRequest schoolCreationRequest;
  RescheduleSchoolVisitUseCaseParams({
    required this.enquiryID,
    required this.schoolCreationRequest
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}