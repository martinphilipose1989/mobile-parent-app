import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:services/src/secure_storage_service.dart';

@module
abstract class ServiceModule {
  @lazySingleton
  FlutterSecureStorage get secureStorage => FlutterSecureStorage();

  @lazySingleton
  SecureStorageService provideSecureStorge(FlutterSecureStorage secureStorage) {
    return SecureStorageService(secureStorage);
  }
}
