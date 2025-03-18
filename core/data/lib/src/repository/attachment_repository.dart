import 'package:data/data.dart';
import 'package:file_picker/file_picker.dart';

class AttachmentRepositoryImpl implements AttachmentRepository {
  final AttachmentPort attachmentPort;
  AttachmentRepositoryImpl(this.attachmentPort);
  @override
  Future<Either<BaseError, UploadFile>> pickFile(
      {UpoladFileTypeEnum? fileTypeEnum}) async {
    try {
      FileType getFileType(UpoladFileTypeEnum fileTypeEnum) {
        switch (fileTypeEnum) {
          case UpoladFileTypeEnum.image:
            return FileType.image;
          case UpoladFileTypeEnum.custom:
            return FileType.custom;
          case UpoladFileTypeEnum.any:
            return FileType.any;
          case UpoladFileTypeEnum.audio:
            return FileType.audio;
          case UpoladFileTypeEnum.media:
            return FileType.media;
          case UpoladFileTypeEnum.video:
            return FileType.video;
          case UpoladFileTypeEnum.pdf:
            return FileType.custom;
          default:
            return FileType.custom;
        }
      }

      if (fileTypeEnum == UpoladFileTypeEnum.camera) {
        UploadFile file = await attachmentPort.clickImage();
        return Right(file);
      } else if (fileTypeEnum == UpoladFileTypeEnum.image) {
        UploadFile file = await attachmentPort.pickImageFromLocal();
        return Right(file);
      } else {
        UploadFile file =
            await attachmentPort.pickFile(type: getFileType(fileTypeEnum!));
        return Right(file);
      }
    } catch (exception) {
      switch (exception.runtimeType) {
        case LocalError:
          if (exception is LocalError) {
            return Left(
              LocalError(
                cause: Exception(exception.toString()),
                message: exception.toString(),
                errorType: exception.errorType,
              ),
            );
          } else {
            return Left(
              LocalError(
                  cause: Exception(exception.toString()),
                  message: exception.toString(),
                  errorType: ErrorType.unknown),
            );
          }
        default:
          return Left(
            LocalError(
                cause: Exception(exception.toString()),
                message: exception.toString(),
                errorType: ErrorType.unknown),
          );
      }
    }
  }

  @override
  Future<Either<BaseError, UploadFile>> downloadFile(
      {required String downloadUrlPath,
      void Function(int count, int total)? onReceiveProgress}) async {
    try {
      UploadFile file = await attachmentPort.downloadFile(
          downloadUrlPath: downloadUrlPath,
          onReceiveProgress: onReceiveProgress);
      return Right(file);
    } catch (exception) {
      switch (exception.runtimeType) {
        case LocalError:
          if (exception is LocalError) {
            return Left(
              LocalError(
                cause: Exception(exception.toString()),
                message: exception.toString(),
                errorType: exception.errorType,
              ),
            );
          } else {
            return Left(
              LocalError(
                  cause: Exception(exception.toString()),
                  message: exception.toString(),
                  errorType: ErrorType.unknown),
            );
          }
        default:
          return Left(
            LocalError(
                cause: Exception(exception.toString()),
                message: exception.toString(),
                errorType: ErrorType.unknown),
          );
      }
    }
  }
}
