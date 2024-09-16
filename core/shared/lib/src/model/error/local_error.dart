import 'package:shared/shared.dart';

class LocalError extends BaseError {
  final ErrorType errorType;

  LocalError(
      {required this.errorType,
      required String message,
      required Exception cause})
      : super(error: ErrorInfo(message: message), cause: cause);

  @override
  String getFriendlyMessage() {
    return error.message;
  }

  @override
  AppError transform() {
    switch (errorType) {
      case ErrorType.fileSizeExceed:
        return AppError(
            error: error, throwable: cause, type: ErrorType.fileSizeExceed);

      case ErrorType.filePickerFailed:
        return AppError(
            error: error, throwable: cause, type: ErrorType.filePickerFailed);

      case ErrorType.imagePickerFailed:
        print("==case=imagePickerFailed=");
        return AppError(
            error: error, throwable: cause, type: ErrorType.imagePickerFailed);

      case ErrorType.imagePickerCancelled:
        print("==case=imagePickerCancelled=");
        return AppError(
            error: error,
            throwable: cause,
            type: ErrorType.imagePickerCancelled);
      default:
        return AppError(
            error: error, throwable: cause, type: ErrorType.iOException);
    }
  }
}
