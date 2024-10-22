import 'package:domain/domain.dart';
import 'package:domain/src/repository/mdm_repository.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class CreateSubCategoryUseCase extends BaseUseCase<BaseError,
    CreateSubCategoryUseCaseParams, MsgSubCategoryModel> {
  final MDMRepository _repository;

  CreateSubCategoryUseCase(
      this._repository,
      );

  @override
  Future<Either<BaseError, MsgSubCategoryModel>> execute({required CreateSubCategoryUseCaseParams params}) async {
    return await _repository.createSubCategory();
  }
}

class CreateSubCategoryUseCaseParams extends Params {

  CreateSubCategoryUseCaseParams(){}

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
