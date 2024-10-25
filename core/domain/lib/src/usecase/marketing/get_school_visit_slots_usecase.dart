import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetSchoolVisitSlotsUsecase extends BaseUseCase<BaseError,
    GetSchoolVisitSlotsUsecaseParams, Slots> {
  final SchoolVisitRepository _schoolVisitRepository;

  GetSchoolVisitSlotsUsecase(
    this._schoolVisitRepository,
  );

  @override
  Future<Either<BaseError, Slots>> execute({
    required GetSchoolVisitSlotsUsecaseParams params,
  }) {
    return _schoolVisitRepository.getSchoolVisitSlots(
      enquiryID: params.enquiryID, date: params.date,
      
    );
  }
}

class GetSchoolVisitSlotsUsecaseParams extends Params {
  final String enquiryID;
  final String date;
  GetSchoolVisitSlotsUsecaseParams({
    required this.enquiryID,
    required this.date
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}