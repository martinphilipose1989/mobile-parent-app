import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetPsaDetailUsecase extends BaseUseCase<BaseError,
    GetPsaDetailUsecaseParams, PsaResponse> {
  final EnquiryRepository _enquiryRepository;

  GetPsaDetailUsecase(
    this._enquiryRepository,
  );

  @override
  Future<Either<BaseError, PsaResponse>> execute({
    required GetPsaDetailUsecaseParams params,
  }) {
    return _enquiryRepository.getPsaDetail(
      enquiryID: params.enquiryID
    );
  }
}

class GetPsaDetailUsecaseParams extends Params {
  final String enquiryID;
  GetPsaDetailUsecaseParams({
    required this.enquiryID,
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}