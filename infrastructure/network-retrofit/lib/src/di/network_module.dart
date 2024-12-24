import 'package:alice/core/alice_dio_interceptor.dart';
import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:network_retrofit/src/network_adapter.dart';
import 'package:network_retrofit/src/services/admin_retorfit_service.dart';
import 'package:network_retrofit/src/services/disciplinary_retrofit_services.dart';
import 'package:network_retrofit/src/services/finance_retrofit_service.dart';
import 'package:network_retrofit/src/services/gatemanagement_retrofit_service.dart';
import 'package:network_retrofit/src/services/keycloak_service.dart';
import 'package:network_retrofit/src/services/marketing_retrofit_serivce.dart';
import 'package:network_retrofit/src/services/notification_service.dart';
import 'package:network_retrofit/src/services/retrofit_service.dart';
import 'package:network_retrofit/src/services/ticket_retrofit_service.dart';
import 'package:network_retrofit/src/services/transport_service.dart';
import 'package:network_retrofit/src/util/api_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:alice/alice.dart';

import '../services/attendance_retrofit_service.dart';

@module
abstract class NetworkModule {
  @singleton
  BaseOptions providerBaseConfig(
    @Named('BaseUrl') String url,
  ) =>
      BaseOptions(baseUrl: url);

  @singleton
  PrettyDioLogger providerPrettyLogger(@Named('ShowLogs') bool showLogs) =>
      PrettyDioLogger(
        request: showLogs,
        requestBody: showLogs,
        requestHeader: showLogs,
        responseBody: showLogs,
        responseHeader: showLogs,
        logPrint: (log) {
          return print(log as String);
        },
      );

  @singleton
  CurlLoggerDioInterceptor provideCurlLogger(
          @Named('ShowLogs') bool showLogs) =>
      CurlLoggerDioInterceptor(printOnSuccess: showLogs);

  @singleton
  ApiInterceptor provideApiInterceptor(
          @Named("ApiKey") String apiKey, @Named('mdmToken') String mdmToken) =>
      ApiInterceptor(apiKey, mdmToken);

  @singleton
  Alice provideAlice(@Named('ShowLogs') bool showLogs) =>
      Alice(showNotification: showLogs);

  @singleton
  AliceDioInterceptor provideAliceInterceptor(Alice alice) =>
      alice.getDioInterceptor();

  @singleton
  List<Interceptor> providerInterceptors(
          PrettyDioLogger logger,
          ApiInterceptor apiInterceptor,
          CurlLoggerDioInterceptor curlInterceptor,
          AliceDioInterceptor aliceDioInterceptor,
          @Named('ShowLogs') bool showLogs) =>
      <Interceptor>[
        apiInterceptor,
        if (showLogs == true) ...[
          logger,
          curlInterceptor,
          // REMOVE WHILE UAT OR RELEASE
          aliceDioInterceptor
        ]
      ];

  @lazySingleton
  Dio providerDio(BaseOptions options, List<Interceptor> interceptors) {
    Dio dio = Dio(options);

    dio.interceptors.addAll(interceptors);
    return dio;
  }

  @lazySingleton
  RetrofitService providerRetrofitService(
          Dio dio, @Named('mdmBaseUrl') String mdmBaseUrl) =>
      RetrofitService(dio, mdmBaseUrl: mdmBaseUrl);

  @lazySingleton
  FinanceRetrofitService providerFinanceRetrofitService(
          Dio dio, @Named('financeBaseUrl') String financeBaseUrl) =>
      FinanceRetrofitService(dio, financeBaseUrl: financeBaseUrl);
  @lazySingleton
  TicketRetrofitService providerTicketRetrofitService(
          Dio dio, @Named('ticketBaseUrl') String ticketingBaseUrl) =>
      TicketRetrofitService(dio, ticketingBaseUrl: ticketingBaseUrl);

  @lazySingleton
  AdminRetorfitService providerAdminFinanceRetrofitService(
          Dio dio, @Named('adminBaseUrl') String adminBaseUrl) =>
      AdminRetorfitService(dio, adminBaseUrl: adminBaseUrl);

  @lazySingleton
  DisciplinaryRetorfitService providerDisciplinaryeRetrofitService(
          Dio dio, @Named('disciplinarySlip') String disciplinaryBaseUrl) =>
      DisciplinaryRetorfitService(dio,
          disciplinaryBaseUrl: disciplinaryBaseUrl);

  @lazySingleton
  AttendanceRetorfitService providerAttendanceRetrofitService(
          Dio dio, @Named('attendance') String attendancebaseUrl) =>
      AttendanceRetorfitService(dio, attendanceBaseUrl: attendancebaseUrl);
  @lazySingleton
 NotificationSerivce notificationService(
      Dio dio, @Named('notificationUrl') String notificationBaseUrl) =>
      NotificationSerivce (dio, notificationUrl:  notificationBaseUrl);
  @lazySingleton
  TransportService providerTransportRetrofitService(
          Dio dio, @Named('transportUrl') String transportUrl) =>
      TransportService(dio, transportUrl: transportUrl);

  @lazySingleton
  KeyCloakService providerKeyCloakService(
          Dio dio, @Named('KeyCloakUrl') String keyCloak) =>
      KeyCloakService(dio, keyCloak: keyCloak);

  @lazySingleton
  GatemanagementService providerGatemanagementService(
          Dio dio, @Named('GateUrl') String gateUrl) =>
      GatemanagementService(dio, gateUrl: gateUrl);

  @lazySingleton
  MarketingSerivce providerMarketingSerivce(
          Dio dio, @Named('MarketingUrl') String marketingUrl) =>
      MarketingSerivce(dio, marketingUrl: marketingUrl);

  @lazySingleton
  NetworkPort providerNetworkService(
          RetrofitService retrofitService,
          FinanceRetrofitService financeRetrofitService,
          AdminRetorfitService adminRetorfitService,
          AttendanceRetorfitService attendanceRetorfitService,
          DisciplinaryRetorfitService disciplinaryRetorfitService,
          TransportService transportService,
          TicketRetrofitService ticketRetrofitService,
          KeyCloakService keyCloakService,
          GatemanagementService gatemanagementService,
          MarketingSerivce marketingSerivce,
      NotificationSerivce notificationService) =>
      NetworkAdapter(
          ticketRetrofitService: ticketRetrofitService,
          attendanceRetorfitService: attendanceRetorfitService,
          disciplinaryRetorfitService: disciplinaryRetorfitService,
          adminRetorfitService: adminRetorfitService,
          apiService: retrofitService,
          financeRetrofitService: financeRetrofitService,
          transportService: transportService,
          keyCloakService: keyCloakService,
          gatemanagementService: gatemanagementService,
          marketingSerivce: marketingSerivce, notificationSerivce: notificationService);
}
