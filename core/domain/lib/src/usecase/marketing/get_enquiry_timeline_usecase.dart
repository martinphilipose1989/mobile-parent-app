import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetEnquiryTimeLineUseCase extends BaseUseCase<BaseError,
    GetEnquiryTimelineUseCaseParams, EnquiryTimeLineBase> {
  final EnquiryRepository _enquiryRepository;

  GetEnquiryTimeLineUseCase(
    this._enquiryRepository,
  );

  @override
  Future<Either<BaseError, EnquiryTimeLineBase>> execute({
    required GetEnquiryTimelineUseCaseParams params,
  }) {
    return _enquiryRepository.getEnquiryTimeline(
      enquiryID: params.enquiryID
    );
  }
}

class GetEnquiryTimelineUseCaseParams extends Params {
  final String enquiryID;
  GetEnquiryTimelineUseCaseParams({
    required this.enquiryID
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}