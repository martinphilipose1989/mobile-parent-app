import 'package:domain/domain.dart';

abstract class AttachmentRepository {
  Future<Either<BaseError, UploadFile>> pickFile(
      {UpoladFileTypeEnum? fileTypeEnum});
}
