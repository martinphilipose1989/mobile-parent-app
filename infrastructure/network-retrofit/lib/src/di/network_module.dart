import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:network_retrofit/src/network_adapter.dart';
import 'package:network_retrofit/src/services/admin_retorfit_service.dart';
import 'package:network_retrofit/src/services/finance_retrofit_service.dart';
import 'package:network_retrofit/src/services/retrofit_service.dart';
import 'package:network_retrofit/src/util/api_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class NetworkModule {
  @singleton
  BaseOptions providerBaseConfig(
    @Named('BaseUrl') String url,
  ) =>
      BaseOptions(baseUrl: url);

  @singleton
  PrettyDioLogger providerPrettyLogger() => PrettyDioLogger(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        logPrint: (log) {
          return print(log as String);
        },
      );

  @singleton
  CurlLoggerDioInterceptor provideCurlLogger() =>
      CurlLoggerDioInterceptor(printOnSuccess: true);

  @singleton
  ApiInterceptor provideApiInterceptor(
          @Named("ApiKey") String apiKey, @Named('mdmToken') String mdmToken) =>
      ApiInterceptor(apiKey, mdmToken);

  @singleton
  List<Interceptor> providerInterceptors(
          PrettyDioLogger logger,
          ApiInterceptor apiInterceptor,
          CurlLoggerDioInterceptor curlInterceptor) =>
      <Interceptor>[apiInterceptor, logger, curlInterceptor];

  @lazySingleton
  Dio providerDio(BaseOptions options, List<Interceptor> interceptors) {
    Dio dio = Dio(options);
    dio.interceptors.addAll(
      interceptors,
    );
    return dio;
  }

  @lazySingleton
  RetrofitService providerRetrofitService(
          Dio dio,
          @Named('mdmBaseUrl') String mdmBaseUrl,
          @Named('financeBaseUrl') String financeBaseUrl) =>
      RetrofitService(dio,
          financeBaseUrl: financeBaseUrl, mdmBaseUrl: mdmBaseUrl);

  @lazySingleton
  FinanceRetrofitService providerFinanceRetrofitService(
          Dio dio, @Named('financeBaseUrl') String financeBaseUrl) =>
      FinanceRetrofitService(
        dio,
        financeBaseUrl: financeBaseUrl,
      );

  @lazySingleton
  AdminRetorfitService providerAdminFinanceRetrofitService(
          Dio dio, @Named('adminBaseUrl') String adminBaseUrl) =>
      AdminRetorfitService(dio, adminBaseUrl: adminBaseUrl);

  @lazySingleton
  NetworkPort providerNetworkService(
          RetrofitService retrofitService,
          FinanceRetrofitService financeRetrofitService,
          AdminRetorfitService adminRetorfitService) =>
      NetworkAdapter(
          adminRetorfitService: adminRetorfitService,
          apiService: retrofitService,
          financeRetrofitService: financeRetrofitService);
}
