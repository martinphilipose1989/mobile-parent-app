import 'package:dartz/dartz.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:shared/shared.dart';

abstract class AdminRepository {
  Future<Either<NetworkError, FetchCouponsListModel>> getCoupons(
      {required String studentId,
      required String feeTypeIds,
      required String feeCategoryIds,
      required String feeSubCategoryIds,
      required String feeSubTypeIds,
      required String academicYrsId});

  Future<Either<NetworkError, StudentDetailsResponseModel>> getStudentDetail(
      {required int id});

  Future<Either<NetworkError, SendTokenResponseModel>> sendToken(
      {required int? id,required SendTokenRequestEntity token });

}
