import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:network_retrofit/network_retrofit.dart';

class GetSiblingDetailsUsecase extends BaseUseCase<BaseError,
    GetSiblingDetailsUsecaseParams, SiblingProfileResponse> {
  final RegistrationRepository _registrationRepository;

  GetSiblingDetailsUsecase(
    this._registrationRepository,
  );

  @override
  Future<Either<BaseError, SiblingProfileResponse>> execute({
    required GetSiblingDetailsUsecaseParams params,
  }) {
    return _registrationRepository.getSiblingDetail(
      getSiblingDetailRequest: params.getSiblingDetailRequest
    );
  }
}

class GetSiblingDetailsUsecaseParams extends Params {
  final GetSiblingDetailRequest getSiblingDetailRequest;
  GetSiblingDetailsUsecaseParams({
    required this.getSiblingDetailRequest,
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}