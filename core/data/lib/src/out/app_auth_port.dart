import 'package:flutter_appauth/flutter_appauth.dart';

abstract class AppAuthPort {
  Future<AuthorizationTokenResponse> login();

  Future<void> logout();

  Future<void> refreshToken();
}
