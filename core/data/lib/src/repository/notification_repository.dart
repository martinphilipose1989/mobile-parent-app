import '../../data.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NetworkPort networkPort;
  final NotificationPort notificationPort;

  NotificationRepositoryImpl(
      {required this.networkPort, required this.notificationPort});

  @override
  Future<Either<NetworkError, NotificationResponseModel>> getNotification(
      {required NotificationRequestModel notificationRequestModel}) {
    return networkPort.getNotification(
        notificationRequestModel: notificationRequestModel);
  }

  @override
  Future<Either<BaseError, void>> configureOnLaunchPushNotification() {
    return notificationPort.configureOnLaunchPushNotification();
  }

  @override
  Future<Either<BaseError, void>> configurePushNotification() async {
    return await notificationPort.configurePushNotification();
  }

  @override
  Future<Either<BaseError, String>> getToken() {
    return notificationPort.getToken();
  }

  @override
  Future<Either<BaseError, void>> initLocalNotification() {
    return notificationPort.init();
  }

  @override
  Future<Either<BaseError, Stream<NotificationMessage>>>
      listenPushNotification() {
    return notificationPort.listenPushNotification();
  }

  @override
  Future<Either<BaseError, bool>> requestNotificationPermission() {
    return notificationPort.requestNotificationPermission();
  }

  @override
  Future<Either<BaseError, void>> schedule(
      {required int id,
      required String title,
      required String body,
      required DateTime scheduledDate,
      required Map<String, dynamic> payload}) {
    return notificationPort.schedule(id, title, body, scheduledDate, payload);
  }

  @override
  Future<Either<BaseError, void>> unSubscribeToNotification() {
    return notificationPort.unSubscribeToNotification();
  }

  @override
  Future<Either<BaseError, bool>> updateDeviceInfo(String appVersion) {
    // TODO: implement updateDeviceInfo
    throw UnimplementedError();
  }
}
