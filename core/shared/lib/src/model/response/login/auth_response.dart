class AuthResponse {
  final String? accessToken;
  final DateTime? accessTokenExpirationDateTime;
  final String? idToken;
  final String? refreshToken;

  AuthResponse({
    this.accessToken,
    this.accessTokenExpirationDateTime,
    this.idToken,
    this.refreshToken,
  });
}
