import 'package:app/secrets/app_secrets.dart';

class FlavorValues {
  final String apiBaseUrl;
  final AppSecrets secrets;
  final bool useFakeData;
  final bool showLogs;
  final bool _logSqlStatements;
  final String authorizationEndpoint;
  final String tokenEndpoint;
  final String? logoutEndpoint;

  const FlavorValues({
    required this.apiBaseUrl,
    required this.secrets,
    required this.authorizationEndpoint,
    required this.tokenEndpoint,
    this.logoutEndpoint,
    logSqlStatements = false,
    this.showLogs = false,
    this.useFakeData = false,
  }) : _logSqlStatements = showLogs && logSqlStatements;

  bool get logSqlStatements => _logSqlStatements;
}
