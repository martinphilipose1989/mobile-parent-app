import 'package:dio/dio.dart';
import 'package:network_retrofit/src/model/request/notification/notification_request_Entity.dart';
import 'package:network_retrofit/src/model/response/notification/notification_response_entity.dart';
import 'package:retrofit/retrofit.dart';
part 'notification_service.g.dart';

@RestApi()
abstract class  NotificationSerivce {
  factory NotificationSerivce(Dio dio, {String? notificationUrl}) {
    return _NotificationSerivce(dio, baseUrl: notificationUrl);
  }

  @POST('notification/notification-to-user/by-user')
  Future<HttpResponse<NotificationResponseEntity>> getNotification(
      {@Body() required NotificationRequestEntity
      notificationRequestEntity});


}