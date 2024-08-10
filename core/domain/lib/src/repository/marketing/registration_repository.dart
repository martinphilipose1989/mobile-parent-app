import 'package:domain/domain.dart';

abstract class RegistrationRepository {
  Future<Either<NetworkError, BaseInfo<T>>> getRegistrationDetail<T>({required String enquiryID, required String infoType});
}