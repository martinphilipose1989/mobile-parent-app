import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

class AdminRepositoryImpl extends AdminRepository {
  final NetworkPort networkPort;

  AdminRepositoryImpl(this.networkPort);

  @override
  Future<Either<NetworkError, FetchCouponsListModel>> getCoupons(
      {required String studentId,
      required String feeTypeIds,
      required String feeCategoryIds,
      required String feeSubCategoryIds,
      required String feeSubTypeIds,
      required String academicYrsId}) {
    return networkPort.getCoupons(
        studentId: studentId,
        feeTypeIds: feeTypeIds,
        feeCategoryIds: feeCategoryIds,
        feeSubCategoryIds: feeSubCategoryIds,
        academicYrsId: academicYrsId,
        feeSubTypeIds: feeSubTypeIds);
  }

  @override
  Future<Either<NetworkError, StudentDetailsResponseModel>> getStudentDetail(
      {required int id}) {
    // TODO: implement getStudentDetail
    return networkPort.getStudentDetail(id: id);
  }

  @override
  Future<Either<NetworkError, SendTokenResponseModel>> sendToken({required int? id, required SendTokenRequestEntity token}) {
 return networkPort.sendToken(userId: id, sendTokenRequestEntity: token);

  }

  // @override
  // Future<Either<NetworkError, SendTokenResponseModel>> sendToken({required int? id, }) {
  // return networkPort.sendToken(userId: id, sendTokenRequestEntity: SendTokenRequestEntity(tokenEntity: TokenEntity(appToken: appToken)));
  // }


}
