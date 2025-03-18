import 'dart:typed_data';

import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class DownloadFeeTypeUsecase
    extends BaseUseCase<BaseError, DownloadFeeTypeUsecaseParams, Uint8List> {
  final FinanceRepository _financeRepository;

  DownloadFeeTypeUsecase({required FinanceRepository financeRepository})
      : _financeRepository = financeRepository;
  @override
  Future<Either<BaseError, Uint8List>> execute(
      {required DownloadFeeTypeUsecaseParams params}) {
    return _financeRepository.downloadFeeTypeTransactions(
        urlKey: params.urlKey);
  }
}

class DownloadFeeTypeUsecaseParams extends Params {
  final String urlKey;

  DownloadFeeTypeUsecaseParams({required this.urlKey});

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
