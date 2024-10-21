import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetNewAdmissionDetailUseCase extends BaseUseCase<BaseError,
    GetNewAdmissionDetailUseCaseParams, NewAdmissionBase> {
  final EnquiryRepository _enquiryRepository;

  GetNewAdmissionDetailUseCase(
    this._enquiryRepository,
  );

  @override
  Future<Either<BaseError, NewAdmissionBase>> execute({
    required GetNewAdmissionDetailUseCaseParams params,
  }) {
    return _enquiryRepository.getNewAdmissionDetail(
      enquiryID: params.enquiryID
    );
  }
}

class GetNewAdmissionDetailUseCaseParams extends Params {
  final String enquiryID;
  GetNewAdmissionDetailUseCaseParams({
    required this.enquiryID,
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}