import 'package:app/app.dart';
import 'package:app/env/env_qa.dart';
import 'package:app/flavors/flavor.dart';
import 'package:app/flavors/flavor_config.dart';
import 'package:app/flavors/flavor_values.dart';
import 'package:app/secrets/app_secrets.dart';

void main() async {
  FlavorConfig.initialize(
    flavor: Flavor.qa,
    values: const FlavorValues(
        apiBaseUrl: '',
        financeBaseUrl: EnvQA.financeBaseUrl,
        adminBaseUrl: EnvQA.adminBaseUrl,
        mdmBaseUrl: EnvQA.mdmBaseUrl,
        mdmToken: EnvQA.mdmToken,
        attendance: EnvQA.attendance,
        ticketingBaseUrl: EnvQA.ticketingBaseUrl,
        secrets: AppSecrets.appSecretsQA,
        disciplinarySlip: EnvQA.disciplinarySlip,
        authorizationEndpoint:
            "https://sso.ampersandgroup.in/realms/ampersand-external-dev/protocol/openid-connect/auth",
        tokenEndpoint:
            "https://sso.ampersandgroup.in/realms/ampersand-external-dev/protocol/openid-connect/token",
        transportUrl: EnvQA.transportUrl,
        discoveryUrl:
            'https://sso.ampersandgroup.in/realms/ampersand-external-dev/.well-known/openid-configuration',
        logoutEndpoint:
            'https://sso.ampersandgroup.in/realms/ampersand-external-dev/protocol/openid-connect/logout',
        showLogs: false),
  );
  startApp();
}
