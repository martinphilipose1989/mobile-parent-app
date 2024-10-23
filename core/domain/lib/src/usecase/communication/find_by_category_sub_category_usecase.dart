// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:domain/src/repository/ticketing_repository.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:domain/src/usecase/base/params.dart';
import 'package:shared/shared.dart';

class FindByCategorySubCategoryUsecase extends BaseUseCase<BaseError,
    FindByCategorySubCategoryUsecaseParams, FindByCategorySubCategoryModel> {
  final TicketingRepository _repository;

  FindByCategorySubCategoryUsecase(
    this._repository,
  );

  @override
  Future<Either<BaseError, FindByCategorySubCategoryModel>> execute(
      {required FindByCategorySubCategoryUsecaseParams params}) async {
    return await _repository.findByCategorySubCategory(
        categoryId: params.categoryId, subCategoryId: params.subCategoryId);
  }
}

class FindByCategorySubCategoryUsecaseParams extends Params {
  final int categoryId;
  final int subCategoryId;

  FindByCategorySubCategoryUsecaseParams(
      {required this.categoryId, required this.subCategoryId});

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
