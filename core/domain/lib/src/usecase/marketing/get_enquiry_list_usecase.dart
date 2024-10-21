import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetEnquiryListUsecase extends BaseUseCase<BaseError,
    GetEnquiryListUsecaseParams, EnquiryListModel> {
  final EnquiryRepository _enquiryRepository;

  GetEnquiryListUsecase(
    this._enquiryRepository,
  );

  @override
  Future<Either<BaseError, EnquiryListModel>> execute({
    required GetEnquiryListUsecaseParams params,
  }) {
    return _enquiryRepository.getEnquiryList(
      pageNumber: params.pageNumber,
      pageSize: params.pageSize??10,
      phone: params.phone
    );
  }
}

class GetEnquiryListUsecaseParams extends Params {
  final String phone; final int pageNumber; final int? pageSize;
  GetEnquiryListUsecaseParams({
    required this.phone,
    required this.pageNumber,
    this.pageSize
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}