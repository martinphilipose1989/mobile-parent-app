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

  @EnviedField(varName: 'DISCIPLINARY_BASE_URL')
  static const String disciplinarySlip = _EnvQA.disciplinarySlip;
}
