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
        keyCloakIntrospectUrl: EnvQA.introspectUrl,
        authorizationEndpoint: EnvQA.authorizationEndpoint,
        tokenEndpoint: EnvQA.tokenEndpoint,
        transportUrl: EnvQA.transportUrl,
        discoveryUrl: EnvQA.discoveryUrl,
        logoutEndpoint: EnvQA.logoutEndpoint,
        gateUrl: EnvQA.gateBaseUrl,
        marketingUrl: EnvQA.marketingBaseUrl,
        showLogs: false,
        frontEndUrl: EnvQA.frontEndUrl,
        notificationUrl: EnvQA.notificationUrl,
        subjectSelectionUrl: EnvQA.subjectSelectionUrl,
        androidApiKey: EnvQA.androidApiKey,
        androidAppId: EnvQA.androidAppId,
        androidSenderId: EnvQA.senderId,
        androidProjectId: EnvQA.projectId,
        bearerBaseUrl: EnvQA.bearerBaseUrl),
  );
  startApp();
}
