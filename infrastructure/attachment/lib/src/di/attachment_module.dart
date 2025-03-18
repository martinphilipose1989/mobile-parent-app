import 'package:attachment/attachment.dart';
import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AttachmentModule {
  @singleton
  FilePicker providerFilePicker() => FilePicker.platform;

  @singleton
  ImagePicker provideImagePicker() => ImagePicker();

  @lazySingleton
  AttachmentPort providerAttachmentAdapter(
      FilePicker filePicker, ImagePicker imagePicker, Dio dio) {
    return AttachmentAdapter(filePicker, imagePicker, dio);
  }
}
