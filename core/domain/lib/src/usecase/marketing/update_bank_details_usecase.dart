import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:network_retrofit/network_retrofit.dart';

class UpdateBankDetailsUsecase<T> extends BaseUseCase<BaseError,
    UpdateBankDetailsUsecaseParams, BaseInfo<T>> {
  final RegistrationRepository _registrationRepository;

  UpdateBankDetailsUsecase(
    this._registrationRepository,
  );

  @override
  Future<Either<BaseError, BaseInfo<T>>> execute({
    required UpdateBankDetailsUsecaseParams params,
  }) {
    return _registrationRepository.updateBankDetails(
      enquiryID: params.enquiryID,bankDetails: params.bankDetails
    );
  }
}

class UpdateBankDetailsUsecaseParams extends Params {
  final String enquiryID;
  final BankDetailsEntity bankDetails;
  UpdateBankDetailsUsecaseParams({
    required this.enquiryID,
    required this.bankDetails
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}