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
  List<int>? studentFeesId;
  String? fileType;
  String? feesType;
  List<int>? transaction;
  bool? sendMail;

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
