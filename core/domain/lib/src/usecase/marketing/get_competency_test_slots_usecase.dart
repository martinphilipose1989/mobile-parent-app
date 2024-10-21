import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetCompetencyTestSlotsUsecase extends BaseUseCase<BaseError,
    GetCompetencyTestSlotsUsecaseParams, Slots> {
  final CompetencyTestRepository _competencyTestRepository;

  GetCompetencyTestSlotsUsecase(
    this._competencyTestRepository,
  );

  @override
  Future<Either<BaseError, Slots>> execute({
    required GetCompetencyTestSlotsUsecaseParams params,
  }) {
    return _competencyTestRepository.getCompetencyTestSlots(
      enquiryID: params.enquiryID, date: params.date,
    );
  }
}

class GetCompetencyTestSlotsUsecaseParams extends Params {
  final String enquiryID;
  final String date;
  GetCompetencyTestSlotsUsecaseParams({
    required this.enquiryID,
    required this.date
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}