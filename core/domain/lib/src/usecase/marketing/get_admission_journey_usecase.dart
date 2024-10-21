import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetAdmissionJourneyUsecase extends BaseUseCase<BaseError,
    GetAdmissionJourneyUsecaseParams, AdmissionJourneyBase> {
  final EnquiryRepository _enquiryRepository;

  GetAdmissionJourneyUsecase(
    this._enquiryRepository,
  );

  @override
  Future<Either<BaseError, AdmissionJourneyBase>> execute({
    required GetAdmissionJourneyUsecaseParams params,
  }) {
    return _enquiryRepository.getAdmissionJourney(
      enquiryID: params.enquiryID,
      type: params.type
    );
  }
}

class GetAdmissionJourneyUsecaseParams extends Params {
  final String enquiryID;
  final String type;
  GetAdmissionJourneyUsecaseParams({
    required this.enquiryID,
    required this.type
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}