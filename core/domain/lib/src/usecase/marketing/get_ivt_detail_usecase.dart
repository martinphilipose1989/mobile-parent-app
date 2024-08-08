import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetIvtDetailUsecase extends BaseUseCase<BaseError,
    GetIvtDetailUsecaseParams, IVTBase> {
  final EnquiryRepository _enquiryRepository;

  GetIvtDetailUsecase(
    this._enquiryRepository,
  );

  @override
  Future<Either<BaseError, IVTBase>> execute({
    required GetIvtDetailUsecaseParams params,
  }) {
    return _enquiryRepository.getIvtDetail(
      enquiryID: params.enquiryID
    );
  }
}

class GetIvtDetailUsecaseParams extends Params {
  final String enquiryID;
  GetIvtDetailUsecaseParams({
    required this.enquiryID,
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}