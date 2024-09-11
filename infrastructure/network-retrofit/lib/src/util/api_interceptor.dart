import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

class ApiInterceptor extends InterceptorsWrapper {
  final String apiKey;

  ApiInterceptor(
    @factoryParam this.apiKey,
  );

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.uri.path.contains('api')) {
      options.headers.putIfAbsent(
          "Authorization",
          () =>
              "Bearer 5620fa0ed0465c7aa2160fe952eb07c8c3d5dff1d0391b1caac8dad3d071c07c7a0585fada8acb0b7f03bb952a381d434a97a54ccc86bcfb4ba7f3310adf3d09094dfc18504da2a96f68c947d083e69c709da3d793cd4db7ae468976083f397b6354c571330500800db4254f96eb49d97518d92cf152c94f7f4dd34ade28dc06");
    }

    return handler.next(options);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    handler.next(response);
  }
}
