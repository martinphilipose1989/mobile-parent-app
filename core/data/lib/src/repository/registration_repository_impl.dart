import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

class RegistrationRepositoryImpl extends RegistrationRepository {
  final NetworkPort _networkPort;

  RegistrationRepositoryImpl(this._networkPort);

  @override
  Future<Either<NetworkError, SingleResponse>> getRegistrationDetail(
      {required String enquiryID, required String infoType}) {
    return _networkPort.getRegistrationDetail(
        enquiryID: enquiryID, infoType: infoType);
  }

  @override
  Future<Either<NetworkError, SingleResponse>> updateParentDetails(
      {required String enquiryID, required ParentInfoEntity parentInfo}) {
    return _networkPort.updateParentDetails(
        enquiryID: enquiryID, parentInfo: parentInfo);
  }

  @override
  Future<Either<NetworkError, SingleResponse>> updateContactDetails(
      {required String enquiryID,
      required ContactDetailsEntity contactDetails}) {
    return _networkPort.updateContactDetails(
        enquiryID: enquiryID, contactDetails: contactDetails);
  }

  @override
  Future<Either<NetworkError, SingleResponse>> updateMedicalDetails(
      {required String enquiryID,
      required MedicalDetailsEntity medicalDetails}) {
    return _networkPort.updateMedicalDetails(
        enquiryID: enquiryID, medicalDetails: medicalDetails);
  }

  @override
  Future<Either<NetworkError, SingleResponse>> updateBankDetails(
      {required String enquiryID, required BankDetailsEntity bankDetails}) {
    return _networkPort.updateBankDetails(
        enquiryID: enquiryID, bankDetails: bankDetails);
  }

  @override
  Future<Either<NetworkError, SiblingProfileResponse>> getSiblingDetail(
      {required GetSiblingDetailRequest getSiblingDetailRequest}) {
    return _networkPort.getSiblingDetail(
        getSiblingDetailRequest: getSiblingDetailRequest);
  }

  @override
  Future<Either<NetworkError, SubjectDetailResponse>> selectOptionalSubject(
      {required List<SubjectSelectionRequest> subjectSelectionRequest,
      required String enquiryID}) {
    return _networkPort.selectOptionalSubject(
        subjectSelectionRequest: subjectSelectionRequest, enquiryID: enquiryID);
  }

  @override
  Future<Either<NetworkError, VasOptionResponse>> addVASOption(
      {required String enquiryID, required VasOptionRequest vasOptionRequest}) {
    return _networkPort.addVASOption(
        enquiryID: enquiryID, vasOptionRequest: vasOptionRequest);
  }

  @override
  Future<Either<NetworkError, SubjectListResponse>> getSubjectList(
      {required SubjectListingRequest subjectListingRequest}) {
    return _networkPort.getSubjectList(
        subjectListingRequest: subjectListingRequest);
  }

  @override
  Future<Either<NetworkError, PsaEnrollmentDetailResponseModel>>
      getPsaEnrollmentDetail({required VasDetailRequest vasDetailRequest}) {
    return _networkPort.getPsaEnrollmentDetail(
        vasDetailRequest: vasDetailRequest);
  }

  @override
  Future<Either<NetworkError, CafeteriaEnrollmentResponseModel>>
      getCafeteriaEnrollmentDetail(
          {required VasDetailRequest vasDetailRequest}) {
    return _networkPort.getCafeteriaEnrollmentDetail(
        vasDetailRequest: vasDetailRequest);
  }

  @override
  Future<Either<NetworkError, SummerCampEnrollmentResponseModel>>
      getSummerCampEnrollmentDetail(
          {required VasDetailRequest vasDetailRequest}) {
    return _networkPort.getSummerCampEnrollmentDetail(
        vasDetailRequest: vasDetailRequest);
  }

  @override
  Future<Either<NetworkError, KidsClubEnrollmentResponseModel>>
      getKidsClubEnrollmentDetail(
          {required VasDetailRequest vasDetailRequest}) {
    return _networkPort.getKidsClubEnrollmentDetail(
        vasDetailRequest: vasDetailRequest);
  }

  @override
  Future<Either<NetworkError, TransportEnrollmentResponseModel>>
      getTransportEnrollmentDetail(
          {required VasDetailRequest vasDetailRequest}) {
    return _networkPort.getTransportEnrollmentDetail(
        vasDetailRequest: vasDetailRequest);
  }

  @override
  Future<Either<NetworkError, VasOptionResponse>> calculateFees(
      {required VasEnrollmentFeeCalculationRequest feeCalculationRequest}) {
    return _networkPort.calculateFees(
        feeCalculationRequest: feeCalculationRequest);
  }

  @override
  Future<Either<NetworkError, VasOptionResponse>> addVasDeatil(
      {required String enquiryID,
      required String type,
      required VasEnrollmentRequest vasEnrollmentRequest}) {
    return _networkPort.addVasDeatil(
        enquiryID: enquiryID,
        type: type,
        vasEnrollmentRequest: vasEnrollmentRequest);
  }

  @override
  Future<Either<NetworkError, VasOptionResponse>> removeVasDeatil(
      {required String enquiryID, required String type}) {
    return _networkPort.removeVasDeatil(enquiryID: enquiryID, type: type);
  }

  @override
  Future<Either<NetworkError, VasOptionResponse>> makePaymentRequest(
      {required String enquiryID}) {
    return _networkPort.makePaymentRequest(enquiryID: enquiryID);
  }

  @override
  Future<Either<NetworkError, FetchStopResponseModel>> fetchStops(
      {required FetchStopRequest fetchStopRequest}) {
    return _networkPort.fetchStops(fetchStopRequest: fetchStopRequest);
  }

  @override
  Future<Either<NetworkError, AdmissionVasDetailsResponse>>
      getAdmissionVasDetails({required String enquiryId}) {
    return _networkPort.getAdmissionVasDetails(enquiryId: enquiryId);
  }
}
