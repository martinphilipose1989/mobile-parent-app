import 'package:app/secrets/app_secrets.dart';

class FlavorValues {
  final String apiBaseUrl;
  final String mdmBaseUrl;
  final String financeBaseUrl;
  final String adminBaseUrl;
  final String mdmToken;
  final AppSecrets secrets;
  final bool useFakeData;
  final bool showLogs;
  final bool _logSqlStatements;
  final String disciplinarySlip;
  final String attendance;

  const FlavorValues( {
    required this.attendance,
    required this.disciplinarySlip,
    required this.apiBaseUrl,
    required this.mdmBaseUrl,
    required this.financeBaseUrl,
    required this.adminBaseUrl,
    required this.mdmToken,
    required this.secrets,
    logSqlStatements = false,
    this.showLogs = false,
    this.useFakeData = false,
  }) : _logSqlStatements = showLogs && logSqlStatements;

  bool get logSqlStatements => _logSqlStatements;
}
