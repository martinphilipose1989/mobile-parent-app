 import 'package:data/data.dart';

 import '../../../../network_retrofit.dart';

part 'disciplinary_list_response.g.dart';



@JsonSerializable()
class DisciplinaryListEntity {
  @JsonKey(name: "status")
  int status;
  @JsonKey(name: "data")
  DisciplinaryDataEntity data;
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "success")
  bool success;

  DisciplinaryListEntity({
    required this.status,
    required this.data,
    required this.message,
    required this.success,
  });

  factory DisciplinaryListEntity.fromJson(Map<String, dynamic> json) => _$DisciplinaryListEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DisciplinaryListEntityToJson(this);

  @override
  DisciplinaryListEntity restore(DisciplinaryListModel data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  DisciplinaryListModel transform() {
  return DisciplinaryListModel(status: status, data: data.transform(), message: message, success: success);
  }
}

@JsonSerializable()
class DisciplinaryDataEntity {
  @JsonKey(name: "data")
  List<SlipInfoEntity> slipinfo;



  DisciplinaryDataEntity({
    required this.slipinfo,

  });

  factory DisciplinaryDataEntity.fromJson(Map<String, dynamic> json) => _$DisciplinaryDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DisciplinaryDataEntityToJson(this);

  @override
  DisciplinaryDataEntity restore(DisciplinaryData data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  DisciplinaryData transform() {
return DisciplinaryData(data: slipinfo.map((e)=>e.transform()).toList()
);
  }

}

@JsonSerializable()
class SlipInfoEntity {
  @JsonKey(name: "id",defaultValue: 0)
  int id;
  @JsonKey(name: "academic_year_id",defaultValue: 0)
  int academicYearId;
  @JsonKey(name: "student_id",defaultValue: 0)
  int studentId;
  @JsonKey(name: "disciplinary_slip_id",defaultValue: 0)
  int disciplinarySlipId;
  @JsonKey(name: "infraction_id",defaultValue: 0)
  int infractionId;
  @JsonKey(name: "disciplinary_action_id",defaultValue: 0)
  int disciplinaryActionId;
  @JsonKey(name: "date",)
  DateTime date;
  @JsonKey(name: "time",defaultValue: "")
  String time;
  @JsonKey(name: "description",)
  String description;
  @JsonKey(name: "created_at",)
  DateTime createdAt;
  @JsonKey(name: "updated_at",)
  DateTime updatedAt;
  @JsonKey(name: "acknowledgement_details",defaultValue: [])
  List<AcknowledgementDetailEntity> acknowledgementDetails;
  @JsonKey(name: "disciplinary_slip",defaultValue: "")
  String disciplinarySlip;
  @JsonKey(name: "disciplinary_slip_description",defaultValue: "")
  String disciplinarySlipDescription;
  @JsonKey(name: "infraction",defaultValue: "")
  String infraction;
  @JsonKey(name: "disciplinary_action",defaultValue: "")
  String disciplinaryAction;

  SlipInfoEntity({
    required this.id,
    required this.academicYearId,
    required this.studentId,
    required this.disciplinarySlipId,
    required this.infractionId,
    required this.disciplinaryActionId,
    required this.date,
    required this.time,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.acknowledgementDetails,
    required this.disciplinarySlip,
    required this.disciplinarySlipDescription,
    required this.infraction,
    required this.disciplinaryAction,
  });

  factory SlipInfoEntity.fromJson(Map<String, dynamic> json) => _$SlipInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SlipInfoEntityToJson(this);

  SlipInfoEntity restore(SlipInfo data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  SlipInfo transform() {
return SlipInfo(id: id, academicYearId: academicYearId, studentId: studentId,
    disciplinarySlipId: disciplinarySlipId, infractionId: infractionId,
    disciplinaryActionId: disciplinaryActionId, date: date, time: time,
    description: description, createdAt: createdAt, updatedAt: updatedAt,
    acknowledgementDetails: acknowledgementDetails.map((e)=>e.transform()).toList(), disciplinarySlip: disciplinarySlip, disciplinarySlipDescription: disciplinarySlipDescription, infraction: infraction, disciplinaryAction: disciplinaryAction);
  }

}

@JsonSerializable()
class AcknowledgementDetailEntity {
  @JsonKey(name: "id",defaultValue: 1)
  int id;
  @JsonKey(name: "student_warning_id",defaultValue: 0)
  int studentWarningId;
  @JsonKey(name: "user_id",defaultValue: 0)
  int userId;
  @JsonKey(name: "acknowledgement_role",defaultValue: "")
  String acknowledgementRole;
  @JsonKey(name: "acknowledgement_date")
  DateTime acknowledgementDate;

  AcknowledgementDetailEntity({
    required this.id,
    required this.studentWarningId,
    required this.userId,
    required this.acknowledgementRole,
    required this.acknowledgementDate,
  });

  factory AcknowledgementDetailEntity.fromJson(Map<String, dynamic> json) => _$AcknowledgementDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AcknowledgementDetailEntityToJson(this);
  @override
     AcknowledgementDetailEntity restore(AcknowledgementDetail data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  AcknowledgementDetail transform() {
  return AcknowledgementDetail(id: id, studentWarningId: studentWarningId, userId: userId, acknowledgementRole: acknowledgementRole, acknowledgementDate: acknowledgementDate);
  }



}

