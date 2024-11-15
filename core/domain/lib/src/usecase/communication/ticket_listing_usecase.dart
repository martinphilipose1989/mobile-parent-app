// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:domain/src/repository/ticketing_repository.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:domain/src/usecase/base/params.dart';
import 'package:shared/shared.dart';

class TicketListingUsecase extends BaseUseCase<BaseError,
    TicketListingUsecaseParams, CommunicationListModel> {
  final TicketingRepository _repository;

  TicketListingUsecase(
    this._repository,
  );

  @override
  Future<Either<BaseError, CommunicationListModel>> execute(
      {required TicketListingUsecaseParams params}) async {
    return await _repository.getTicketsList(
        pageSize: params.pageSize, page: params.page);
  }
}

class TicketListingUsecaseParams extends Params {
  final int pageSize;
  final int page;

  TicketListingUsecaseParams({required this.page, required this.pageSize});

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
