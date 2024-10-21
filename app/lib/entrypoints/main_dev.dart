import 'package:app/app.dart';
import 'package:app/env/env_dev.dart';
import 'package:app/flavors/flavor.dart';
import 'package:app/flavors/flavor_config.dart';
import 'package:app/flavors/flavor_values.dart';
import 'package:app/secrets/app_secrets.dart';
import 'package:network_retrofit/util/network_properties.dart';

void main() async {
  FlavorConfig.initialize(
    flavor: Flavor.dev,
    values: const FlavorValues(
      authorizationEndpoint:
          "https://qa.vgos.org/realms/ampersand-external-qa/protocol/openid-connect/auth",
      tokenEndpoint:
          "https://qa.vgos.org/realms/ampersand-external-qa/protocol/openid-connect/token",
      apiBaseUrl: NetworkProperties.baseURL,
      financeBaseUrl: EnvDev.financeBaseUrl,
      mdmBaseUrl: EnvDev.mdmBaseUrl,
      adminBaseUrl: EnvDev.adminBaseUrl,
      mdmToken: EnvDev.mdmToken,
      secrets: AppSecrets.appSecretsDev,
      logSqlStatements: true,
      showLogs: true,
      useFakeData: false,
    ),
  );
  startApp();
}
