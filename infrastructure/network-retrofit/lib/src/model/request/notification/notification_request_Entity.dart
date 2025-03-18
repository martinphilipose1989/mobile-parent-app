import 'package:data/data.dart';

import '../../../../network_retrofit.dart';
part 'notification_request_Entity.g.dart';

@JsonSerializable()
class NotificationRequestEntity implements BaseLayerDataTransformer<NotificationRequestEntity,NotificationRequestModel>{
  @JsonKey(name: "user_id")
  int? userId;
  @JsonKey(name: "user_type")
  int? userType;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "limit")
  int? limit;
  @JsonKey(name: "page")
  int? page;

  NotificationRequestEntity({
   required this.userId,
   required this.userType,
   required this.type,
   required this.limit,
  required  this.page,
  });

  factory NotificationRequestEntity.fromJson(Map<String, dynamic> json) => _$NotificationRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationRequestEntityToJson(this);

  @override
  NotificationRequestEntity restore(NotificationRequestModel data) {
  return NotificationRequestEntity(userId: userId, userType: userType, type: type, limit: limit, page: page);
  }

  @override
  NotificationRequestModel transform() {
    // TODO: implement transform
    throw UnimplementedError();
  }
}
