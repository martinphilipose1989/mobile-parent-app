import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:network_retrofit/network_retrofit.dart';

class FetchStopsUsecase extends BaseUseCase<BaseError,
    FetchStopsUsecaseParams, FetchStopResponseModel> {
  final RegistrationRepository _registrationRepository;

  FetchStopsUsecase(
    this._registrationRepository,
  );

  @override
  Future<Either<BaseError, FetchStopResponseModel>> execute({
    required FetchStopsUsecaseParams params,
  }) {
    return _registrationRepository.fetchStops(fetchStopRequest: params.fetchStopRequest);
  }
}

class FetchStopsUsecaseParams extends Params {
  final FetchStopRequest fetchStopRequest;
  FetchStopsUsecaseParams({
    required this.fetchStopRequest,
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
