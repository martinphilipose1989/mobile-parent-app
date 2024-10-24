import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class CreateCommunicationLogUsecase extends BaseUseCase<BaseError,
    CreateCommunicationLogUsecaseParams, GetCommunicationDetails> {
  final TicketingRepository _repository;

  CreateCommunicationLogUsecase(
    this._repository,
  );

  @override
  Future<Either<BaseError, GetCommunicationDetails>> execute(
      {required CreateCommunicationLogUsecaseParams params}) async {
    return await _repository.createCommunicationLog(
        communocationId: params.communocationId);
  }
}

class CreateCommunicationLogUsecaseParams extends Params {
  final String communocationId;
  CreateCommunicationLogUsecaseParams({required this.communocationId});

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
