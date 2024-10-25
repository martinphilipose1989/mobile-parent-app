import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:network_retrofit/network_retrofit.dart';

class GetCafeteriaEnrollmentDetailUsecase extends BaseUseCase<BaseError,
    GetCafeteriaEnrollmentDetailUsecaseParams, CafeteriaEnrollmentResponseModel> {
  final RegistrationRepository _registrationRepository;

  GetCafeteriaEnrollmentDetailUsecase(
    this._registrationRepository,
  );

  @override
  Future<Either<BaseError, CafeteriaEnrollmentResponseModel>> execute({
    required GetCafeteriaEnrollmentDetailUsecaseParams params,
  }) {
    return _registrationRepository.getCafeteriaEnrollmentDetail(vasDetailRequest: params.vasDetailRequest);
  }
}

class GetCafeteriaEnrollmentDetailUsecaseParams extends Params {
  final VasDetailRequest vasDetailRequest;
  GetCafeteriaEnrollmentDetailUsecaseParams({
    required this.vasDetailRequest,
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
