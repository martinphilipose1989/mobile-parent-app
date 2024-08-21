import 'dart:io';

import 'package:data/data.dart';
import 'package:file_picker/file_picker.dart';
class FileUtilityAdapter  extends FileUtilityPort{
  final FilePicker _filePicker;

  FileUtilityAdapter(this._filePicker);

  @override
  Future<Either<AppError, File>> pickFile({
    FileType? type,
    List<String>? allowedExtensions,
  }) async {
    FilePickerResult? filePickerResult = await _filePicker.pickFiles(
        type: type ?? FileType.custom,
        allowedExtensions: allowedExtensions ??
            const [
              'jpg',
              'jpeg',
              'png',
              'doc',
              'pdf',
            ]);

    if (filePickerResult != null) {
      var platformFile = filePickerResult.files.first;
      if (platformFile.size > 1000000 * 10) {
        return Left(AppError(
          error: ErrorInfo(message: "File size should he less than 10MB"),
          throwable: Exception("File size should he less than 10MB"),
          type: ErrorType.filePickerFailed
        ));
      }
      return Right(File(platformFile.path ?? ""));
    } else {
      return Left(AppError(
        error: ErrorInfo(message: "Failed to fetch File"),
        throwable: Exception("Failed to fetch File"),
        type: ErrorType.filePickerFailed
      ));
    }
  }
}