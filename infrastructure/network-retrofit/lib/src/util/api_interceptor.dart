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
              "Bearer 75214ad5c3d2331322a1c325b9314c7877471339ef684ba9a3e18e0046d9772f7413abd35a0173060fab586c042d1760b33d52f5106283217513121e46406ec627b972ed842fc7e74439792667bea328e52974c406d1d80c1e855a3f56f393cdd3baa2f1ef2b437e5f20d27573284e66d2def3a9470c91d47d9ace09155a2a65");
    }

    return handler.next(options);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    handler.next(response);
  }
}
