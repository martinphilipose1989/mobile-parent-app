// ignore_for_file: unused_field

import 'dart:developer';
import 'dart:io';

import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class AttachmentAdapter implements AttachmentPort {
  final FilePicker _filePicker;
  final ImagePicker _imagePicker;
  final Dio _dioClient;

  AttachmentAdapter(this._filePicker, this._imagePicker, this._dioClient);

  String basename(String path) {
    // Normalize the path to handle both Windows and Unix-style paths
    var normalizedPath = path.replaceAll('\\', '/');

    // Split the path by the separator and get the last element
    return normalizedPath.split('/').last;
  }

  @override
  Future<UploadFile> clickImage() async {
    try {
      XFile? imageFile = await _imagePicker.pickImage(
          source: ImageSource.camera, imageQuality: 70);
      if (imageFile != null) {
        var platformFile = File(imageFile.path);
        if (platformFile.lengthSync() > 5242880) {
          throw LocalError(
            errorType: ErrorType.fileSizeExceed,
            message: "",
            cause: Exception(ErrorType.fileSizeExceed.name),
          );
        }

        return UploadFile(
            file: File(platformFile.path),
            name: basename(platformFile.path),
            extention: basename(platformFile.path).split(".")[1],
            size: platformFile.lengthSync(),
            filePath: platformFile.path);
      } else {
        log("message");
        throw Exception(ErrorType.imagePickerCancelled.name);
      }
    } catch (e) {
      if ((e.toString() ==
          Exception(ErrorType.imagePickerCancelled.name).toString())) {
        throw LocalError(
          errorType: ErrorType.imagePickerCancelled,
          message: '',
          cause: Exception(ErrorType.imagePickerCancelled.name),
        );
      } else {
        throw LocalError(
          errorType: ErrorType.imagePickerFailed,
          message: '',
          cause: Exception(ErrorType.imagePickerFailed.name),
        );
      }
    }
  }

  @override
  Future<UploadFile> pickFile(
      {FileType type = FileType.custom,
      List<String> allowedExtensions = const [
        'jpg',
        'jpeg',
        'png',
      ]}) async {
    try {
      FilePickerResult? filePickerResult = await _filePicker.pickFiles(
          type: type, allowedExtensions: allowedExtensions);
      if (filePickerResult != null) {
        var platformFile = filePickerResult.files.first;
        if (platformFile.size > 5242880) {
          throw LocalError(
            errorType: ErrorType.fileSizeExceed,
            message: '',
            cause: Exception(ErrorType.fileSizeExceed.name),
          );
        }
        return UploadFile(
            file: File(platformFile.path ?? ""),
            name: platformFile.name,
            extention: platformFile.extension,
            size: platformFile.size,
            filePath: platformFile.path);
      } else {
        throw LocalError(
          errorType: ErrorType.filePickerFailed,
          message: '',
          cause: Exception(ErrorType.filePickerFailed.name),
        );
      }
    } catch (e) {
      throw LocalError(
          errorType: ErrorType.filePickerFailed,
          message: "",
          cause: Exception(ErrorType.filePickerFailed.name));
    }
  }

  @override
  Future<UploadFile> pickImageFromLocal() async {
    try {
      XFile? imageFile = await _imagePicker.pickImage(
          source: ImageSource.gallery, imageQuality: 70);
      if (imageFile != null) {
        final platformFile = File(imageFile.path);
        if (platformFile.lengthSync() > 5242880) {
          throw LocalError(
            errorType: ErrorType.fileSizeExceed,
            message: '',
            cause: Exception(ErrorType.fileSizeExceed.name),
          );
        }
        return UploadFile(
            file: File(platformFile.path),
            name: basename(platformFile.path),
            extention: basename(platformFile.path).split(".")[1],
            size: platformFile.lengthSync(),
            filePath: platformFile.path);
      } else {
        throw Exception(ErrorType.imagePickerCancelled.name);
      }
    } catch (e) {
      if ((e.toString() ==
          Exception(ErrorType.imagePickerCancelled.name).toString())) {
        throw LocalError(
          errorType: ErrorType.imagePickerCancelled,
          message: '',
          cause: Exception(ErrorType.imagePickerCancelled.name),
        );
      } else {
        throw LocalError(
          errorType: ErrorType.imagePickerFailed,
          message: '',
          cause: Exception(ErrorType.imagePickerFailed.name),
        );
      }
    }
  }
}
