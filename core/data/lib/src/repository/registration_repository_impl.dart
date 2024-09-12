import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

class RegistrationRepositoryImpl extends RegistrationRepository {
  final NetworkPort _networkPort;

  RegistrationRepositoryImpl(this._networkPort);

  @override
  Future<Either<NetworkError, SingleResponse>> getRegistrationDetail({required String enquiryID, required String infoType}) {
    return _networkPort.getRegistrationDetail(enquiryID: enquiryID, infoType: infoType);
  }
  
  @override
  Future<Either<NetworkError, SingleResponse>> updateParentDetails({required String enquiryID, required ParentInfoEntity parentInfo}){
    return _networkPort.updateParentDetails(enquiryID: enquiryID, parentInfo: parentInfo);
  }

  @override
  Future<Either<NetworkError, SingleResponse>> updateContactDetails({required String enquiryID, required ContactDetailsEntity contactDetails}){
    return _networkPort.updateContactDetails(enquiryID: enquiryID, contactDetails: contactDetails);
  }

  @override
  Future<Either<NetworkError, SingleResponse>> updateMedicalDetails({required String enquiryID, required MedicalDetailsEntity medicalDetails}){
    return _networkPort.updateMedicalDetails(enquiryID: enquiryID, medicalDetails: medicalDetails);
  }

  @override
  Future<Either<NetworkError, SingleResponse>> updateBankDetails({required String enquiryID, required  BankDetailsEntity bankDetails}){
    return _networkPort.updateBankDetails(enquiryID: enquiryID, bankDetails: bankDetails);
  }

  @override
  Future<Either<NetworkError, SiblingProfileResponse>> getSiblingDetail({required GetSiblingDetailRequest getSiblingDetailRequest}){
    return _networkPort.getSiblingDetail(getSiblingDetailRequest: getSiblingDetailRequest);
  }

  @override
  Future<Either<NetworkError, SubjectDetailResponse>> selectOptionalSubject({required List<SubjectSelectionRequest> subjectSelectionRequest,required String enquiryID}){
    return _networkPort.selectOptionalSubject(subjectSelectionRequest: subjectSelectionRequest,enquiryID: enquiryID);
  }
}