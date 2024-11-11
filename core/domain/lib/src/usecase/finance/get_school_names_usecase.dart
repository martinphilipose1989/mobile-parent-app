// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:domain/src/repository/finance_repository.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:domain/src/usecase/base/params.dart';
import 'package:shared/shared.dart';

class GetSchoolNamesUsecase extends BaseUseCase<BaseError,
    GetSchoolNamesUsecaseParams, SchoolNamesModel> {
  final FinanceRepository _repository;

  GetSchoolNamesUsecase(
    this._repository,
  );

  @override
  Future<Either<BaseError, SchoolNamesModel>> execute(
      {required GetSchoolNamesUsecaseParams params}) async {
    return await _repository.getSchoolNames(
      studentIds: params.studentIds,
      academicYearIds: params.academicYearIds,
    );
  }
}

class GetSchoolNamesUsecaseParams extends Params {
  final List studentIds;
  final List<int> academicYearIds;

  GetSchoolNamesUsecaseParams({
    required this.studentIds,
    required this.academicYearIds,
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
