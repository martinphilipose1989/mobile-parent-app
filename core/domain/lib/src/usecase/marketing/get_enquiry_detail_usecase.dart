import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetEnquiryDetailUseCase extends BaseUseCase<BaseError,
    GetEnquiryDetailUseCaseParams, EnquiryDetailBase> {
  final EnquiryRepository _enquiryRepository;

  GetEnquiryDetailUseCase(
    this._enquiryRepository,
  );

  @override
  Future<Either<BaseError, EnquiryDetailBase>> execute({
    required GetEnquiryDetailUseCaseParams params,
  }) {
    return _enquiryRepository.getEnquiryDetail(
      enquiryID: params.enquiryID
    );
  }
}

class GetEnquiryDetailUseCaseParams extends Params {
  final String enquiryID;
  GetEnquiryDetailUseCaseParams({
    required this.enquiryID
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}