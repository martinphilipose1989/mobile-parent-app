import 'package:appauth/src/appauth_adapter.dart';
import 'package:appauth/src/utils/auth_config.dart';
import 'package:data/data.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppAuthModule {
  @singleton
  FlutterAppAuth provideAppAuth() => const FlutterAppAuth();

  @singleton
  AppAuthConfig providerAuthConfig(
      @Named("AuthUrl") String authUrl,
      @Named("TokenUrl") String tokenUrl,
      @Named("LogOutUrl") String? logOutUrl,
      @Named("AppUri") String appRedirectUri,
      @Named("ClientId") String clientId,
      @Named("ClientSecret") String clientSecret,
      @Named("LogOutUri") String logOutRedirectUri,
      @Named("DiscoveryUrl") String discoveryUrl) {
    return AppAuthConfig(
      clientSecret: clientSecret,
      appUri: appRedirectUri,
      clientId: clientId,
      loginUrl: authUrl,
      tokenUrl: tokenUrl,
      discoveryUrl: discoveryUrl,
      logOutRedirectUri: logOutRedirectUri,
      logOutUrl: logOutUrl,
    );
  }

  @lazySingleton
  AppAuthPort providerAppAuthAdapter(
      FlutterAppAuth appAuth, AppAuthConfig config) {
    return AppAuthAdapter(config: config, flutterAppAuth: appAuth);
  }
}
