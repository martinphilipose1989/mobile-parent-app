import 'dart:typed_data';

import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class DownloadTransactionHistoryUsecase extends BaseUseCase<BaseError,
    DownloadTransactionHistoryParams, Uint8List> {
  final FinanceRepository _financeRepository;

  DownloadTransactionHistoryUsecase(
      {required FinanceRepository financeRepository})
      : _financeRepository = financeRepository;

  @override
  Future<Either<BaseError, Uint8List>> execute(
      {required DownloadTransactionHistoryParams params}) {
    return _financeRepository.downloadTransactionHistory(
        fileType: params.fileType, id: params.id);
  }
}

class DownloadTransactionHistoryParams extends Params {
  final String fileType;
  final String id;

  DownloadTransactionHistoryParams({required this.fileType, required this.id});
  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
