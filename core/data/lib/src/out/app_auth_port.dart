import 'package:flutter_appauth/flutter_appauth.dart';

abstract class AppAuthPort {
  Future<AuthorizationTokenResponse> login();

  Future<EndSessionResponse> logout({required String idTokenHint});

  Future<TokenResponse> refreshToken();
}
