import 'package:domain/domain.dart';

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
