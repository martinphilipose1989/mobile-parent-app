// // ignore_for_file: implementation_imports
// import 'package:domain/domain.dart';
// import 'package:domain/src/usecase/base/base_usecase.dart';

// class ClickFileUsecase
//     extends BaseUseCase<BaseError, ClickFileUsecaseParams, UploadFile> {
//   final AttachmentRepository _attachmentRepository;
//   ClickFileUsecase({required AttachmentRepository attachmentRepository})
//       : _attachmentRepository = attachmentRepository;
//   @override
//   Future<Either<BaseError, UploadFile>> execute(
//       {required ClickFileUsecaseParams params}) {
//     return _attachmentRepository.clickImage(fileTypeEnum: params.fileTypeEnum);
//   }
// }

// class ClickFileUsecaseParams extends Params {
//   final UpoladFileTypeEnum? fileTypeEnum;
//   ClickFileUsecaseParams({this.fileTypeEnum});
//   @override
//   Either<AppError, bool> verify() {
//     return Right(true);
//   }
// }
