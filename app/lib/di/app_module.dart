import 'package:app/flavors/flavor_config.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @Named("BaseUrl")
  String get baseUrl => FlavorConfig.instance.values.apiBaseUrl;

  @Named("ApiKey")
  String get apiKey => FlavorConfig.instance.values.secrets.thirdpartyApiKey;

  @Named("mdmBaseUrl")
  String get mdmBaseUrl => FlavorConfig.instance.values.mdmBaseUrl;

  @Named("financeBaseUrl")
  String get financeBaseUrl => FlavorConfig.instance.values.financeBaseUrl;

  @Named("mdmToken")
  String get mdmToken => FlavorConfig.instance.values.mdmToken;

  @Named("adminBaseUrl")
  String get adminBaseUrl => FlavorConfig.instance.values.adminBaseUrl;

  @Named("disciplinarySlip")
  String get disciplinarySlip => FlavorConfig.instance.values.disciplinarySlip;

}
