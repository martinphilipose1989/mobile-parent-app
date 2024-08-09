import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:network_retrofit/network_retrofit.dart';

class CreateSchoolVisitUseCase extends BaseUseCase<BaseError,
    CreateSchoolVisitUseCaseParams, SchoolVisitDetailBase> {
  final SchoolVisitRepository _schoolVisitRepository;

  CreateSchoolVisitUseCase(
    this._schoolVisitRepository,
  );

  @override
  Future<Either<BaseError, SchoolVisitDetailBase>> execute({
    required CreateSchoolVisitUseCaseParams params,
  }) {
    return _schoolVisitRepository.createSchoolVisit(
      enquiryID: params.enquiryID, schoolCreationRequest: params.schoolCreationRequest,
    );
  }
}

class CreateSchoolVisitUseCaseParams extends Params {
  final String enquiryID;
  final SchoolCreationRequest schoolCreationRequest;
  CreateSchoolVisitUseCaseParams({
    required this.enquiryID,
    required this.schoolCreationRequest
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}