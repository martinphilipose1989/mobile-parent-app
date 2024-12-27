import 'dart:io';

import 'package:geolocator/geolocator.dart';
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

  Future<bool> requestLocationPermission(
      Function(bool value) onPermanentlyClosedCall) async {
    PermissionStatus status = await Permission.location.request();

    if (!status.isGranted) {
      onPermanentlyClosedCall.call(true);
    } else {
      Position position = await getUserLocation();

      return true;
    }
    return false;
  }

  Future<Position> getUserLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // If location services are not enabled, ask the user to enable them
      await Geolocator.openLocationSettings();
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Stream<Position> liveLocation() {
    const LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      // distanceFilter: 5,
      timeLimit: Duration(minutes: 2),
    );
    return Geolocator.getPositionStream(locationSettings: locationSettings);
  }
}
