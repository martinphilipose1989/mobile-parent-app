import 'package:app/app.dart';
import 'package:app/flavors/flavor.dart';
import 'package:app/flavors/flavor_config.dart';
import 'package:app/flavors/flavor_values.dart';
import 'package:app/secrets/app_secrets.dart';

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
      marketingUrl: '',
      authorizationEndpoint: "",
      tokenEndpoint: "",
      apiBaseUrl: "",
      disciplinarySlip: '',
      discoveryUrl: '',
      logoutEndpoint: '',
    ),
  );
  startApp();
}
