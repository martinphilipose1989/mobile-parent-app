import 'package:data/data.dart';
import 'package:domain/domain.dart';

class AdmissionRepositoryImpl{
  final NetworkPort _networkPort;

  AdmissionRepositoryImpl(this._networkPort);

  Future<Either<NetworkError,AdmissionListBaseModel>> getAdmissionList({required String phone,required int pageNumber,int pageSize = 10}){
    return _networkPort.getAdmissionList(phone: phone, pageNumber: pageNumber,pageSize: pageSize);
  }
}