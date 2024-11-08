import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class CreateGatepassUsecase extends BaseUseCase<NetworkError,
    CreateGatepassUsecaseParams, CreateGatepassResponseModel> {
  final GatepassRepository _gatepassRepository;

  CreateGatepassUsecase({required GatepassRepository gatepassRepository})
      : _gatepassRepository = gatepassRepository;

  @override
  Future<Either<NetworkError, CreateGatepassResponseModel>> execute(
      {required CreateGatepassUsecaseParams params}) {
    return _gatepassRepository.createVisitorGatePass(
        request: params.requestModel);
  }
}

class CreateGatepassUsecaseParams extends Params {
  final CreateGatePassModel requestModel;

  CreateGatepassUsecaseParams({required this.requestModel});

  @override
  Either<AppError, bool> verify() {
    if (requestModel.visitorTypeId == null) {
      return Left(
        AppError(
          type: ErrorType.uiVistorType,
          throwable: Exception(),
          error: ErrorInfo(message: 'Please select type of visitor'),
        ),
      );
    } else if (requestModel.purposeOfVisitId == null) {
      return Left(
        AppError(
          type: ErrorType.uiPurposeOfVisit,
          throwable: Exception(),
          error: ErrorInfo(message: 'Please select purpose of visit'),
        ),
      );
    } else if (Validator.isEmpty(requestModel.profileImage ?? '')) {
      return Left(
        AppError(
          type: ErrorType.uiPorfileImage,
          throwable: Exception(),
          error: ErrorInfo(message: 'Please click image of visitor'),
        ),
      );
    }
    return Right(true);
  }
}
