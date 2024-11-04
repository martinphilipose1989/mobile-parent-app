import 'dart:developer';

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
    log("message ${options.uri.path}");
    // if (options.uri.path.contains("gatepass/cross-platform/create")) {
    //   options.headers.remove("Authorization");
    //   // options.headers.putIfAbsent(
    //   //     "Authorization",
    //   //     () =>
    //   //         "Bearer daab45fc5eeed66cf456080a8300a68ca564b924891e154f5f36c80438873b6e70932225dac1bdf9e9e60e82bba5edbf4130ddcf9722ed148d5952a5bb059a514375393817e57c43d97a85dfca549a53a61e080f3eb57d18bf4555bee35b71d19e591649c45b2c2d93018930d9cab082a9a85bb888ab0aed2ccb9f1119e53933");
    // }

    if (options.uri.path.contains('api')) {
      options.headers.putIfAbsent("Authorization", () => "Bearer $mdmToken");
    }

    if (options.uri.path.contains('marketing')) {
      final token = await sharedPreferencesService
          .getFromDisk(sharedPreferencesService.accessTokenKey);
      if (token != null && token.isNotEmpty) {
        options.headers.putIfAbsent("Authorization", () => token);
      }
    }

    if (options.uri.path.contains('/api')) {
      log("Query params: ${options.listFormat}");
      if (options.uri.path.contains("%5B") ||
          options.uri.path.contains("%5D")) {
        String updatedUri = options.uri.toString();
        updatedUri = updatedUri.replaceAll("%5B", "[").replaceAll("%5D", "]");
        options.path = Uri.parse(updatedUri).path;
      }
    }

    return handler.next(options);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    handler.next(response);
  }
}
