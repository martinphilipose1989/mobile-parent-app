// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:domain/src/repository/finance_repository.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:domain/src/usecase/base/params.dart';
import 'package:shared/shared.dart';

class GetTransactionTypeUsecase extends BaseUseCase<BaseError,
    GetTransactionTypeUsecaseParams, GetTransactionTypeModel> {
  final FinanceRepository _repository;

  GetTransactionTypeUsecase(
    this._repository,
  );

  @override
  Future<Either<BaseError, GetTransactionTypeModel>> execute(
      {required GetTransactionTypeUsecaseParams params}) async {
    return await _repository.getTransactionType(id: params.id);
  }
}

class GetTransactionTypeUsecaseParams extends Params {
  final int id;

  GetTransactionTypeUsecaseParams({
    required this.id,
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
