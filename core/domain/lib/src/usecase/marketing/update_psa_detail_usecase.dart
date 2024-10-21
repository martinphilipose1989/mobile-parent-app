import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:network_retrofit/network_retrofit.dart';

class UpdatePsaDetailUsecase extends BaseUseCase<BaseError,
    UpdatePsaDetailUsecaseParams, PsaResponse> {
  final EnquiryRepository _enquiryRepository;

  UpdatePsaDetailUsecase(
    this._enquiryRepository,
  );

  @override
  Future<Either<BaseError, PsaResponse>> execute({
    required UpdatePsaDetailUsecaseParams params,
  }) {
    return _enquiryRepository.updatePsaDetail(
      enquiryID: params.enquiryID,
      psaDetail: params.psaDetail
    );
  }
}

class UpdatePsaDetailUsecaseParams extends Params {
  final String enquiryID;
  final PsaDetailResponseEntity psaDetail;
  UpdatePsaDetailUsecaseParams({
    required this.enquiryID,
    required this.psaDetail
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}