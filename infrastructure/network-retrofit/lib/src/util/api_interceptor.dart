import 'dart:developer';

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
    if(options.uri.path.contains('marketing')){
      options.headers.putIfAbsent(
          "Authorization",
          () =>
              "Bearer eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJ5RHRLNkNTbjE1ZFprdU96R0xqYjR3ZGU3UHlhWExtN3JENW1UNm5HUWdnIn0.eyJleHAiOjE3MjQwNDY0MTYsImlhdCI6MTcyNDA0MjgxNiwianRpIjoiMmIyMWFmNmUtMzY3Mi00ZDIzLWI5Y2YtY2ZlZDQ5OTlkOTcwIiwiaXNzIjoiaHR0cHM6Ly9xYS52Z29zLm9yZy9yZWFsbXMvYW1wZXJzYW5kLWludGVybmFsLXFhIiwiYXVkIjoiYWNjb3VudCIsInN1YiI6ImQwNGM1OTNkLWZjMzUtNDFhYy1hZWQzLTJjYmE4ZTA4YWJmNiIsInR5cCI6IkJlYXJlciIsImF6cCI6Im1hcmtldGluZyIsInNlc3Npb25fc3RhdGUiOiJjMGE2YjZlYy03YTA1LTQ3YzEtYTc1Ni03ODEzMTFkNzlkMzYiLCJhY3IiOiIxIiwiYWxsb3dlZC1vcmlnaW5zIjpbImh0dHBzOi8vbWFya2V0aW5nLXIyNnNwM21pYnEtdWMuYS5ydW4uYXBwIiwiaHR0cHM6Ly9hZG1pbi1wYW5lbC1iYWNrZW5kLXIyNnNwM21pYnEtdWMuYS5ydW4uYXBwIiwiaHR0cHM6Ly9mcm9udGVuZC1tYXJrZXRpbmctcjI2c3AzbWlicS11Yy5hLnJ1bi5hcHAiXSwicmVhbG1fYWNjZXNzIjp7InJvbGVzIjpbImRlZmF1bHQtcm9sZXMtYWQtaW50cmVncmF0aW9uLXRlc3QiLCJvZmZsaW5lX2FjY2VzcyIsInVtYV9hdXRob3JpemF0aW9uIl19LCJyZXNvdXJjZV9hY2Nlc3MiOnsiYWNjb3VudCI6eyJyb2xlcyI6WyJtYW5hZ2UtYWNjb3VudCIsIm1hbmFnZS1hY2NvdW50LWxpbmtzIiwidmlldy1wcm9maWxlIl19fSwic2NvcGUiOiJvcGVuaWQgcHJvZmlsZSBlbWFpbCIsInNpZCI6ImMwYTZiNmVjLTdhMDUtNDdjMS1hNzU2LTc4MTMxMWQ3OWQzNiIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwibmFtZSI6IkRhbmlrIFNoZXJhIFNoZXJhIiwicHJlZmVycmVkX3VzZXJuYW1lIjoiZGFuaWsuc2hlcmEiLCJnaXZlbl9uYW1lIjoiRGFuaWsgU2hlcmEiLCJmYW1pbHlfbmFtZSI6IlNoZXJhIiwiZW1haWwiOiJkYW5pay5zaGVyYUBhbXBlcnNhbmRncm91cC5pbiJ9.B_L8nnfv1DohpSmZsPNTORps_uxUu0umjS9V_GkLlfHp5CSyP8h1Fu7Dv5GGUoEk4nTMumR3htqAcSYpRdWyp42lOXiUrVAY5bMi_ASdNkA2NBNu8OO2GORMV0envY8ka-Wgy7oTyhdtyU5G2g7Uh3uMdgZcmNFXYwd6yTmTjTm-qWtn2np4hDxC_-gp0EQGz6WsOJZXcJ7k2d4U4ViRjPKLGxSGDGUwWURr8Q8yo_AcHocnFpy6HV4YevWx6mxdFfEMvT8sX8t8cHw95Cv6Ooj4u5woBBoeF3tVpdCTLmjFH0ZVl4TKF4KgdEhzdJrJmrMDmdZA_IOJ1_G_uC7uiA");
    }

    if(options.uri.path.contains('/api')){
      log("Query params: ${options.listFormat}");
      if (options.uri.path.contains("%5B") || options.uri.path.contains("%5D")) {
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
