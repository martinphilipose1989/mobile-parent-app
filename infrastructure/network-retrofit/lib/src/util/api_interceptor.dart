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
              "Bearer daab45fc5eeed66cf456080a8300a68ca564b924891e154f5f36c80438873b6e70932225dac1bdf9e9e60e82bba5edbf4130ddcf9722ed148d5952a5bb059a514375393817e57c43d97a85dfca549a53a61e080f3eb57d18bf4555bee35b71d19e591649c45b2c2d93018930d9cab082a9a85bb888ab0aed2ccb9f1119e53933");
    }

    return handler.next(options);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    handler.next(response);
  }
}
