import 'package:domain/domain.dart';

abstract class NetworkPort {
  Future<Either<NetworkError, CreateQrcodeResponseModel>> requestGatePass(
      {required CreateQrcodeRequestModel requestBody});
}
