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
      enquiryID: params.enquiryID,documentID: params.documentID
    );
  }
}

class DownloadEnquiryDocumentUsecaseParams extends Params {
  final String enquiryID;
  final String documentID;
  DownloadEnquiryDocumentUsecaseParams({
    required this.enquiryID,
    required this.documentID
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}