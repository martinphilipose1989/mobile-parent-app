// ignore_for_file: implementation_imports
import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class ChooseFileUseCase
    extends BaseUseCase<BaseError, ChooseFileUseCaseParams, UploadFile> {
  final AttachmentRepository _attachmentRepository;
  ChooseFileUseCase({required AttachmentRepository attachmentRepository})
      : _attachmentRepository = attachmentRepository;
  @override
  Future<Either<BaseError, UploadFile>> execute(
      {required ChooseFileUseCaseParams params}) {
    return _attachmentRepository.pickFile(fileTypeEnum: params.fileTypeEnum);
  }
}

class ChooseFileUseCaseParams extends Params {
  final UpoladFileTypeEnum? fileTypeEnum;
  ChooseFileUseCaseParams({this.fileTypeEnum});
  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
