import 'package:dartz/dartz.dart';
import 'package:domain/src/repository/finance_repository.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:domain/src/usecase/base/params.dart';
import 'package:shared/shared.dart';

class GetGuardianStudentDetailsUsecase extends BaseUseCase<BaseError,
    GetGuardianStudentDetailsUsecaseParams, GetGuardianStudentDetailsModel> {
  final FinanceRepository _repository;

  GetGuardianStudentDetailsUsecase(
    this._repository,
  );

  @override
  Future<Either<BaseError, GetGuardianStudentDetailsModel>> execute(
      {required GetGuardianStudentDetailsUsecaseParams params}) async {
    return await _repository.getGuardianStudentDetails(
      mobileNo: params.mobileNo,
    );
  }
}

class GetGuardianStudentDetailsUsecaseParams extends Params {
  final int mobileNo;

  GetGuardianStudentDetailsUsecaseParams({
    required this.mobileNo,
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
