// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:domain/src/repository/finance_repository.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:domain/src/usecase/base/params.dart';
import 'package:shared/shared.dart';

class GetPaymentStatusUsecase extends BaseUseCase<BaseError,
    GetPaymentStatusUsecaseParams, GetPaymentStatusModel> {
  final FinanceRepository _repository;

  GetPaymentStatusUsecase(
    this._repository,
  );

  @override
  Future<Either<BaseError, GetPaymentStatusModel>> execute(
      {required GetPaymentStatusUsecaseParams params}) async {
    return await _repository.getPaymentStatus(
      orderId: params.orderId,
    );
  }
}

class GetPaymentStatusUsecaseParams extends Params {
  final String orderId;

  GetPaymentStatusUsecaseParams({
    required this.orderId,
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
