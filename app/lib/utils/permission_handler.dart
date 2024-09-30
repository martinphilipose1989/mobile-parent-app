import 'dart:io';

import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';

class PermissionHandlerService {
  /// Check Camera permission and handle accordingly.
  Future<bool> checkCameraPermission(
      Function(bool value) onPermanentlyClosedCall) async {
    if (Platform.isAndroid) {
      var androidInfo = await DeviceInfoPlugin().androidInfo;
      var sdkInt = androidInfo.version.sdkInt;
      PermissionStatus status = PermissionStatus.denied;
      if (sdkInt >= 33) {
        status = await Permission.camera.request();
      } else {
        status = await Permission.storage.request();
      }
      if (!status.isGranted) {
        onPermanentlyClosedCall.call(true);
      } else {
        return true;
      }
      return false;
    } else if (Platform.isIOS) {
      PermissionStatus status = await Permission.camera.request();
      if (!status.isGranted) {
        onPermanentlyClosedCall.call(true);
      } else {
        return true;
      }
      return false;
    }
    return true;
  }

  /// Check Gallery (Photos) permission and handle accordingly.
  Future<bool> checkGalleryPermission(
      Function(bool value) onPermanentlyClosedCall) async {
    if (Platform.isAndroid) {
      var androidInfo = await DeviceInfoPlugin().androidInfo;
      var sdkInt = androidInfo.version.sdkInt;
      PermissionStatus status = PermissionStatus.denied;
      if (sdkInt >= 33) {
        status = await Permission.photos.request();
      } else {
        status = await Permission.storage.request();
      }
      if (!status.isGranted) {
        onPermanentlyClosedCall.call(true);
        return false;
      } else {
        return true;
      }
    } else if (Platform.isIOS) {
      PermissionStatus status = await Permission.photos.request();
      if (!status.isGranted) {
        onPermanentlyClosedCall.call(true);
      } else {
        return true;
      }
      return false;
    }
    return true;
  }
}
