import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class SendCommunicationUsecase extends BaseUseCase<BaseError,
    SendCommunicationUsecaseParams, SendCommunicationModel> {
  final TicketingRepository _repository;

  SendCommunicationUsecase(
    this._repository,
  );

  @override
  Future<Either<BaseError, SendCommunicationModel>> execute(
      {required SendCommunicationUsecaseParams params}) async {
    return await _repository.sendCommunication(
        createCommunicationLogRequest: params.createCommunicationLogRequest);
  }
}

class SendCommunicationUsecaseParams extends Params {
  final CreateCommunicationLogRequest createCommunicationLogRequest;
  SendCommunicationUsecaseParams({required this.createCommunicationLogRequest});

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
