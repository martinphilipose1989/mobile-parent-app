import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class DownloadEnquiryDocumentUsecase extends BaseUseCase<BaseError,
    DownloadEnquiryDocumentUsecaseParams, DownloadEnquiryFileBase> {
  final EnquiryRepository _enquiryRepository;

  DownloadEnquiryDocumentUsecase(
    this._enquiryRepository,
  );

  @override
  Future<Either<BaseError, DownloadEnquiryFileBase>> execute({
    required DownloadEnquiryDocumentUsecaseParams params,
  }) {
    return _enquiryRepository.downloadEnquiryDocument(
      enquiryID: params.enquiryID,documentID: params.documentID,download: params.download
    );
  }
}

class DownloadEnquiryDocumentUsecaseParams extends Params {
  final String enquiryID;
  final String documentID;
  final String download;
  DownloadEnquiryDocumentUsecaseParams({
    required this.enquiryID,
    required this.documentID,
    required this.download
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}