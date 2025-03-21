import 'package:envied/envied.dart';

part 'env_prod.g.dart';

@Envied(path: '.env.prod')
abstract class EnvProd {
  @EnviedField(varName: 'Finance_Base_URL')
  static const String financeBaseUrl = _EnvProd.financeBaseUrl;

  @EnviedField(varName: 'MDM_BASE_URL')
  static const String mdmBaseUrl = _EnvProd.mdmBaseUrl;

  @EnviedField(varName: 'MDM_TOKEN')
  static const String mdmToken = _EnvProd.mdmToken;

  @EnviedField(varName: 'ADMIN_BASE_URL')
  static const String adminBaseUrl = _EnvProd.adminBaseUrl;

  @EnviedField(varName: 'TICKETING_BASE_URL')
  static const String ticketingBaseUrl = _EnvProd.ticketingBaseUrl;

  @EnviedField(varName: 'DISCIPLINARY_BASE_URL')
  static const String disciplinarySlip = _EnvProd.disciplinarySlip;

  @EnviedField(varName: 'ATTENDANCE_BASE_URL')
  static const String attendance = _EnvProd.attendance;

  @EnviedField(varName: 'TRANSPORT_BASE_URL')
  static const String transportUrl = _EnvProd.transportUrl;

  @EnviedField(varName: 'KEY_CLOAK_AUTH_URL')
  static const String authorizationEndpoint = _EnvProd.authorizationEndpoint;

  @EnviedField(varName: 'KEY_CLOAK_TOKEN_URL')
  static const String tokenEndpoint = _EnvProd.tokenEndpoint;

  @EnviedField(varName: 'KEY_CLOAK_LOGOUT_URL')
  static const String logoutEndpoint = _EnvProd.logoutEndpoint;

  @EnviedField(varName: 'KEY_CLOAK_DISCOVERY_URL')
  static const String discoveryUrl = _EnvProd.discoveryUrl;

  @EnviedField(varName: 'KEY_CLOAK_REDIRECT_URI')
  static const String appRedirectUri = _EnvProd.appRedirectUri;

  @EnviedField(varName: 'KEY_CLOAK_LOGOUT_REDIRECT_URI')
  static const String logoutRedirectUri = _EnvProd.logoutRedirectUri;

  @EnviedField(varName: 'KEY_CLOAK_CLIENTID')
  static const String clientId = _EnvProd.clientId;

  @EnviedField(varName: 'KEY_CLOAK_CLIENT_SECRET')
  static const String clientSecret = _EnvProd.clientSecret;

  @EnviedField(varName: 'KEY_INTROSPECT_URL')
  static const String introspectUrl = _EnvProd.introspectUrl;

  @EnviedField(varName: 'GATE_BASE_URL')
  static const String gateBaseUrl = _EnvProd.gateBaseUrl;

  @EnviedField(varName: 'MARKETING_BASE_URL')
  static const String marketingBaseUrl = _EnvProd.marketingBaseUrl;

  @EnviedField(varName: 'NOTIFICATION_BASE_URL')
  static const String notificationUrl = _EnvProd.notificationUrl;

  @EnviedField(varName: 'FRONTEND_URL')
  static const String frontEndUrl = _EnvProd.frontEndUrl;

  @EnviedField(varName: 'SUBJECT_SELECTION_URL')
  static const String subjectSelectionUrl = _EnvProd.subjectSelectionUrl;

  @EnviedField(varName: 'ANDROID_API_KEY')
  static const String androidApiKey = _EnvProd.androidApiKey;

  @EnviedField(varName: 'ANDROID_APP_ID')
  static const String androidAppId = _EnvProd.androidAppId;

  @EnviedField(varName: 'ANDROID_PACKAGE_NAME')
  static const String androidAppPackageName = _EnvProd.androidAppPackageName;

  @EnviedField(varName: 'IOS_API_KEY')
  static const String iosApiKey = _EnvProd.iosApiKey;

  @EnviedField(varName: 'IOS_APP_ID')
  static const String iosAppId = _EnvProd.iosAppId;

  @EnviedField(varName: 'IOS_PACKAGE_NAME')
  static const String iosAppPackageName = _EnvProd.iosAppPackageName;

  @EnviedField(varName: 'SENDER_ID')
  static const String senderId = _EnvProd.senderId;

  @EnviedField(varName: 'PROJECT_ID')
  static const String projectId = _EnvProd.projectId;
}
