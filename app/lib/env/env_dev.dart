import 'package:envied/envied.dart';

part 'env_dev.g.dart';

@Envied(path: '.env.dev')
abstract class EnvDev {
  @EnviedField(varName: 'Finance_Base_URL')
  static const String financeBaseUrl = _EnvDev.financeBaseUrl;

  @EnviedField(varName: 'MDM_BASE_URL')
  static const String mdmBaseUrl = _EnvDev.mdmBaseUrl;

  @EnviedField(varName: 'MDM_TOKEN')
  static const String mdmToken = _EnvDev.mdmToken;

  @EnviedField(varName: 'ADMIN_BASE_URL')
  static const String adminBaseUrl = _EnvDev.adminBaseUrl;

  @EnviedField(varName: 'TICKETING_BASE_URL')
  static const String ticketingBaseUrl = _EnvDev.ticketingBaseUrl;

  @EnviedField(varName: 'DISCIPLINARY_BASE_URL')
  static const String disciplinarySlip = _EnvDev.disciplinarySlip;

  @EnviedField(varName: 'ATTENDANCE_BASE_URL')
  static const String attendance = _EnvDev.attendance;

  @EnviedField(varName: 'TRANSPORT_BASE_URL')
  static const String transportUrl = _EnvDev.transportUrl;

  @EnviedField(varName: 'KEY_CLOAK_AUTH_URL')
  static const String authorizationEndpoint = _EnvDev.authorizationEndpoint;

  @EnviedField(varName: 'KEY_CLOAK_TOKEN_URL')
  static const String tokenEndpoint = _EnvDev.tokenEndpoint;

  @EnviedField(varName: 'KEY_CLOAK_LOGOUT_URL')
  static const String logoutEndpoint = _EnvDev.logoutEndpoint;

  @EnviedField(varName: 'KEY_CLOAK_DISCOVERY_URL')
  static const String discoveryUrl = _EnvDev.discoveryUrl;

  @EnviedField(varName: 'KEY_CLOAK_REDIRECT_URI')
  static const String appRedirectUri = _EnvDev.appRedirectUri;

  @EnviedField(varName: 'KEY_CLOAK_LOGOUT_REDIRECT_URI')
  static const String logoutRedirectUri = _EnvDev.logoutRedirectUri;

  @EnviedField(varName: 'KEY_CLOAK_CLIENTID')
  static const String clientId = _EnvDev.clientId;

  @EnviedField(varName: 'KEY_CLOAK_CLIENT_SECRET')
  static const String clientSecret = _EnvDev.clientSecret;

  @EnviedField(varName: 'KEY_INTROSPECT_URL')
  static const String introspectUrl = _EnvDev.introspectUrl;

  @EnviedField(varName: 'GATE_BASE_URL')
  static const String gateBaseUrl = _EnvDev.gateBaseUrl;

  @EnviedField(varName: 'MARKETING_BASE_URL')
  static const String marketingBaseUrl = _EnvDev.marketingBaseUrl;

  @EnviedField(varName: 'FRONTEND_URL')
  static const String frontEndUrl = _EnvDev.frontEndUrl;

  @EnviedField(varName: 'NOTIFICATION_BASE_URL')
  static const String notificationUrl = _EnvDev.notificationUrl;

  @EnviedField(varName: 'SUBJECT_SELECTION_URL')
  static const String subjectSelectionUrl = _EnvDev.subjectSelectionUrl;

  @EnviedField(varName: 'ANDROID_API_KEY')
  static const String androidApiKey = _EnvDev.androidApiKey;

  @EnviedField(varName: 'ANDROID_APP_ID')
  static const String androidAppId = _EnvDev.androidAppId;

  @EnviedField(varName: 'ANDROID_PACKAGE_NAME')
  static const String androidAppPackageName = _EnvDev.androidAppPackageName;

  @EnviedField(varName: 'IOS_API_KEY')
  static const String iosApiKey = _EnvDev.iosApiKey;

  @EnviedField(varName: 'IOS_APP_ID')
  static const String iosAppId = _EnvDev.iosAppId;

  @EnviedField(varName: 'IOS_PACKAGE_NAME')
  static const String iosAppPackageName = _EnvDev.iosAppPackageName;

  @EnviedField(varName: 'SENDER_ID')
  static const String senderId = _EnvDev.senderId;

  @EnviedField(varName: 'PROJECT_ID')
  static const String projectId = _EnvDev.projectId;

  @EnviedField(varName: 'BEARER_BASE_URL')
  static const String bearerBaseUrl = _EnvDev.bearerBaseUrl;
}
