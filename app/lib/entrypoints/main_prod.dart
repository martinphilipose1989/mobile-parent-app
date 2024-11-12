import 'package:app/app.dart';
import 'package:app/flavors/flavor.dart';
import 'package:app/flavors/flavor_config.dart';
import 'package:app/flavors/flavor_values.dart';
import 'package:app/secrets/app_secrets.dart';

void main() async {
  FlavorConfig.initialize(
    flavor: Flavor.prod,
    values: const FlavorValues(
      //   apiBaseUrl: '',
      mdmBaseUrl: '',
      adminBaseUrl: '',
      mdmToken: '',
      financeBaseUrl: '',
      authorizationEndpoint:
          "https://qa.vgos.org/realms/ampersand-external-qa/protocol/openid-connect/auth",
      tokenEndpoint:
          "https://qa.vgos.org/realms/ampersand-external-qa/protocol/openid-connect/token",
      apiBaseUrl: "https://api.openweathermap.org/",
      secrets: AppSecrets.appSecretsProd, transportUrl: '',
    ),
  );
  startApp();
}
