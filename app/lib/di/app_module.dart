import 'package:app/flavors/flavor_config.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @Named("BaseUrl")
  String get baseUrl => FlavorConfig.instance.values.apiBaseUrl;

  @Named("ApiKey")
  String get apiKey => FlavorConfig.instance.values.secrets.thirdpartyApiKey;

  @Named("mdmBaseUrl")
  String get mdmBaseUrl => FlavorConfig.instance.values.mdmBaseUrl;

  @Named("financeBaseUrl")
  String get financeBaseUrl => FlavorConfig.instance.values.financeBaseUrl;

  @Named("mdmToken")
  String get mdmToken => FlavorConfig.instance.values.mdmToken;

  @Named("adminBaseUrl")
  String get adminBaseUrl => FlavorConfig.instance.values.adminBaseUrl;

  @Named("AuthUrl")
  String get authUrl => FlavorConfig.instance.values.authorizationEndpoint;

  @Named("TokenUrl")
  String get tokeUrl => FlavorConfig.instance.values.tokenEndpoint;

  @Named("LogOutUrl")
  String get logOutUrl => FlavorConfig.instance.values.logoutEndpoint ?? "";

  @Named("AppUri")
  String get redirectUri => FlavorConfig.instance.values.secrets.appRedirectUri;

  @Named("ClientId")
  String get clientId => FlavorConfig.instance.values.secrets.clientId;

  @Named("ClientSecret")
  String get clientSecret => FlavorConfig.instance.values.secrets.clientSecret;

  @Named("ShowLogs")
  bool get showLogs => FlavorConfig.instance.values.showLogs;

  @Named("gatePassBaseUrl")
  String get gatePassBaseUrl => FlavorConfig.instance.values.gatePassBaseUrl;
}
