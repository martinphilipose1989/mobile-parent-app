// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class CreateNewCommunicationUsecase extends BaseUseCase<BaseError,
    CreateNewCommunicationUsecaseParams, CreateCommunicationModel> {
  final TicketingRepository _repository;

  CreateNewCommunicationUsecase(
    this._repository,
  );

  @override
  Future<Either<BaseError, CreateCommunicationModel>> execute(
      {required CreateNewCommunicationUsecaseParams params}) async {
    return await _repository.createCommunication();
  }
}

class CreateNewCommunicationUsecaseParams extends Params {
  CreateNewCommunicationUsecaseParams();

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
