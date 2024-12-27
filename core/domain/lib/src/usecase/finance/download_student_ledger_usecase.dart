import 'dart:typed_data';

import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class DownloadStudentLedgerUsecase extends BaseUseCase<BaseError,
    DownloadStudentLedgerUsecaseParams, Uint8List> {
  final FinanceRepository _financeRepository;

  DownloadStudentLedgerUsecase({required FinanceRepository financeRepository})
      : _financeRepository = financeRepository;
  @override
  Future<Either<BaseError, Uint8List>> execute(
      {required DownloadStudentLedgerUsecaseParams params}) {
    return _financeRepository.downloadStudentLedger(
      body: StudentLedgerDownloadRequest(
          fileType: params.fileType,
          feesType: params.feesType,
          studentFeesId: params.studentFeesId,
          transaction: params.transaction,
          sendMail: params.sendMail),
    );
  }
}

class DownloadStudentLedgerUsecaseParams extends Params {
  final List<int>? studentFeesId;
  final String? fileType;
  final String? feesType;
  final List<int>? transaction;
  final bool? sendMail;

  DownloadStudentLedgerUsecaseParams(
      {this.studentFeesId,
      this.fileType,
      this.feesType,
      this.transaction,
      this.sendMail});

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
