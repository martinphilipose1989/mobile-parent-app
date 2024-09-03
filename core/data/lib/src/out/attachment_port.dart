import 'package:domain/domain.dart';
import 'package:file_picker/file_picker.dart';

abstract class AttachmentPort {
  Future<UploadFile> clickImage();
  Future<UploadFile> pickImageFromLocal();
  Future<UploadFile> pickFile(
      {FileType type = FileType.custom, List<String> allowedExtensions});
}
