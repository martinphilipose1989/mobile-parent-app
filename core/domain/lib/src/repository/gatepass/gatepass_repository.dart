import 'package:domain/domain.dart';

abstract class GatepassRepository {
  Future<Either<NetworkError, CreateQrcodeResponseModel>> requestGatePass(
      {required CreateQrcodeRequestModel requestBody});
}
