import 'dart:io';
import 'dart:typed_data';

import 'package:app/myapp.dart';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

class FileDownloader {
  static downloadFile({required Uint8List fileData}) async {
    try {
      Directory? directory;
      if (Platform.isAndroid) {
        directory = Directory('/storage/emulated/0/Download');
      } else {
        directory = await getApplicationDocumentsDirectory();
      }
      final fullPath = directory.path;
      final fileName = '${DateTime.now().millisecondsSinceEpoch}.pdf';
      final file = File('$fullPath/$fileName');
      await file.writeAsBytes(fileData);
      // isLoading.value = false;
      OpenFilex.open(file.path);
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
            content: Text('File downloaded successfully at: ${file.path}')),
      );
    } catch (e) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }
}
