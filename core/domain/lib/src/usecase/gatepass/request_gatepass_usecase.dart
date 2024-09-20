import 'package:domain/domain.dart';
import 'package:domain/src/repository/gatepass/gatepass_repository.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class RequestGatepassUsecase extends BaseUseCase<NetworkError,
    RequestGatepassUsecaseParams, CreateQrcodeResponseModel> {
  final GatepassRepository _gatepassRepository;

  RequestGatepassUsecase({required GatepassRepository gatepassRepository})
      : _gatepassRepository = gatepassRepository;

  @override
  Future<Either<NetworkError, CreateQrcodeResponseModel>> execute(
      {required RequestGatepassUsecaseParams params}) {
    return _gatepassRepository.requestGatePass(requestBody: params.requestBody);
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
