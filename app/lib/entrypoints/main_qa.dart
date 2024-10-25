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
      // apiBaseUrl: '',
      financeBaseUrl: EnvQA.financeBaseUrl,
      adminBaseUrl: EnvQA.adminBaseUrl,
      mdmBaseUrl: EnvQA.mdmBaseUrl,
      mdmToken: EnvQA.mdmToken,
      authorizationEndpoint:
          "https://qa.vgos.org/realms/ampersand-external-qa/protocol/openid-connect/auth",
      tokenEndpoint:
          "https://qa.vgos.org/realms/ampersand-external-qa/protocol/openid-connect/token",
      apiBaseUrl: "https://api.openweathermap.org/",
      secrets: AppSecrets.appSecretsQA,
    ),
  );
  startApp();
}
