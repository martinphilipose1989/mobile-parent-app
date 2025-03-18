import 'package:domain/domain.dart';

abstract class MDMRepository {
  Future<Either<BaseError, MsgCategoryModel>> createCategory();
  Future<Either<BaseError, MsgSubCategoryModel>> createSubCategory();
  Future<Either<NetworkError, MdmAttributeBaseModel>> getStudentYearlyDetails(
      {required int studentId, required int year});
}
