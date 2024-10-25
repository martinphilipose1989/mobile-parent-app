import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:network_retrofit/network_retrofit.dart';

class UpdateNewAdmissionUsecase extends BaseUseCase<BaseError,
    UpdateNewAdmissionUsecaseUseCaseParams, NewAdmissionBase> {
  final EnquiryRepository _enquiryRepository;

  UpdateNewAdmissionUsecase(
    this._enquiryRepository,
  );

  @override
  Future<Either<BaseError, NewAdmissionBase>> execute({
    required UpdateNewAdmissionUsecaseUseCaseParams params,
  }) {
    return _enquiryRepository.updateNewAdmissionDetail(
      enquiryID: params.enquiryID,
      newAdmissionDetail: params.newAdmissionDetail
    );
  }
}

class UpdateNewAdmissionUsecaseUseCaseParams extends Params {
  final String enquiryID;
  final NewAdmissionDetailEntity newAdmissionDetail;
  UpdateNewAdmissionUsecaseUseCaseParams({
    required this.enquiryID,
    required this.newAdmissionDetail
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}