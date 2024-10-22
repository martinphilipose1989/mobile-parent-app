import 'package:domain/domain.dart';
import 'package:domain/src/repository/mdm_repository.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class CreateCategoryUseCase extends BaseUseCase<BaseError,
    CreateCategoryUseCaseParams, MsgCategoryModel> {
  final MDMRepository _repository;

  CreateCategoryUseCase(
      this._repository,
      );

  @override
  Future<Either<BaseError, MsgCategoryModel>> execute({required CreateCategoryUseCaseParams params}) async {
    return await _repository.createCategory();
  }
}

class CreateCategoryUseCaseParams extends Params {

  CreateCategoryUseCaseParams(){}

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
