import 'dart:io';

import 'package:data/data.dart';

class GatepassRepositoryImpl extends GatepassRepository {
  final NetworkPort networkPort;

  GatepassRepositoryImpl({required this.networkPort});

  @override
  Future<Either<NetworkError, CreateQrcodeResponseModel>> requestGatePass(
      {required CreateQrcodeRequestModel requestBody}) {
    return networkPort.requestGatePass(requestBody: requestBody);
  }

  @override
  Future<Either<NetworkError, UploadFileResponseModel>> uploadProfileImage(
      {required UploadVisitorProfileUsecaseParams params}) {
    return networkPort.uploadProfileImage(params: params);
  }

  @override
  Future<Either<NetworkError, CreateGatepassResponseModel>>
      createVisitorGatePass({required CreateGatePassModel request}) {
    return networkPort.createVisitorGatePass(request: request);
  }

  @override
  Future<Either<NetworkError, MdmCoReasonResponseModel>>
      getPurposeOfVisitList() {
    return networkPort.getPurposeOfVisitList();
  }

  @override
  Future<Either<NetworkError, VisitorDetailsResponseModel>> getVisitorDetails(
      {required params}) {
    return networkPort.getVisitorDetails(params: params);
  }
}
