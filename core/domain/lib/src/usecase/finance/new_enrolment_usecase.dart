import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class NewEnrolmentUsecase extends BaseUseCase<BaseError,
    NewEnrolmentUsecaseParams, NewEnrolmentResponse> {
  final FinanceRepository financeRepository;

  NewEnrolmentUsecase({required this.financeRepository});

  @override
  Future<Either<BaseError, NewEnrolmentResponse>> execute(
      {required NewEnrolmentUsecaseParams params}) {
    return financeRepository.createNewEnrolment(
        newEnrolmentCreate:
            NewEnrolmentCreate(studentFees: params.studentFees));
  }
}

class NewEnrolmentUsecaseParams extends Params {
  final List<StudentEnrolmentFee>? studentFees;

  NewEnrolmentUsecaseParams({required this.studentFees});

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
