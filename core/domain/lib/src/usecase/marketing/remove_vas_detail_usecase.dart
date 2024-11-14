import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class RemoveVasDetailUsecase extends BaseUseCase<BaseError,
    RemoveVasDetailUsecaseParams, VasOptionResponse> {
  final RegistrationRepository _registrationRepository;

  RemoveVasDetailUsecase(
    this._registrationRepository,
  );

  @override
  Future<Either<BaseError, VasOptionResponse>> execute({
    required RemoveVasDetailUsecaseParams params,
  }) {
    return _registrationRepository.removeVasDeatil(
      enquiryID: params.enquiryID,
      type: params.type
    );
  }
}

class RemoveVasDetailUsecaseParams extends Params {
  final String enquiryID;
  final String type;
  RemoveVasDetailUsecaseParams({
    required this.enquiryID,
    required this.type
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}