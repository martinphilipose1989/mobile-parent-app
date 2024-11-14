import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetAdmissionVasUsecase extends BaseUseCase<NetworkError,
    GetAdmissionVasUsecaseParams, AdmissionVasDetailsResponse> {
  final RegistrationRepository registrationRepository;

  GetAdmissionVasUsecase({required this.registrationRepository});

  @override
  Future<Either<NetworkError, AdmissionVasDetailsResponse>> execute(
      {required GetAdmissionVasUsecaseParams params}) {
    return registrationRepository.getAdmissionVasDetails(
        enquiryId: params.enquiryId);
  }
}

class GetAdmissionVasUsecaseParams extends Params {
  final String enquiryId;

  GetAdmissionVasUsecaseParams({required this.enquiryId});
  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
