// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:domain/src/repository/finance_repository.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:domain/src/usecase/base/params.dart';
import 'package:shared/shared.dart';

class GetPaymentOrderUsecase extends BaseUseCase<BaseError,
    GetPaymentOrderUsecaseParams, GetPaymentOrderResponseModel> {
  final FinanceRepository _repository;

  GetPaymentOrderUsecase(
    this._repository,
  );

  @override
  Future<Either<BaseError, GetPaymentOrderResponseModel>> execute(
      {required GetPaymentOrderUsecaseParams params}) async {
    return await _repository.getPaymentOrder(
      paymentOrderModel: params.paymentOrderModel,
    );
  }
}

class GetPaymentOrderUsecaseParams extends Params {
  final PaymentOrderModel paymentOrderModel;

  GetPaymentOrderUsecaseParams({
    required this.paymentOrderModel,
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
