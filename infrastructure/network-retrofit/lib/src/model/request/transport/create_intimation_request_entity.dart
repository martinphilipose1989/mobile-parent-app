import '../../../../network_retrofit.dart';
part 'create_intimation_request_entity.g.dart';
@JsonSerializable()
class CreateIntimationRequestEntity {
  @JsonKey(name: "global_user_id")
  int? globalUserId;
  @JsonKey(name: "global_student_id")
  int? globalStudentId;
  @JsonKey(name: "from_date")
  String? fromDate;
  @JsonKey(name: "to_date")
  String? toDate;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "initimation_type")
  int? initimationType;
  @JsonKey(name: "note")
  String? note;
  @JsonKey(name: "file_attachment")
  String? fileAttachment;
  @JsonKey(name: "approval_flag")
  String? approvalFlag;
  @JsonKey(name: "approved_by_id")
  int? approvedById;

  CreateIntimationRequestEntity({
    this.globalUserId,
    this.globalStudentId,
    this.fromDate,
    this.toDate,
    this.status,
    this.initimationType,
    this.note,
    this.fileAttachment,
    this.approvalFlag,
    this.approvedById,
  });

  factory CreateIntimationRequestEntity.fromJson(Map<String, dynamic> json) => _$CreateIntimationRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CreateIntimationRequestEntityToJson(this);
}
