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
      enquiryID: params.enquiryID,documentID: params.documentID,delete: params.delete,verify: params.verifyDoc
    );
  }
}

class DeleteEnquiryDocumentUsecaseParams extends Params {
  final String enquiryID;
  final String documentID;
  final String delete;
  final String verifyDoc;
  DeleteEnquiryDocumentUsecaseParams({
    required this.enquiryID,
    required this.documentID,
    required this.delete,
    required this.verifyDoc,
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}