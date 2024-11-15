// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class CreateTicketUsecase extends BaseUseCase<BaseError,
    CreateTicketUsecaseParams, CreateTicketModel> {
  final TicketingRepository _repository;

  CreateTicketUsecase(
    this._repository,
  );

  @override
  Future<Either<BaseError, CreateTicketModel>> execute(
      {required CreateTicketUsecaseParams params}) async {
    return await _repository.createTicket(
        createTicketRequest: params.createTicketRequest);
  }
}

class CreateTicketUsecaseParams extends Params {
  final CreateTicketRequest createTicketRequest;
  CreateTicketUsecaseParams({
    required this.createTicketRequest,
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
