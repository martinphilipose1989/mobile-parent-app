// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:domain/src/repository/finance_repository.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:domain/src/usecase/base/params.dart';
import 'package:shared/shared.dart';

class GetStoreImageUsecase extends BaseUseCase<BaseError,
    GetStoreImageUsecaseParams, GetStoreImageModel> {
  final FinanceRepository _repository;

  GetStoreImageUsecase(
    this._repository,
  );

  @override
  Future<Either<BaseError, GetStoreImageModel>> execute(
      {required GetStoreImageUsecaseParams params}) async {
    return await _repository.setStoreImage(
        file: params.file, fileName: params.fileName);
  }
}

class GetStoreImageUsecaseParams extends Params {
  final File file;
  final String fileName;

  GetStoreImageUsecaseParams({required this.file, required this.fileName});

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
