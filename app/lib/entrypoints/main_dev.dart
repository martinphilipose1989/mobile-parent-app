import 'package:app/app.dart';
import 'package:app/env/env_dev.dart';
import 'package:app/flavors/flavor.dart';
import 'package:app/flavors/flavor_config.dart';
import 'package:app/flavors/flavor_values.dart';
import 'package:app/secrets/app_secrets.dart';

void main() async {
  FlavorConfig.initialize(
    flavor: Flavor.dev,
    values: const FlavorValues(
        // apiBaseUrl: '',
        financeBaseUrl: EnvDev.financeBaseUrl,
        mdmBaseUrl: EnvDev.mdmBaseUrl,
        adminBaseUrl: EnvDev.adminBaseUrl,
        mdmToken: EnvDev.mdmToken,
        ticketingBaseUrl: EnvDev.ticketingBaseUrl,
        secrets: AppSecrets.appSecretsDev,
        keyCloakIntrospectUrl: EnvDev.introspectUrl,
        logSqlStatements: true,
        showLogs: true,
        authorizationEndpoint: EnvDev.authorizationEndpoint,
        tokenEndpoint: EnvDev.tokenEndpoint,
        apiBaseUrl: '',
        useFakeData: false,
        transportUrl: EnvDev.transportUrl,
        disciplinarySlip: EnvDev.disciplinarySlip,
        attendance: EnvDev.attendance,
        discoveryUrl: EnvDev.discoveryUrl,
        logoutEndpoint: EnvDev.logoutEndpoint,
        gateUrl: EnvDev.gateBaseUrl,
        marketingUrl: EnvDev.marketingBaseUrl,
        frontEndUrl: EnvDev.frontEndUrl),
  );
  startApp();
}
