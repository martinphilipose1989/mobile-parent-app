import 'package:data/data.dart';
import 'package:file_picker/file_picker.dart';
import 'package:file_utility/file_utility.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FileUtilityModule {
  @singleton
  FilePicker provideFilePicker() => FilePicker.platform;

  @lazySingleton
  FileUtilityPort providerAppPersistentAdapter(FilePicker filePicker) {
    return FileUtilityAdapter(filePicker);
  }
}
