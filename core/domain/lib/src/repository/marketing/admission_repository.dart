import 'package:domain/domain.dart';

abstract class AdmissionRepository{
  Future<Either<NetworkError,AdmissionListBaseModel>> getAdmissionList({required String phone,required int pageNumber,int pageSize = 10});
}