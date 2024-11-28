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

  final String discoveryUrl;
  final String keyCloakIntrospectUrl;

  const FlavorValues({
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
    this.logoutEndpoint,
    logSqlStatements = false,
    this.showLogs = false,
    this.useFakeData = false,
  }) : _logSqlStatements = showLogs && logSqlStatements;

  bool get logSqlStatements => _logSqlStatements;
}
