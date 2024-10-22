import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:network_retrofit/src/model/error/error_entity.dart';

NetworkError getError({required Response apiResponse}) {
  if (apiResponse.data != null) {
    try {
      final ErrorEntity errorResponseEntity =
          ErrorEntity.fromJson(apiResponse.data);
      return NetworkError(
        httpError: errorResponseEntity.errorCode?? 1000,
        message: errorResponseEntity.error??errorResponseEntity.errorMessage??'',
        cause: Exception("Server Response Error"),
      );
    } catch (exception) {
      // exception.printStackTrace();
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
