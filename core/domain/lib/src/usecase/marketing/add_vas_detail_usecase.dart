import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:network_retrofit/network_retrofit.dart';

class AddVasDetailUsecase extends BaseUseCase<BaseError,
    AddVasDetailUsecaseParams, VasOptionResponse> {
  final RegistrationRepository _registrationRepository;

  AddVasDetailUsecase(
    this._registrationRepository,
  );

  @override
  Future<Either<BaseError, VasOptionResponse>> execute({
    required AddVasDetailUsecaseParams params,
  }) {
    return _registrationRepository.addVasDeatil(
      vasEnrollmentRequest: params.vasEnrollmentRequest,
      enquiryID: params.enquiryID,
      type: params.type
    );
  }
}

class AddVasDetailUsecaseParams extends Params {
  final VasEnrollmentRequest vasEnrollmentRequest;
  final String enquiryID;
  final String type;
  AddVasDetailUsecaseParams({
    required this.vasEnrollmentRequest,
    required this.enquiryID,
    required this.type
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}