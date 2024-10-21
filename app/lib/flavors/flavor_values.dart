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

  const FlavorValues({
    required this.apiBaseUrl,
    required this.mdmBaseUrl,
    required this.financeBaseUrl,
    required this.adminBaseUrl,
    required this.mdmToken,
    required this.ticketingBaseUrl,
    required this.secrets,
    logSqlStatements = false,
    this.showLogs = false,
    this.useFakeData = false,
  }) : _logSqlStatements = showLogs && logSqlStatements;

  bool get logSqlStatements => _logSqlStatements;
}
