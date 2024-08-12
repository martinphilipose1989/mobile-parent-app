import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:network_retrofit/network_retrofit.dart';

class RegistrationRepositoryImpl extends RegistrationRepository {
  final NetworkPort _networkPort;

  RegistrationRepositoryImpl(this._networkPort);

  @override
  Future<Either<NetworkError, BaseInfo<T>>> getRegistrationDetail<T>({required String enquiryID, required String infoType}) {
    return _networkPort.getRegistrationDetail<T>(enquiryID: enquiryID, infoType: infoType);
  }
  
  @override
  Future<Either<NetworkError, BaseInfo<T>>> updateParentDetails<T>({required String enquiryID, required ParentInfoEntity parentInfo}){
    return _networkPort.updateParentDetails(enquiryID: enquiryID, parentInfo: parentInfo);
  }

  @override
  Future<Either<NetworkError, BaseInfo<T>>> updateContactDetails<T>({required String enquiryID, required ContactDetailsEntity contactDetails}){
    return _networkPort.updateContactDetails(enquiryID: enquiryID, contactDetails: contactDetails);
  }

  @override
  Future<Either<NetworkError, BaseInfo<T>>> updateMedicalDetails<T>({required String enquiryID, required MedicalDetailsEntity medicalDetails}){
    return _networkPort.updateMedicalDetails(enquiryID: enquiryID, medicalDetails: medicalDetails);
  }

  @override
  Future<Either<NetworkError, BaseInfo<T>>> updateBankDetails<T>({required String enquiryID, required  BankDetailsEntity bankDetails}){
    return _networkPort.updateBankDetails(enquiryID: enquiryID, bankDetails: bankDetails);
  }
}