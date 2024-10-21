import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:network_retrofit/network_retrofit.dart';

class GetSubjectListUsecase extends BaseUseCase<BaseError,
    GetSubjectListUsecaseParams, SubjectListResponse> {
  final RegistrationRepository _registrationRepository;

  GetSubjectListUsecase(
    this._registrationRepository,
  );

  @override
  Future<Either<BaseError, SubjectListResponse>> execute({
    required GetSubjectListUsecaseParams params,
  }) {
    return _registrationRepository.getSubjectList(subjectListingRequest: params.subjectListingRequest);
  }
}

class GetSubjectListUsecaseParams extends Params {
  final SubjectListingRequest subjectListingRequest;
  GetSubjectListUsecaseParams({
    required this.subjectListingRequest,
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
