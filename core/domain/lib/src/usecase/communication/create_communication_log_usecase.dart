import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class CreateCommunicationLogUsecase extends BaseUseCase<BaseError,
    CreateCommunicationLogUsecaseParams, CreateCommunicationLogModel> {
  final TicketingRepository _repository;

  CreateCommunicationLogUsecase(
    this._repository,
  );

  @override
  Future<Either<BaseError, CreateCommunicationLogModel>> execute(
      {required CreateCommunicationLogUsecaseParams params}) async {
    return await _repository.createCommunicationLog(
        createCommunicationLogRequest: params.createCommunicationLogRequest);
  }
}

class CreateCommunicationLogUsecaseParams extends Params {
  final CreateCommunicationLogRequest createCommunicationLogRequest;
  CreateCommunicationLogUsecaseParams(
      {required this.createCommunicationLogRequest});

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
