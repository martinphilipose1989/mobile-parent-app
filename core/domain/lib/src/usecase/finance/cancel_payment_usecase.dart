import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class CancelPaymentUsecase
    extends BaseUseCase<BaseError, CancelPaymentUsecaseParams, dynamic> {
  final FinanceRepository _financeRepository;

  CancelPaymentUsecase({required FinanceRepository financeRepository})
      : _financeRepository = financeRepository;

  @override
  Future<Either<BaseError, dynamic>> execute(
      {required CancelPaymentUsecaseParams params}) {
    return _financeRepository.cancelPaymentRequest(
        paymentGateway: params.paymentGateway, orderId: params.orderId);
  }
}

class CancelPaymentUsecaseParams extends Params {
  final String paymentGateway;
  final String orderId;

  CancelPaymentUsecaseParams(
      {required this.paymentGateway, required this.orderId});
  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
