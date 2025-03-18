import 'package:domain/domain.dart';

abstract class NotificationRepository {
  Future<Either<NetworkError, NotificationResponseModel>> getNotification(
      {required NotificationRequestModel notificationRequestModel});

  Future<Either<BaseError, String>> getToken();

  Future<Either<BaseError, bool>> requestNotificationPermission();

  Future<Either<BaseError, bool>> updateDeviceInfo(String appVersion);

  Future<Either<BaseError, void>> configurePushNotification();

  Future<Either<BaseError, void>> configureOnLaunchPushNotification();

  Future<Either<BaseError, void>> unSubscribeToNotification();

  Future<Either<BaseError, Stream<NotificationMessage>>>
      listenPushNotification();

  Future<Either<BaseError, void>> initLocalNotification();

  Future<Either<BaseError, void>> schedule(
      {required int id,
      required String title,
      required String body,
      required DateTime scheduledDate,
      required Map<String, dynamic> payload});
}
