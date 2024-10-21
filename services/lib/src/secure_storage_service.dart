import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final FlutterSecureStorage _storage;

  SecureStorageService(this._storage);

  final String accessTokenKey = "tokenKey";
  final String refreshTokenKey = "refreshTokenKey";
  final String expirationDateTimeKey = "expirationDateTime";
  final String idTokenKey = "idToken";

  Future<void> clearPreferences() async {
    await _storage.deleteAll();
  }

  Future<dynamic> getFromDisk(String key) async {
    final value = await _storage.read(key: key);

    return value;
  }

  Future<void> saveToDisk(String key, dynamic content) async {
    if (content is String) {
      await _storage.write(key: key, value: content);
    }
    if (content is bool) {
      await _storage.write(key: key, value: content.toString());
    }
    if (content is int) {
      await _storage.write(key: key, value: content.toString());
    }
    if (content is double) {
      await _storage.write(key: key, value: content.toString());
    }
    if (content is List<String>) {
      await _storage.write(key: key, value: content.join(','));
    }
  }
}
