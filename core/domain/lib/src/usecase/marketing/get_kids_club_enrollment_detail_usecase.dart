import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:network_retrofit/network_retrofit.dart';

class GetKidsClubEnrollmentDetailUsecase extends BaseUseCase<
    BaseError,
    GetKidsClubEnrollmentDetailUsecaseParams,
    KidsClubEnrollmentResponseModel> {
  final RegistrationRepository _registrationRepository;

  GetKidsClubEnrollmentDetailUsecase(
    this._registrationRepository,
  );

  @override
  Future<Either<BaseError, KidsClubEnrollmentResponseModel>> execute({
    required GetKidsClubEnrollmentDetailUsecaseParams params,
  }) {
    return _registrationRepository.getKidsClubEnrollmentDetail(
        vasDetailRequest: params.vasDetailRequest);
  }
}

class GetKidsClubEnrollmentDetailUsecaseParams extends Params {
  final VasDetailRequest vasDetailRequest;
  GetKidsClubEnrollmentDetailUsecaseParams({
    required this.vasDetailRequest,
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
