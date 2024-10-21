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
      secrets: AppSecrets.appSecretsQA, disciplinarySlip: EnvQA.disciplinarySlip,
    ),
  );
  startApp();
}
