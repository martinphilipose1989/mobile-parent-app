class AppAuthConfig {
  final String clientSecret;
  final String appUri;
  final String clientId;
  final String loginUrl;
  final String tokenUrl;
  final String? logOutUrl;

  AppAuthConfig(
      {required this.clientSecret,
      required this.appUri,
      required this.clientId,
      required this.loginUrl,
      required this.tokenUrl,
      this.logOutUrl});
}
