import 'package:domain/domain.dart';

abstract class MDMRepository {
  Future<Either<BaseError, MsgCategoryModel>> createCategory();
  Future<Either<BaseError, MsgSubCategoryModel>> createSubCategory();
}
