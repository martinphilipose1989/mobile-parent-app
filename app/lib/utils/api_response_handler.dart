import 'package:app/errors/flutter_toast_error_presenter.dart';
import 'package:app/model/resource.dart';
import 'package:app/myapp.dart';
import 'package:domain/domain.dart';
import 'package:flutter_errors/flutter_errors.dart';

import 'request_manager.dart';

abstract class ApiResponseHandler {
  static void apiCallHandler<P extends Params, T, E extends BaseError>(
      {required FlutterExceptionHandlerBinder exceptionHandlerBinder,
      required FlutterToastErrorPresenter flutterToastErrorPresenter,
      required P params,
      required Future<Either<E, T>> Function(P) createCall,
      required void Function(T?) onSuccess,
      required void Function(AppError?) onError}) {
    exceptionHandlerBinder.handle(block: () {
      RequestManager<T>(
        params,
        createCall: () => createCall(params),
      ).asFlow().listen((result) {
        if (result.status == Status.success) {
          onSuccess(result.data);
        } else if (result.status == Status.error) {
          onError(result.dealSafeAppError);
          _displayError(
              appError: result.dealSafeAppError,
              exceptionHandlerBinder: exceptionHandlerBinder,
              flutterToastErrorPresenter: flutterToastErrorPresenter);
        }
      }).onError((error) {
        // exceptionHandlerBinder.showError(error!);

        if (error is NetworkError) {
          onError(
            AppError(
                throwable: Exception(),
                error: error.error,
                type: ErrorType.netServerMessage),
          );
        }
      });
    }).execute();
  }

  static void _displayError(
      {required AppError? appError,
      required FlutterExceptionHandlerBinder exceptionHandlerBinder,
      required FlutterToastErrorPresenter flutterToastErrorPresenter}) {
    switch (appError?.error.code) {
      case 401:
        flutterToastErrorPresenter.show(appError!.throwable,
            navigatorKey.currentContext!, "Session Expired please login again");

      case 408: // Connection Timeout
        flutterToastErrorPresenter.show(
            appError!.throwable,
            navigatorKey.currentContext!,
            "It seems the connection is taking too long.");

      case 499:
      // flutterToastErrorPresenter.show(
      //     appError!.throwable,
      //     navigatorKey.currentContext!,
      //     "Your request was cancelled. If this was a mistake, please try again.");

      case 503:
        flutterToastErrorPresenter.show(
            appError!.throwable,
            navigatorKey.currentContext!,
            "Something went wrong. Service unavailable");

      case 495: // Bad Certificate
        flutterToastErrorPresenter.show(
            appError!.throwable,
            navigatorKey.currentContext!,
            "We couldn't verify the server's security certificate. Please ensure you're on a secure network.");

      default: // Any other error code
        flutterToastErrorPresenter.show(
            appError!.throwable,
            navigatorKey.currentContext!,
            appError.error.message.isNotEmpty
                ? appError.error.message
                : "An unexpected error occurred. Please try again later.");
    }
  }
}
