import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetMdmAttributeUsecase extends BaseUseCase<BaseError,
    GetMdmAttributeUsecaseParams, MdmAttributeBaseModel> {
  final EnquiryRepository _enquiryRepository;

  GetMdmAttributeUsecase(
    this._enquiryRepository,
  );

  @override
  Future<Either<BaseError, MdmAttributeBaseModel>> execute({
    required GetMdmAttributeUsecaseParams params,
  }) {
    return _enquiryRepository.getMdmAttribute(
      infoType: params.infoType,
      id: params.id
    );
  }
}

class GetMdmAttributeUsecaseParams extends Params {
  final String infoType;
  final int? id;
  GetMdmAttributeUsecaseParams({
    required this.infoType,
    this.id
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}