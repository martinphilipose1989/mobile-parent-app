import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:network_retrofit/network_retrofit.dart';

class AddVasOptionUsecase extends BaseUseCase<BaseError,
    AddVasOptionUsecaseParams, VasOptionResponse> {
  final RegistrationRepository _registrationRepository;

  AddVasOptionUsecase(
    this._registrationRepository,
  );

  @override
  Future<Either<BaseError, VasOptionResponse>> execute({
    required AddVasOptionUsecaseParams params,
  }) {
    return _registrationRepository.addVASOption(
      vasOptionRequest: params.vasOptionRequest,
      enquiryID: params.enquiryID,
    );
  }
}

class AddVasOptionUsecaseParams extends Params {
  final VasOptionRequest vasOptionRequest;
  final String enquiryID;
  AddVasOptionUsecaseParams({
    required this.vasOptionRequest,
    required this.enquiryID,
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}