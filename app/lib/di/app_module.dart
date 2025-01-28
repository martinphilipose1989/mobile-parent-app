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

  @Named("ticketBaseUrl")
  String get ticketBaseUrl => FlavorConfig.instance.values.ticketingBaseUrl;

  @Named("disciplinarySlip")
  String get disciplinarySlip => FlavorConfig.instance.values.disciplinarySlip;

  @Named("attendance")
  String get attendance => FlavorConfig.instance.values.attendance;
  @Named("transportUrl")
  String get transportUrl => FlavorConfig.instance.values.transportUrl;

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

  @Named("LogOutUri")
  String get logOutRedirectUri =>
      FlavorConfig.instance.values.secrets.logoutRedirectUri;

  @Named("DiscoveryUrl")
  String get discoveryUrl => FlavorConfig.instance.values.discoveryUrl;

  @Named("KeyCloakUrl")
  String get keyCloakIntrospectUrl =>
      FlavorConfig.instance.values.keyCloakIntrospectUrl;

  @Named("GateUrl")
  String get gateUrl => FlavorConfig.instance.values.gateUrl;

  @Named("MarketingUrl")
  String get marketingUrl => FlavorConfig.instance.values.marketingUrl;

  @Named("notificationUrl")
  String get notificationUrl => FlavorConfig.instance.values.notificationUrl;

  // Web view

  @Named("FrontEndUrl")
  String get frontEndUrl => FlavorConfig.instance.values.frontEndUrl;

  @Named("SubjectSelectionUrl")
  String get subjectSelectionUrl =>
      FlavorConfig.instance.values.subjectSelectionUrl;
}
