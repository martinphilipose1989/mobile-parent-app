import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:network_retrofit/network_retrofit.dart';

class GetTransportEnrollmentDetailUsecase extends BaseUseCase<
    BaseError,
    GetTransportEnrollmentDetailUsecaseParams,
    TransportEnrollmentResponseModel> {
  final RegistrationRepository _registrationRepository;

  GetTransportEnrollmentDetailUsecase(
    this._registrationRepository,
  );

  @override
  Future<Either<BaseError, TransportEnrollmentResponseModel>> execute({
    required GetTransportEnrollmentDetailUsecaseParams params,
  }) {
    return _registrationRepository.getTransportEnrollmentDetail(
        vasDetailRequest: params.vasDetailRequest);
  }
}

class GetTransportEnrollmentDetailUsecaseParams extends Params {
  final VasDetailRequest vasDetailRequest;
  GetTransportEnrollmentDetailUsecaseParams({
    required this.vasDetailRequest,
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
