import 'dart:io';

import 'package:data/data.dart';

abstract class FileUtilityPort{
  Future<Either<AppError, File?>> pickFile({List<String>? allowedExtensions,}); 
}