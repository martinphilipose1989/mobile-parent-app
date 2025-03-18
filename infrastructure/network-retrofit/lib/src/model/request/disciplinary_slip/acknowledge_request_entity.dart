import 'package:data/data.dart';

import '../../../../network_retrofit.dart';
part 'acknowledge_request_entity.g.dart';

@JsonSerializable()
class AcknowlegementRequestEntity extends BaseLayerDataTransformer<AcknowlegementRequestEntity,AcknowlegementRequestModel> {
  @JsonKey(name: "student_warning_id")
  int studentWarningId;
  @JsonKey(name: "user_id")
  int userId;
  @JsonKey(name: "acknowledgement_role")
  String acknowledgementRole;
  @JsonKey(name: "acknowledgement_date")
  DateTime acknowledgementDate;

  AcknowlegementRequestEntity({
    required this.studentWarningId,
    required this.userId,
    required this.acknowledgementRole,
    required this.acknowledgementDate,
  });

  factory AcknowlegementRequestEntity.fromJson(Map<String, dynamic> json) => _$AcknowlegementRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AcknowlegementRequestEntityToJson(this);

  @override
  AcknowlegementRequestEntity restore(AcknowlegementRequestModel data) {
   return AcknowlegementRequestEntity(studentWarningId: data.studentWarningId, userId: data.userId, acknowledgementRole: data.acknowledgementRole, acknowledgementDate: data.acknowledgementDate);
  }


}
