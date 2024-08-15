import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:network_retrofit/network_retrofit.dart';

class UpdateMedicalDetailsUsecase extends BaseUseCase<BaseError,
    UpdateMedicalDetailsUsecaseParams, MedicalDetails> {
  final RegistrationRepository _registrationRepository;

  UpdateMedicalDetailsUsecase(
    this._registrationRepository,
  );

  @override
  Future<Either<BaseError, MedicalDetails>> execute({
    required UpdateMedicalDetailsUsecaseParams params,
  }) {
    return _registrationRepository.updateMedicalDetails(
      enquiryID: params.enquiryID,medicalDetails: params.medicalDetails
    );
  }
}

class UpdateMedicalDetailsUsecaseParams extends Params {
  final String enquiryID;
  final MedicalDetailsEntity medicalDetails;
  UpdateMedicalDetailsUsecaseParams({
    required this.enquiryID,
    required this.medicalDetails
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}