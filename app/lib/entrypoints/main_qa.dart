import 'package:app/app.dart';
import 'package:app/env/env_qa.dart';
import 'package:app/flavors/flavor.dart';
import 'package:app/flavors/flavor_config.dart';
import 'package:app/flavors/flavor_values.dart';
import 'package:app/secrets/app_secrets.dart';
import 'package:network_retrofit/util/network_properties.dart';

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
          "https://sso.ampersandgroup.in/realms/ampersand-external-dev/protocol/openid-connect/auth",
      tokenEndpoint:
          "https://sso.ampersandgroup.in/realms/ampersand-external-dev/protocol/openid-connect/token",
      apiBaseUrl: NetworkProperties.baseURL,
      secrets: AppSecrets.appSecretsQA,
      transportUrl: EnvQA.transportUrl,
    ),
  );
  startApp();
}
