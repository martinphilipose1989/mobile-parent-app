import 'package:app/app.dart';
import 'package:app/flavors/flavor.dart';
import 'package:app/flavors/flavor_config.dart';
import 'package:app/flavors/flavor_values.dart';
import 'package:app/secrets/app_secrets.dart';
import 'package:network_retrofit/util/network_properties.dart';

void main() async {
  FlavorConfig.initialize(
    flavor: Flavor.prod,
    values: const FlavorValues(
        transportUrl: '',

        //   apiBaseUrl: '',
        mdmBaseUrl: '',
        adminBaseUrl: '',
        mdmToken: '',
        attendance: '',
        financeBaseUrl: '',
        ticketingBaseUrl: '',
        showLogs: true,
        keyCloakIntrospectUrl: '',
        gateUrl: '',
        secrets: AppSecrets.appSecretsProd,
        authorizationEndpoint:
            "https://qa.vgos.org/realms/ampersand-external-qa/protocol/openid-connect/auth",
        tokenEndpoint:
            "https://qa.vgos.org/realms/ampersand-external-qa/protocol/openid-connect/token",
        apiBaseUrl: NetworkProperties.baseURL,
        disciplinarySlip: '',
        discoveryUrl:
            'https://qa.vgos.org/realms/ampersand-external-qa/.well-known/openid-configuration',
        logoutEndpoint:
            'https://qa.vgos.org/realms/ampersand-external-qa/protocol/openid-connect/logout'),
  );
  startApp();
}
