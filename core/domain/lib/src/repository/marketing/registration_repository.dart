import 'package:domain/domain.dart';
import 'package:network_retrofit/network_retrofit.dart';

abstract class RegistrationRepository {
  Future<Either<NetworkError, SingleResponse>> getRegistrationDetail({required String enquiryID, required String infoType});
  Future<Either<NetworkError, ParentInfo>> updateParentDetails({required String enquiryID, required ParentInfoEntity parentInfo});
  Future<Either<NetworkError, ContactDetails>> updateContactDetails({required String enquiryID, required ContactDetailsEntity contactDetails});
  Future<Either<NetworkError, MedicalDetails>> updateMedicalDetails({required String enquiryID, required MedicalDetailsEntity medicalDetails});
  Future<Either<NetworkError, BankDetails>> updateBankDetails({required String enquiryID, required  BankDetailsEntity bankDetails});
}