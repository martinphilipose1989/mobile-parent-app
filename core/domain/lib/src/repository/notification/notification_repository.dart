import 'package:domain/domain.dart';
import 'package:shared/shared.dart';

abstract class NotificationRepository{
  Future<Either<NetworkError, NotificationResponseModel>> getNotification(
      {required NotificationRequestModel notificationRequestModel});


}