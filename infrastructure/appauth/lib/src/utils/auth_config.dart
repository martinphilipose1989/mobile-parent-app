class AppAuthConfig {
  final String clientSecret;
  final String appUri;
  final String clientId;
  final String loginUrl;
  final String tokenUrl;
  final String? logOutUrl;
  final String logOutRedirectUri;
  final String discoveryUrl;

  AppAuthConfig(
      {required this.clientSecret,
      required this.appUri,
      required this.clientId,
      required this.loginUrl,
      required this.tokenUrl,
      required this.logOutRedirectUri,
      required this.discoveryUrl,
      this.logOutUrl});
}
