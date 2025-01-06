import 'package:app/app.dart';
import 'package:app/env/env_prod.dart';
import 'package:app/flavors/flavor.dart';
import 'package:app/flavors/flavor_config.dart';
import 'package:app/flavors/flavor_values.dart';
import 'package:app/secrets/app_secrets.dart';

void main() async {
  FlavorConfig.initialize(
    flavor: Flavor.prod,
    values: const FlavorValues(
        apiBaseUrl: '',
        financeBaseUrl: EnvProd.financeBaseUrl,
        adminBaseUrl: EnvProd.adminBaseUrl,
        mdmBaseUrl: EnvProd.mdmBaseUrl,
        mdmToken: EnvProd.mdmToken,
        attendance: EnvProd.attendance,
        ticketingBaseUrl: EnvProd.ticketingBaseUrl,
        secrets: AppSecrets.appSecretsQA,
        disciplinarySlip: EnvProd.disciplinarySlip,
        keyCloakIntrospectUrl: EnvProd.introspectUrl,
        authorizationEndpoint: EnvProd.authorizationEndpoint,
        tokenEndpoint: EnvProd.tokenEndpoint,
        transportUrl: EnvProd.transportUrl,
        discoveryUrl: EnvProd.discoveryUrl,
        logoutEndpoint: EnvProd.logoutEndpoint,
        gateUrl: EnvProd.gateBaseUrl,
        marketingUrl: EnvProd.marketingBaseUrl,
        showLogs: false,
        frontEndUrl: EnvProd.frontEndUrl,
        notificationUrl: EnvProd.notificationUrl,
        subjectSelectionUrl: EnvProd.subjectSelectionUrl),
  );
  startApp();
}
