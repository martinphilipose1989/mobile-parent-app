import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class RequestGatepassUsecase extends BaseUseCase<NetworkError,
    RequestGatepassUsecaseParams, CreateQrcodeResponseModel> {
  final GatepassRepository _gatePassRepository;

  RequestGatepassUsecase({required GatepassRepository gatePassRepository})
      : _gatePassRepository = gatePassRepository;

  @override
  Future<Either<NetworkError, CreateQrcodeResponseModel>> execute(
      {required RequestGatepassUsecaseParams params}) {
    return _gatePassRepository.requestGatePass(requestBody: params.requestBody);
  }
}

class RequestGatepassUsecaseParams extends Params {
  final CreateQrcodeRequestModel requestBody;

  RequestGatepassUsecaseParams({required this.requestBody});

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
