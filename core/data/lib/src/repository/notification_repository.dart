import '../../data.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NetworkPort networkPort;

  NotificationRepositoryImpl({required this.networkPort});

  @override
  Future<Either<NetworkError, NotificationResponseModel>> getNotification({required NotificationRequestModel notificationRequestModel}) {
  return networkPort.getNotification(notificationRequestModel: notificationRequestModel);
  }

}