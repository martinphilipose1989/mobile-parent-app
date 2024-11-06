import 'package:dartz/dartz.dart';
import 'package:domain/src/repository/finance_repository.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:domain/src/usecase/base/params.dart';
import 'package:shared/shared.dart';

class GetValidatePayNowUseCase extends BaseUseCase<BaseError,
    GetValidatePayNowUseCaseParams, GetValidateOnPayModel> {
  final FinanceRepository _repository;

  GetValidatePayNowUseCase(
    this._repository,
  );

  @override
  Future<Either<BaseError, GetValidateOnPayModel>> execute(
      {required GetValidatePayNowUseCaseParams params}) async {
    return await _repository.getValidatePayNow(
        paymentMode: params.paymentMode, studentFeeIds: params.studentFeeIds);
  }
}

class GetValidatePayNowUseCaseParams extends Params {
  final int paymentMode;
  final List studentFeeIds;

  GetValidatePayNowUseCaseParams(
      {required this.paymentMode, required this.studentFeeIds});

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
