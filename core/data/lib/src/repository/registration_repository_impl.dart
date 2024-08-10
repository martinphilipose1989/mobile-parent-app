import 'package:data/data.dart';
import 'package:domain/domain.dart';

class RegistrationRepositoryImpl extends RegistrationRepository {
  final NetworkPort _networkPort;

  RegistrationRepositoryImpl(this._networkPort);

  @override
  Future<Either<NetworkError, BaseInfo<T>>> getRegistrationDetail<T>({required String enquiryID, required String infoType}) {
    return _networkPort.getRegistrationDetail<T>(enquiryID: enquiryID, infoType: infoType);
  }
}