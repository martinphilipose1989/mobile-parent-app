import 'package:dartz/dartz.dart';
import 'package:domain/src/repository/finance_repository.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:domain/src/usecase/base/params.dart';
import 'package:shared/shared.dart';

class GetAcademicYearUsecase extends BaseUseCase<BaseError,
    GetAcademicYearUsecaseParams, GetAcademicYearModel> {
  final FinanceRepository _repository;

  GetAcademicYearUsecase(
    this._repository,
  );

  @override
  Future<Either<BaseError, GetAcademicYearModel>> execute(
      {required GetAcademicYearUsecaseParams params}) async {
    return await _repository.getAcademicYear(
        type: params.type, students: params.students);
  }
}

class GetAcademicYearUsecaseParams extends Params {
  final String type;
  final List students;

  GetAcademicYearUsecaseParams({
    required this.type,
    required this.students,
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
