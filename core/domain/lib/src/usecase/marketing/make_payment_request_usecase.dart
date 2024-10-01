import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class MakePaymentRequestUsecase extends BaseUseCase<BaseError,
    MakePaymentRequestUsecaseParams, VasOptionResponse> {
  final RegistrationRepository _registrationRepository;

  MakePaymentRequestUsecase(
    this._registrationRepository,
  );

  @override
  Future<Either<BaseError, VasOptionResponse>> execute({
    required MakePaymentRequestUsecaseParams params,
  }) {
    return _registrationRepository.makePaymentRequest(
      enquiryID: params.enquiryID,
    );
  }
}

class MakePaymentRequestUsecaseParams extends Params {
  final String enquiryID;
  MakePaymentRequestUsecaseParams({
    required this.enquiryID,
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}