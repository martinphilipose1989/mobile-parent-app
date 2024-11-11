import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class MoveToNextStageUsecase extends BaseUseCase<NetworkError,
    MoveToNextStageUsecaseParams, MoveToNextStageEnquiryResponse> {
  final EnquiryRepository enquiryRepository;

  MoveToNextStageUsecase({required this.enquiryRepository});

  @override
  Future<Either<NetworkError, MoveToNextStageEnquiryResponse>> execute(
      {required MoveToNextStageUsecaseParams params}) {
    return enquiryRepository.moveToNextStageEnquiry(
        enquiryId: params.enquiryId);
  }
}

class MoveToNextStageUsecaseParams extends Params {
  final String enquiryId;

  MoveToNextStageUsecaseParams({required this.enquiryId});

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
