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
      phone: params.phone,
      status: params.status
    );
  }
}

class GetEnquiryListUsecaseParams extends Params {
  final String phone; final int pageNumber; final int? pageSize;
  final String status;
  GetEnquiryListUsecaseParams({
    required this.phone,
    required this.pageNumber,
    this.pageSize,
    required this.status
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}