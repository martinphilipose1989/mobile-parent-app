import 'package:data/data.dart';

abstract class NotificationPort {
  Future<Either<LocalError, void>> init();

  Future<Either<LocalError, void>> cancelAllLocalNotification();

  Future<Either<LocalError, void>> schedule(int id, String title, String body,
      DateTime scheduledDate, Map<String, dynamic> payload);

  Future<Either<LocalError, String>> getToken();

  Future<Either<LocalError, bool>> requestNotificationPermission();

  Future<Either<LocalError, void>> configurePushNotification();

  Future<Either<LocalError, void>> configureOnLaunchPushNotification();

  Future<Either<LocalError, Stream<NotificationMessage>>>
      listenPushNotification();

  Future<Either<LocalError, void>> unSubscribeToNotification();
}
