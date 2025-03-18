import 'dart:io';

import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class UploadEnquiryDocumentUsecase extends BaseUseCase<BaseError,
    UploadEnquiryDocumentUsecaseParams, EnquiryFileUploadBase> {
  final EnquiryRepository _enquiryRepository;

  UploadEnquiryDocumentUsecase(
    this._enquiryRepository,
  );

  @override
  Future<Either<BaseError, EnquiryFileUploadBase>> execute({
    required UploadEnquiryDocumentUsecaseParams params,
  }) {
    return _enquiryRepository.uploadEnquiryDocument(
      enquiryID: params.enquiryID,documentID: params.documentID,file: params.file
    );
  }
}

class UploadEnquiryDocumentUsecaseParams extends Params {
  final String enquiryID;
  final String documentID;
  final File file;
  UploadEnquiryDocumentUsecaseParams({
    required this.enquiryID,
    required this.documentID,
    required this.file
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}