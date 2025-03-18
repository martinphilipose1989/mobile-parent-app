import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:network_retrofit/network_retrofit.dart';

class CalculateFeesUsecase extends BaseUseCase<BaseError,
    CalculateFeesUsecaseParams, VasOptionResponse> {
  final RegistrationRepository _registrationRepository;

  CalculateFeesUsecase(
    this._registrationRepository,
  );

  @override
  Future<Either<BaseError, VasOptionResponse>> execute({
    required CalculateFeesUsecaseParams params,
  }) {
    return _registrationRepository.calculateFees(feeCalculationRequest: params.feeCalculationRequest);
  }
}

class CalculateFeesUsecaseParams extends Params {
  final VasEnrollmentFeeCalculationRequest feeCalculationRequest;
  CalculateFeesUsecaseParams({
    required this.feeCalculationRequest,
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
