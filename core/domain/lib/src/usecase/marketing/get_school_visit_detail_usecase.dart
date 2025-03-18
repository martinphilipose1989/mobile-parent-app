import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetSchoolVisitDetailUseCase extends BaseUseCase<BaseError,
    GetSchoolVisitDetailUseCaseParams, SchoolVisitDetailBase> {
  final SchoolVisitRepository _schoolVisitRrepository;

  GetSchoolVisitDetailUseCase(
    this._schoolVisitRrepository,
  );

  @override
  Future<Either<BaseError, SchoolVisitDetailBase>> execute({
    required GetSchoolVisitDetailUseCaseParams params,
  }) {
    return _schoolVisitRrepository.getSchoolVisitDetail(
      enquiryID: params.enquiryID
    );
  }
}

class GetSchoolVisitDetailUseCaseParams extends Params {
  final String enquiryID;
  GetSchoolVisitDetailUseCaseParams({
    required this.enquiryID
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}