import 'package:dartz/dartz.dart';
import 'package:shared/shared.dart';

abstract class AdminRepository {
  Future<Either<NetworkError, FetchCouponsListModel>> getCoupons(
      {required String studentId,
      required String feeTypeIds,
      required String feeCategoryIds,
      required String feeSubCategoryIds});
}
