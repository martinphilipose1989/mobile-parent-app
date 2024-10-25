import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:network_retrofit/network_retrofit.dart';

class UpdateIvtDetailUsecase extends BaseUseCase<BaseError,
    UpdateIvtDetailUsecaseParams, IVTBase> {
  final EnquiryRepository _enquiryRepository;

  UpdateIvtDetailUsecase(
    this._enquiryRepository,
  );

  @override
  Future<Either<BaseError, IVTBase>> execute({
    required UpdateIvtDetailUsecaseParams params,
  }) {
    return _enquiryRepository.updateIvtDetail(
      enquiryID: params.enquiryID,
      ivtDetails: params.ivtDetail
    );
  }
}

class UpdateIvtDetailUsecaseParams extends Params {
  final String enquiryID;
  final IvtDetailResponseEntity ivtDetail;
  UpdateIvtDetailUsecaseParams({
    required this.enquiryID,
    required this.ivtDetail,
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}