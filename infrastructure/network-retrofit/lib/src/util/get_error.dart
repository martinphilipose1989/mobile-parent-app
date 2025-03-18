import 'dart:convert';
import 'dart:developer';

import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:network_retrofit/src/model/error/error_entity.dart';

NetworkError getError({required Response apiResponse}) {
  if (apiResponse.data != null) {
    try {
      dynamic responseData;
      if (apiResponse.data is List<int>) {
        responseData = apiResponse.data is List<int>
            ? json.decode(utf8.decode(apiResponse.data)) // Decode binary data
            : apiResponse.data;
      }

      log("responseData ===> $responseData");
      final ErrorEntity errorResponseEntity =
          ErrorEntity.fromJson(responseData ?? apiResponse.data);
      return NetworkError(
        httpError: errorResponseEntity.errorCode ?? 1000,
        message:
            errorResponseEntity.errorMessage ?? errorResponseEntity.error ?? '',
        cause: Exception("Server Response Error"),
      );
    } catch (exception) {
      // exception.debugPrintStackTrace();
      return NetworkError(
          cause: Exception("Server Response Error"),
          httpError: apiResponse.statusCode!,
          message: apiResponse.statusMessage!);
    }
  } else {
    return NetworkError(
        cause: Exception("Server Response Error"),
        httpError: apiResponse.statusCode!,
        message: apiResponse.statusMessage!);
  }
}
