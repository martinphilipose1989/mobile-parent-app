import 'package:data/data.dart';

class GatepassRepositoryImpl extends GatepassRepository {
  final NetworkPort networkPort;

  GatepassRepositoryImpl({required this.networkPort});

  @override
  Future<Either<NetworkError, CreateQrcodeResponseModel>> requestGatePass(
      {required CreateQrcodeRequestModel requestBody}) {
    return networkPort.requestGatePass(requestBody: requestBody);
  }
}
