import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:network_retrofit/network_retrofit.dart';

class GetSummerCampEnrollmentDetailUsecase extends BaseUseCase<
    BaseError,
    GetSummerCampEnrollmentDetailUsecaseParams,
    SummerCampEnrollmentResponseModel> {
  final RegistrationRepository _registrationRepository;

  GetSummerCampEnrollmentDetailUsecase(
    this._registrationRepository,
  );

  @override
  Future<Either<BaseError, SummerCampEnrollmentResponseModel>> execute({
    required GetSummerCampEnrollmentDetailUsecaseParams params,
  }) {
    return _registrationRepository.getSummerCampEnrollmentDetail(
        vasDetailRequest: params.vasDetailRequest);
  }
}

class GetSummerCampEnrollmentDetailUsecaseParams extends Params {
  final VasDetailRequest vasDetailRequest;
  GetSummerCampEnrollmentDetailUsecaseParams({
    required this.vasDetailRequest,
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
