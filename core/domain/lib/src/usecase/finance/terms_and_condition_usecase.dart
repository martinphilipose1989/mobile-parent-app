import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class TermsAndConditionUsecase extends BaseUseCase<BaseError,
    TermsAndConditionUsecaseParams, TermsAndConditionsFile> {
  final FinanceRepository financeRepository;

  TermsAndConditionUsecase({required this.financeRepository});

  @override
  Future<Either<BaseError, TermsAndConditionsFile>> execute(
      {required TermsAndConditionUsecaseParams params}) {
    return financeRepository.getTermsAndConditionFile(url: params.url);
  }
}

class TermsAndConditionUsecaseParams extends Params {
  final String url;

  TermsAndConditionUsecaseParams({super.reloading, required this.url});
  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
