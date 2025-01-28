import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class DownloadFileFromUrlUsecase extends BaseUseCase<BaseError,
    DownloadFileFromUrlUsecaseParams, UploadFile> {
  final AttachmentRepository _attachmentRepository;

  DownloadFileFromUrlUsecase(
      {required AttachmentRepository attachmentRepository})
      : _attachmentRepository = attachmentRepository;
  @override
  Future<Either<BaseError, UploadFile>> execute(
      {required DownloadFileFromUrlUsecaseParams params}) {
    return _attachmentRepository.downloadFile(
        downloadUrlPath: params.urlPath,
        onReceiveProgress: params.onReceiveProgress);
  }
}

class DownloadFileFromUrlUsecaseParams extends Params {
  final String urlPath;
  final void Function(int, int)? onReceiveProgress;

  DownloadFileFromUrlUsecaseParams(
      {required this.urlPath, this.onReceiveProgress});

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
