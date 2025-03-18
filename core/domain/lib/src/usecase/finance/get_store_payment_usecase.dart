// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:domain/src/repository/finance_repository.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:domain/src/usecase/base/params.dart';
import 'package:shared/shared.dart';

class GetStorePaymentUsecase extends BaseUseCase<BaseError,
    GetStorePaymentUsecaseParams, GetStorePaymentModel> {
  final FinanceRepository _repository;

  GetStorePaymentUsecase(
    this._repository,
  );

  @override
  Future<Either<BaseError, GetStorePaymentModel>> execute(
      {required GetStorePaymentUsecaseParams params}) async {
    return await _repository.getStorePayment(
      storePaymentModelRequest: params.storePaymentModelRequest,
    );
  }
}



class GetStorePaymentUsecaseParams extends Params {
  final StorePaymentModelRequest storePaymentModelRequest;

  GetStorePaymentUsecaseParams({
    required this.storePaymentModelRequest,
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
