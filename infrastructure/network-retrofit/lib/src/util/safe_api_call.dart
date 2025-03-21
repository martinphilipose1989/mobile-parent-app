import 'dart:io';

import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:network_retrofit/src/util/get_error.dart';
import 'package:retrofit/retrofit.dart';

Future<Either<NetworkError, T>> safeApiCall<T>(Future<T> apiCall) async {
  try {
    final originalResponse = await apiCall;
    final eitherResponse = originalResponse as HttpResponse<dynamic>;
    if (!eitherResponse.isSuccessful()) {
      return Left(getError(apiResponse: eitherResponse.response));
    } else {
      return Right(originalResponse);
    }
  } on Exception catch (throwable) {
    switch (throwable.runtimeType) {
      case DioException:
        switch ((throwable as DioException).type) {
          case DioExceptionType.connectionTimeout:
            return Left(NetworkError(
                message:
                    "Connection to API server failed due to internet connection",
                httpError: 503,
                cause: throwable));

          case DioExceptionType.sendTimeout:
            return Left(NetworkError(
                message:
                    "Connection to API server failed due to internet connection",
                httpError: 503,
                cause: throwable));

          case DioExceptionType.receiveTimeout:
            return Left(NetworkError(
                message:
                    "Connection to API server failed due to internet connection",
                httpError: 503,
                cause: throwable));

          case DioExceptionType.badResponse:
            return Left(getError(apiResponse: throwable.response!));
          //"Received invalid status code: ${error.response.statusCode}";
          case DioExceptionType.cancel:
            //"Request to API server was cancelled"
            break;
          case DioExceptionType.unknown:
            return Left(
              NetworkError(
                  message:
                      "Connection to API server failed due to internet connection",
                  httpError: 503,
                  cause: throwable),
            );
          case DioExceptionType.badCertificate:
            // TODO: Handle this case.
            break;
          case DioExceptionType.connectionError:
            return Left(
              NetworkError(
                  message:
                      "Connection to API server failed due to internet connection",
                  httpError: 503,
                  cause: throwable),
            );
        }

        break;

      case FormatException:
        return Left(
          NetworkError(
              message: "Response format is invalid.",
              httpError: 400,
              cause: throwable),
        );

      case IOException:
        return Left(NetworkError(
            message: throwable.toString(), httpError: 502, cause: throwable));

      case HttpException:
        final eitherResponse =
            (throwable as DioException).response as HttpResponse<dynamic>;
        return Left(getError(apiResponse: eitherResponse.response));

      default:
        return Left(NetworkError(
            message: throwable.toString(), httpError: 502, cause: throwable));
    }
    return Left(NetworkError(
        message: throwable.toString(), httpError: 502, cause: throwable));
  }
}

extension RetrofitResponse on HttpResponse {
  /// Returns true if the code is in [200..300), which means the request was successfully received,
  /// understood, and accepted.
  bool isSuccessful() {
    // return response.statusCode! >= 200 && response.statusCode! < 300;
    return response.statusCode! >= 200 && response.statusCode! < 300;
  }
}
