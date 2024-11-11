import 'dart:io';

import 'package:domain/domain.dart';
import 'package:domain/src/usecase/gatepass/get_visitor_details_usecase.dart';

abstract class GatepassRepository {
  Future<Either<NetworkError, CreateQrcodeResponseModel>> requestGatePass(
      {required CreateQrcodeRequestModel requestBody});

  Future<Either<NetworkError, UploadFileResponseModel>> uploadProfileImage(
      {required UploadVisitorProfileUsecaseParams params});

  Future<Either<NetworkError, CreateGatepassResponseModel>>
      createVisitorGatePass({required CreateGatePassModel request});

  Future<Either<NetworkError, MdmCoReasonResponseModel>>
      getPurposeOfVisitList();

  Future<Either<NetworkError, VisitorDetailsResponseModel>> getVisitorDetails(
      {required GetVisitorDetailsUseCaseParams params});
}
