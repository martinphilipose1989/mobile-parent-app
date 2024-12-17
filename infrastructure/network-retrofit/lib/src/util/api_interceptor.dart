import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:services/services.dart';

class ApiInterceptor extends QueuedInterceptorsWrapper {
  final String apiKey;
  final String mdmToken;
  final SecureStorageService sharedPreferencesService =
      GetIt.I<SecureStorageService>();
  ApiInterceptor(@factoryParam this.apiKey, @factoryParam this.mdmToken);

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.uri.path.contains('api')) {
      options.headers.putIfAbsent("Authorization", () => "Bearer $mdmToken");
      if (options.uri.path.contains("%5B") ||
          options.uri.path.contains("%5D")) {
        String updatedUri = options.uri.toString();
        updatedUri = updatedUri.replaceAll("%5B", "[").replaceAll("%5D", "]");
        options.path = Uri.parse(updatedUri).path;
      }
    } else {
      final token = await sharedPreferencesService
          .getFromDisk(sharedPreferencesService.accessTokenKey);
      if (token != null && token.isNotEmpty) {
        options.headers.putIfAbsent("Authorization", () => "Bearer $token");
      }
    }
    return handler.next(options);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);

    if (err.response?.statusCode == 401) {
      logoutOnTokenExpiry.add(true);
    }
  }
}
