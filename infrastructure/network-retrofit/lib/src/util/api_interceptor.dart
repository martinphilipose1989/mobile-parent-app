import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

class ApiInterceptor extends QueuedInterceptorsWrapper {
  final String apiKey;
  final String mdmToken;
  ApiInterceptor(@factoryParam this.apiKey, @factoryParam this.mdmToken);

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.uri.path.contains('api')) {
      options.headers.putIfAbsent("Authorization", () => "Bearer $mdmToken");
    }

    return handler.next(options);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    handler.next(response);
  }
}
