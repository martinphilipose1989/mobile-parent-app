import 'package:dartz/dartz.dart';
import 'package:domain/src/repository/finance_repository.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:domain/src/usecase/base/params.dart';
import 'package:shared/shared.dart';

class GetTokenGeneratorUsecase extends BaseUseCase<BaseError,
    GetTokenGeneratorUsecaseParams, GetTokenGeneratorModel> {
  final FinanceRepository _repository;

  GetTokenGeneratorUsecase(
    this._repository,
  );

  @override
  Future<Either<BaseError, GetTokenGeneratorModel>> execute(
      {required GetTokenGeneratorUsecaseParams params}) async {
    return await _repository.getTokenGenerator(
        segmentLobId: params.segmentLobId);
  }
}

class GetTokenGeneratorUsecaseParams extends Params {
  final int segmentLobId;

  GetTokenGeneratorUsecaseParams({required this.segmentLobId});

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
