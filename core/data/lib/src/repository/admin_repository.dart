import 'package:data/data.dart';

class AdminRepositoryImpl extends AdminRepository {
  final NetworkPort networkPort;

  AdminRepositoryImpl(this.networkPort);

  @override
  Future<Either<NetworkError, FetchCouponsListModel>> getCoupons(
      {required String studentId,
      required String feeTypeIds,
      required String feeCategoryIds,
      required String feeSubCategoryIds}) {
    return networkPort.getCoupons(
        studentId: studentId,
        feeTypeIds: feeTypeIds,
        feeCategoryIds: feeCategoryIds,
        feeSubCategoryIds: feeSubCategoryIds);
  }

  @override
  Future<Either<NetworkError, StudentDetailsResponseModel>> getStudentDetail({required int id}) {
    // TODO: implement getStudentDetail
  return networkPort.getStudentDetail(id: id);
  }
}
