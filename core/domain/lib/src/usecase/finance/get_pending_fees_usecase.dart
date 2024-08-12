// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:domain/src/repository/finance_repository.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:domain/src/usecase/base/params.dart';
import 'package:shared/shared.dart';

class GetPendingFeesUsecase extends BaseUseCase<BaseError,
    GetPendingFeesUsecaseParams, GetPendingFeesModel> {
  final FinanceRepository _repository;

  GetPendingFeesUsecase(
    this._repository,
  );

  @override
  Future<Either<BaseError, GetPendingFeesModel>> execute(
      {required GetPendingFeesUsecaseParams params}) async {
    return await _repository.getPendingFees(
        type: params.type,
        students: params.students,
        academicYear: params.academicYear,
        applicableTo: params.applicableTo);
  }
}

class GetPendingFeesUsecaseParams extends Params {
  final String type;
  final List<int> students;
  final List<int> academicYear;
  final int applicableTo;

  GetPendingFeesUsecaseParams({
    required this.type,
    required this.students,
    required this.academicYear,
    required this.applicableTo,
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
