import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class DeleteEnquiryDocumentUsecase extends BaseUseCase<BaseError,
    DeleteEnquiryDocumentUsecaseParams, DeleteEnquiryFileBase> {
  final EnquiryRepository _enquiryRepository;

  DeleteEnquiryDocumentUsecase(
    this._enquiryRepository,
  );

  @override
  Future<Either<BaseError, DeleteEnquiryFileBase>> execute({
    required DeleteEnquiryDocumentUsecaseParams params,
  }) {
    return _enquiryRepository.deleteEnquiryDocument(
      enquiryID: params.enquiryID,documentID: params.documentID
    );
  }
}

class DeleteEnquiryDocumentUsecaseParams extends Params {
  final String enquiryID;
  final String documentID;
  DeleteEnquiryDocumentUsecaseParams({
    required this.enquiryID,
    required this.documentID
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}