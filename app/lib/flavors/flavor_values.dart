import 'package:app/secrets/app_secrets.dart';

class FlavorValues {
  final String apiBaseUrl;
  final String mdmBaseUrl;
  final String financeBaseUrl;
  final String adminBaseUrl;
  final String ticketingBaseUrl;
  final String mdmToken;
  final AppSecrets secrets;
  final bool useFakeData;
  final bool showLogs;
  final bool _logSqlStatements;
  final String disciplinarySlip;
  final String attendance;

  final String authorizationEndpoint;
  final String tokenEndpoint;
  final String? logoutEndpoint;
  final String transportUrl;
final String androidApiKey;
  final String discoveryUrl;
  final String androidAppId;
  final String androidSenderId;
  final String  androidProjectId;
  final String keyCloakIntrospectUrl;
  final String gateUrl;
  final String marketingUrl;
  final String frontEndUrl;
  final String notificationUrl;
  final String subjectSelectionUrl;
final String bearerBaseUrl;
  const FlavorValues({
    required this.bearerBaseUrl,
    required this.notificationUrl,
    required this.transportUrl,
    required this.attendance,
    required this.disciplinarySlip,
    required this.apiBaseUrl,
    required this.mdmBaseUrl,
    required this.financeBaseUrl,
    required this.adminBaseUrl,
    required this.mdmToken,
    required this.ticketingBaseUrl,
    required this.secrets,
    required this.authorizationEndpoint,
    required this.tokenEndpoint,
    required this.discoveryUrl,
    required this.keyCloakIntrospectUrl,
    required this.gateUrl,
    required this.marketingUrl,
    required this.frontEndUrl,
    required this.subjectSelectionUrl,
   required this.androidApiKey,    required this.androidAppId,    required this.androidSenderId,   required this.androidProjectId,
    this.logoutEndpoint,
    logSqlStatements = false,
    this.showLogs = false,
    this.useFakeData = false,
  }) : _logSqlStatements = showLogs && logSqlStatements;

  bool get logSqlStatements => _logSqlStatements;
}
