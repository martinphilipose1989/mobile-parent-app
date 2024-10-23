import 'package:app/app.dart';
import 'package:app/flavors/flavor.dart';
import 'package:app/flavors/flavor_config.dart';
import 'package:app/flavors/flavor_values.dart';
import 'package:app/secrets/app_secrets.dart';

void main() async {
  FlavorConfig.initialize(
    flavor: Flavor.prod,
    values: const FlavorValues(
      apiBaseUrl: '',
      mdmBaseUrl: '',
      adminBaseUrl: '',
      mdmToken: '',
      attendance: '',
      financeBaseUrl: '',
      secrets: AppSecrets.appSecretsProd, disciplinarySlip: '',
    ),
  );
  startApp();
}
