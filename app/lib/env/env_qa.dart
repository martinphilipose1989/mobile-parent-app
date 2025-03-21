import 'package:envied/envied.dart';

part 'env_qa.g.dart';

@Envied(path: '.env.qa')
abstract class EnvQA {
  @EnviedField(varName: 'Finance_Base_URL')
  static const String financeBaseUrl = _EnvQA.financeBaseUrl;

  @EnviedField(varName: 'MDM_BASE_URL')
  static const String mdmBaseUrl = _EnvQA.mdmBaseUrl;

  @EnviedField(varName: 'MDM_TOKEN')
  static const String mdmToken = _EnvQA.mdmToken;

  @EnviedField(varName: 'ADMIN_BASE_URL')
  static const String adminBaseUrl = _EnvQA.adminBaseUrl;

  @EnviedField(varName: 'TICKETING_BASE_URL')
  static const String ticketingBaseUrl = _EnvQA.ticketingBaseUrl;

  @EnviedField(varName: 'DISCIPLINARY_BASE_URL')
  static const String disciplinarySlip = _EnvQA.disciplinarySlip;

  @EnviedField(varName: 'ATTENDANCE_BASE_URL')
  static const String attendance = _EnvQA.attendance;

  @EnviedField(varName: 'TRANSPORT_BASE_URL')
  static const String transportUrl = _EnvQA.transportUrl;

  @EnviedField(varName: 'KEY_CLOAK_AUTH_URL')
  static const String authorizationEndpoint = _EnvQA.authorizationEndpoint;

  @EnviedField(varName: 'KEY_CLOAK_TOKEN_URL')
  static const String tokenEndpoint = _EnvQA.tokenEndpoint;

  @EnviedField(varName: 'KEY_CLOAK_LOGOUT_URL')
  static const String logoutEndpoint = _EnvQA.logoutEndpoint;

  @EnviedField(varName: 'KEY_CLOAK_DISCOVERY_URL')
  static const String discoveryUrl = _EnvQA.discoveryUrl;

  @EnviedField(varName: 'KEY_CLOAK_REDIRECT_URI')
  static const String appRedirectUri = _EnvQA.appRedirectUri;

  @EnviedField(varName: 'KEY_CLOAK_LOGOUT_REDIRECT_URI')
  static const String logoutRedirectUri = _EnvQA.logoutRedirectUri;

  @EnviedField(varName: 'KEY_CLOAK_CLIENTID')
  static const String clientId = _EnvQA.clientId;

  @EnviedField(varName: 'KEY_CLOAK_CLIENT_SECRET')
  static const String clientSecret = _EnvQA.clientSecret;

  @EnviedField(varName: 'KEY_INTROSPECT_URL')
  static const String introspectUrl = _EnvQA.introspectUrl;

  @EnviedField(varName: 'GATE_BASE_URL')
  static const String gateBaseUrl = _EnvQA.gateBaseUrl;

  @EnviedField(varName: 'MARKETING_BASE_URL')
  static const String marketingBaseUrl = _EnvQA.marketingBaseUrl;

  @EnviedField(varName: 'FRONTEND_URL')
  static const String frontEndUrl = _EnvQA.frontEndUrl;
  @EnviedField(varName: 'NOTIFICATION_BASE_URL')
  static const String notificationUrl = _EnvQA.notificationUrl;

  @EnviedField(varName: 'SUBJECT_SELECTION_URL')
  static const String subjectSelectionUrl = _EnvQA.subjectSelectionUrl;

  @EnviedField(varName: 'ANDROID_API_KEY')
  static const String androidApiKey = _EnvQA.androidApiKey;

  @EnviedField(varName: 'ANDROID_APP_ID')
  static const String androidAppId = _EnvQA.androidAppId;

  @EnviedField(varName: 'ANDROID_PACKAGE_NAME')
  static const String androidAppPackageName = _EnvQA.androidAppPackageName;

  @EnviedField(varName: 'IOS_API_KEY')
  static const String iosApiKey = _EnvQA.iosApiKey;

  @EnviedField(varName: 'IOS_APP_ID')
  static const String iosAppId = _EnvQA.iosAppId;

  @EnviedField(varName: 'IOS_PACKAGE_NAME')
  static const String iosAppPackageName = _EnvQA.iosAppPackageName;

  @EnviedField(varName: 'SENDER_ID')
  static const String senderId = _EnvQA.senderId;

  @EnviedField(varName: 'PROJECT_ID')
  static const String projectId = _EnvQA.projectId;
}
