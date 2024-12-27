import 'dart:typed_data';

import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class DownloadFileUsecase
    extends BaseUseCase<BaseError, DownloadFileUsecaseParams, Uint8List> {
  final EnquiryRepository _enquiryRepository;

  DownloadFileUsecase(this._enquiryRepository);

  @override
  Future<Either<BaseError, Uint8List>> execute({
    required DownloadFileUsecaseParams params,
  }) {
    return _enquiryRepository.downloadFile(fileUrl: params.fileUrl);
  }
}

class DownloadFileUsecaseParams extends Params {
  final String fileUrl;
  DownloadFileUsecaseParams({required this.fileUrl});

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
