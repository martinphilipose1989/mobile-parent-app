import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:network_retrofit/network_retrofit.dart';

class CancelSchoolVisitUsecase extends BaseUseCase<BaseError,
    CancelSchoolVisitUsecaseParams, SchoolVisitCreation> {
  final SchoolVisitRepository _schoolVisitRepository;

  CancelSchoolVisitUsecase(
    this._schoolVisitRepository,
  );

  @override
  Future<Either<BaseError, SchoolVisitCreation>> execute({
    required CancelSchoolVisitUsecaseParams params,
  }) {
    return _schoolVisitRepository.cancelSchoolVisit(
      schoolVisitID: params.schoolVisitID, cancelSchoolRequest: params.schoolVisitCancelRequest,
    );
  }
}

class CancelSchoolVisitUsecaseParams extends Params {
  final String schoolVisitID;
  final SchoolVisitCancelRequest schoolVisitCancelRequest;
  CancelSchoolVisitUsecaseParams({
    required this.schoolVisitID,
    required this.schoolVisitCancelRequest
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}