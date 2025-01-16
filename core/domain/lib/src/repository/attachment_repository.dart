import 'package:domain/domain.dart';

abstract class AttachmentRepository {
  Future<Either<BaseError, UploadFile>> pickFile(
      {UpoladFileTypeEnum? fileTypeEnum});
  Future<Either<BaseError, UploadFile>> downloadFile(
      {required String downloadUrlPath,
      void Function(int, int)? onReceiveProgress});
}
