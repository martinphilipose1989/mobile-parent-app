import 'package:domain/domain.dart';
import 'package:network_retrofit/network_retrofit.dart';

abstract class RegistrationRepository {
  Future<Either<NetworkError, SingleResponse>> getRegistrationDetail({required String enquiryID, required String infoType});
  Future<Either<NetworkError, SingleResponse>> updateParentDetails({required String enquiryID, required ParentInfoEntity parentInfo});
  Future<Either<NetworkError, SingleResponse>> updateContactDetails({required String enquiryID, required ContactDetailsEntity contactDetails});
  Future<Either<NetworkError, SingleResponse>> updateMedicalDetails({required String enquiryID, required MedicalDetailsEntity medicalDetails});
  Future<Either<NetworkError, SingleResponse>> updateBankDetails({required String enquiryID, required  BankDetailsEntity bankDetails});
  Future<Either<NetworkError, SiblingProfileResponse>> getSiblingDetail({required GetSiblingDetailRequest getSiblingDetailRequest});
  Future<Either<NetworkError, SubjectDetailResponse>> selectOptionalSubject({required List<SubjectSelectionRequest> subjectSelectionRequest,required String enquiryID});
  Future<Either<NetworkError,VasOptionResponse>> addVASOption({required String enquiryID,required VasOptionRequest vasOptionRequest});
  Future<Either<NetworkError, VasOptionResponse>> getSubjectList({required SubjectListingRequest subjectListingRequest});
  Future<Either<NetworkError,PsaEnrollmentDetailResponseModel>> getPsaEnrollmentDetail({required VasDetailRequest vasDetailRequest});
  Future<Either<NetworkError,CafeteriaEnrollmentResponseModel>> getCafeteriaEnrollmentDetail({required VasDetailRequest vasDetailRequest});
  Future<Either<NetworkError,SummerCampEnrollmentResponseModel>> getSummerCampEnrollmentDetail({required VasDetailRequest vasDetailRequest});
  Future<Either<NetworkError,KidsClubEnrollmentResponseModel>> getKidsClubEnrollmentDetail({required VasDetailRequest vasDetailRequest});
}