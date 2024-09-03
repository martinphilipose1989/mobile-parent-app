// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:domain/src/repository/finance_repository.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:domain/src/usecase/base/params.dart';
import 'package:shared/shared.dart';

class GetTransactionTypeFeesCollectedUsecase extends BaseUseCase<
    BaseError,
    GetTransactionTypeFeesCollectedUsecaseParams,
    GetTransactiontypefeesCollectedModel> {
  final FinanceRepository _repository;

  GetTransactionTypeFeesCollectedUsecase(
    this._repository,
  );

  @override
  Future<Either<BaseError, GetTransactiontypefeesCollectedModel>> execute(
      {required GetTransactionTypeFeesCollectedUsecaseParams params}) async {
    return await _repository.getTransactionTypeFeesCollected(
      students: params.students,
      academicYear: params.academicYear,
    );
  }
}

class GetTransactionTypeFeesCollectedUsecaseParams extends Params {
  final List<int> students;
  final List<int> academicYear;

  GetTransactionTypeFeesCollectedUsecaseParams({
    required this.students,
    required this.academicYear,
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
