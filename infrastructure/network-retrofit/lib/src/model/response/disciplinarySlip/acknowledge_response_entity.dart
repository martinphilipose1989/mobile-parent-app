import 'package:data/data.dart';

import '../../../../network_retrofit.dart';
part 'acknowledge_response_entity.g.dart';

@JsonSerializable()
class AcknowlegementResponseEntity implements BaseLayerDataTransformer<AcknowlegementResponseEntity,AcknowlegementResponseModel>{
  @JsonKey(name: "status")
  int status;
  @JsonKey(name: "data")
  AcknowledgeDataEntity data;
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "success")
  bool success;

  AcknowlegementResponseEntity({
    required this.status,
    required this.data,
    required this.message,
    required this.success,
  });

  factory AcknowlegementResponseEntity.fromJson(Map<String, dynamic> json) => _$AcknowlegementResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AcknowlegementResponseEntityToJson(this);

  @override
  AcknowlegementResponseEntity restore(AcknowlegementResponseModel data) {
    // TODO: implement restore
    throw UnimplementedError();

  }

  @override
  AcknowlegementResponseModel transform() {
  return AcknowlegementResponseModel(status: status,
      data:

      AcknowledgeData(studentWarningId: data.studentWarningId, userId: data.userId, acknowledgementRole: data.acknowledgementRole, acknowledgementDate: data.acknowledgementDate, id: data.id, createdAt: data.createdAt, updatedAt: data.updatedAt) ,message: message, success: success);
  }
}

@JsonSerializable()
class AcknowledgeDataEntity implements BaseLayerDataTransformer<AcknowledgeDataEntity, AcknowledgeData>{
  @JsonKey(name: "student_warning_id")
  int studentWarningId;
  @JsonKey(name: "user_id")
  int userId;
  @JsonKey(name: "acknowledgement_role")
  String acknowledgementRole;
  @JsonKey(name: "acknowledgement_date")
  DateTime acknowledgementDate;
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "created_at")
  DateTime createdAt;
  @JsonKey(name: "updated_at")
  DateTime updatedAt;

  AcknowledgeDataEntity({
    required this.studentWarningId,
    required this.userId,
    required this.acknowledgementRole,
    required this.acknowledgementDate,
    required this.id,
    required this.createdAt,
    required this.updatedAt,

  });

  factory AcknowledgeDataEntity.fromJson(Map<String, dynamic> json) => _$AcknowledgeDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AcknowledgeDataEntityToJson(this);

  @override
  AcknowledgeDataEntity restore(AcknowledgeData data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  AcknowledgeData transform() {
 return AcknowledgeData(studentWarningId: studentWarningId, userId: userId, acknowledgementRole: acknowledgementRole, acknowledgementDate: acknowledgementDate, id: id, createdAt: createdAt, updatedAt: updatedAt);
  }
}
