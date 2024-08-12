import 'package:domain/domain.dart';
import 'package:network_retrofit/network_retrofit.dart';

abstract class RegistrationRepository {
  Future<Either<NetworkError, BaseInfo<T>>> getRegistrationDetail<T>({required String enquiryID, required String infoType});
  Future<Either<NetworkError, BaseInfo<T>>> updateParentDetails<T>({required String enquiryID, required ParentInfoEntity parentInfo});
  Future<Either<NetworkError, BaseInfo<T>>> updateContactDetails<T>({required String enquiryID, required ContactDetailsEntity contactDetails});
  Future<Either<NetworkError, BaseInfo<T>>> updateMedicalDetails<T>({required String enquiryID, required MedicalDetailsEntity medicalDetails});
  Future<Either<NetworkError, BaseInfo<T>>> updateBankDetails<T>({required String enquiryID, required  BankDetailsEntity bankDetails});
}