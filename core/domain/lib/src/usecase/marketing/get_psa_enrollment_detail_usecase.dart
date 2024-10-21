import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:network_retrofit/network_retrofit.dart';

class GetPsaEnrollmentDetailUsecase extends BaseUseCase<BaseError,
    GetPsaEnrollmentDetailUsecaseParams, PsaEnrollmentDetailResponseModel> {
  final RegistrationRepository _registrationRepository;

  GetPsaEnrollmentDetailUsecase(
    this._registrationRepository,
  );

  @override
  Future<Either<BaseError, PsaEnrollmentDetailResponseModel>> execute({
    required GetPsaEnrollmentDetailUsecaseParams params,
  }) {
    return _registrationRepository.getPsaEnrollmentDetail(vasDetailRequest: params.vasDetailRequest);
  }
}

class GetPsaEnrollmentDetailUsecaseParams extends Params {
  final VasDetailRequest vasDetailRequest;
  GetPsaEnrollmentDetailUsecaseParams({
    required this.vasDetailRequest,
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
