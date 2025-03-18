import 'dart:io';
import 'dart:math';
import 'package:shared/src/const/file_status_enum.dart';

class UploadFile {


  File? file;
  final String? name;
  final String? extention;
  final int? size;
  String id;
  FileStatusEnum? fileStatus;
  String? filePath;
  bool? isAdded;
  int? uniqueId;
  String uploadFilePath;
  String uploadedFileUrl;
  UploadFile(
      {this.id = '',
      this.file,
      this.name,
      this.extention,
      this.size,
      this.fileStatus = FileStatusEnum.none,
      this.filePath = "",
      this.isAdded = true,
      this.uploadFilePath = '',
      this.uploadedFileUrl = ''}) {
    uniqueId = Random().nextInt(999999);
  }
}
