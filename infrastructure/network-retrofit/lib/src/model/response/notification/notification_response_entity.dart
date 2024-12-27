import 'package:data/data.dart';

import '../../../../network_retrofit.dart';
part 'notification_response_entity.g.dart';
@JsonSerializable()
class NotificationResponseEntity implements BaseLayerDataTransformer<NotificationResponseEntity,NotificationResponseModel> {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "data")
  NotificationDataEntity? data;
  @JsonKey(name: "message")
  String? message;

  NotificationResponseEntity({
    this.status,
    this.data,
    this.message,
  });

  factory NotificationResponseEntity.fromJson(Map<String, dynamic> json) => _$NotificationResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationResponseEntityToJson(this);

  @override
  NotificationResponseEntity restore(NotificationResponseModel data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  NotificationResponseModel transform() {
   return NotificationResponseModel(status: status,data: data?.transform(),message: message);
  }
}

@JsonSerializable()
class NotificationDataEntity implements BaseLayerDataTransformer<NotificationDataEntity,NotificationData>{
  @JsonKey(name: "data")
  List<NotificationDetailEntity>? data;
  @JsonKey(name: "totalCount")
  int? totalCount;

  NotificationDataEntity({
    this.data,
    this.totalCount,
  });

  factory NotificationDataEntity.fromJson(Map<String, dynamic> json) => _$NotificationDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationDataEntityToJson(this);

  @override
  NotificationDataEntity restore(NotificationData data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  NotificationData transform() {
  return NotificationData( data: data?.map((e) => e.transform()).toList(),totalCount: totalCount);
  }
}

@JsonSerializable()
class NotificationDetailEntity implements BaseLayerDataTransformer<NotificationDetailEntity,NotificationDetail>{
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "read_at")
  dynamic readAt;
  @JsonKey(name: "user_id")
  int? userId;
  @JsonKey(name: "user_type")
  int? userType;
  @JsonKey(name: "group_id")
  int? groupId;
  @JsonKey(name: "mode")
  ModeEntity? mode;
  @JsonKey(name: "communication_master_id")
  String? communicationMasterId;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;
  @JsonKey(name: "__v")
  int? v;

  NotificationDetailEntity({
    this.id,
    this.readAt,
    this.userId,
    this.userType,
    this.groupId,
    this.mode,
    this.communicationMasterId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory NotificationDetailEntity.fromJson(Map<String, dynamic> json) => _$NotificationDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationDetailEntityToJson(this);

  @override
  NotificationDetailEntity restore(NotificationDetail data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  NotificationDetail transform() {
 return NotificationDetail(id: id, readAt: readAt, userId: userId, userType: userType, groupId: groupId, mode: mode?.transform(), communicationMasterId: communicationMasterId, createdAt: createdAt, updatedAt: updatedAt, v: v);
  }
}

@JsonSerializable()
class ModeEntity  implements BaseLayerDataTransformer<ModeEntity,Mode>{
  @JsonKey(name: "6729de5d0c694d10cd79d2f1")
  ModeContentEntity? modeContentEntity;

  ModeEntity({
    this.modeContentEntity,
  });

  factory ModeEntity.fromJson(Map<String, dynamic> json) => _$ModeEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ModeEntityToJson(this);

  @override
  ModeEntity restore(Mode data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  Mode transform() {
  return Mode(modeContent: modeContentEntity?.transform());
  }
}

@JsonSerializable()
class  ModeContentEntity implements BaseLayerDataTransformer<ModeContentEntity,ModeContent>{
  @JsonKey(name: "subject")
  String? subject;
  @JsonKey(name: "content")
  String? content;

  ModeContentEntity({
    this.subject,
    this.content,
  });

  factory ModeContentEntity.fromJson(Map<String, dynamic> json) => _$ModeContentEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ModeContentEntityToJson(this);

  @override
  ModeContentEntity restore(ModeContent data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  ModeContent transform() {
 return ModeContent(subject: subject,content: content);
  }
}
