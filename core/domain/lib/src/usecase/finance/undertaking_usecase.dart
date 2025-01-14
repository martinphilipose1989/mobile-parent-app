import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class UndertakingUsecase extends BaseUseCase<BaseError,
    UndertakingUsecaseParams, UndertakingResponse> {
  final FinanceRepository _financeRepository;

  UndertakingUsecase({required FinanceRepository financeRepository})
      : _financeRepository = financeRepository;

  @override
  Future<Either<BaseError, UndertakingResponse>> execute(
      {required UndertakingUsecaseParams params}) {
    return _financeRepository.underTakingStudent(
        body: UndertakingRequest(
            isUndertakingTaken: params.isUnderTakingTaken,
            studentYearlyId: params.studentYearlyId));
  }
}

class UndertakingUsecaseParams extends Params {
  final int studentYearlyId;
  final bool isUnderTakingTaken;

  UndertakingUsecaseParams(
      {required this.studentYearlyId, required this.isUnderTakingTaken});

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
