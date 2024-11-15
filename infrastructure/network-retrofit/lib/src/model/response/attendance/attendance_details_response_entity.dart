import 'package:data/data.dart';

import '../../../../network_retrofit.dart';
part 'attendance_details_response_entity.g.dart';
@JsonSerializable()
class AttendanceDetailsResponseEntity implements BaseLayerDataTransformer<AttendanceDetailsResponseEntity,AttendanceDetailsResponseModel> {
  @JsonKey(name: "status")
  int status;
  @JsonKey(name: "data")
  AttendanceResponseEntity data;
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "success")
  bool success;

  AttendanceDetailsResponseEntity({
    required this.status,
    required this.data,
    required this.message,
    required this.success,
  });

  factory AttendanceDetailsResponseEntity.fromJson(Map<String, dynamic> json) => _$AttendanceDetailsResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceDetailsResponseEntityToJson(this);

  @override
  AttendanceDetailsResponseEntity restore(AttendanceDetailsResponseModel data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  AttendanceDetailsResponseModel transform() {
return AttendanceDetailsResponseModel(status: status, data: data.transform(), message: message, success: success);
  }
}

@JsonSerializable()
class AttendanceResponseEntity implements BaseLayerDataTransformer<AttendanceResponseEntity,AttendanceResponseData>{
  @JsonKey(name: "data")
  List<AttendanceDetailDataEntity> data;


  AttendanceResponseEntity ({
    required this.data,

  });

  factory AttendanceResponseEntity .fromJson(Map<String, dynamic> json) => _$AttendanceResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceResponseEntityToJson(this);

  @override
  AttendanceResponseEntity restore(AttendanceResponseData data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  AttendanceResponseData transform() {
return AttendanceResponseData(data: data.map((e)=>e.transform()).toList());
  }
}

@JsonSerializable()
class AttendanceDetailDataEntity implements BaseLayerDataTransformer<AttendanceDetailDataEntity,AttendanceDetailsData>{
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "academic_year_id")
  int? academicYearId;
  @JsonKey(name: "school_id")
  int schoolId;
  @JsonKey(name: "brand_id")
  int? brandId;
  @JsonKey(name: "board_id")
  int? boardId;
  @JsonKey(name: "grade_id")
  int? gradeId;
  @JsonKey(name: "shift_id")
  int? shiftId;
  @JsonKey(name: "division_id")
  int? divisionId;
  @JsonKey(name: "attendance_date")
  DateTime? attendanceDate;
  @JsonKey(name: "global_student_id")
  int? globalStudentId;
  @JsonKey(name: "attendance_details")
  List<AttendanceDetailEntity>? attendanceDetails;
  @JsonKey(name: "intimations_details")
  List<IntimationsDetailEntity>? intimationsDetails;
  @JsonKey(name: "board_name")
  String? boardName;
  @JsonKey(name: "brand_name")
  String? brandName;
  @JsonKey(name: "grade_name")
  String? gradeName;
  @JsonKey(name: "division_name")
  String? divisionName;
  @JsonKey(name: "shift_name")
  String? shiftName;
  @JsonKey(name: "school_name")
  String? schoolName;
  @JsonKey(name: "academic_year_name")
  String? academicYearName;

  AttendanceDetailDataEntity({
    required this.id,
    required this.academicYearId,
    required this.schoolId,
    required this.brandId,
    required this.boardId,
    required this.gradeId,
    required this.shiftId,
    required this.divisionId,
    required this.attendanceDate,
    required this.globalStudentId,
    required this.attendanceDetails,
    required this.intimationsDetails,
    required this.boardName,
    required this.brandName,
    required this.gradeName,
    required this.divisionName,
    required this.shiftName,
    required this.schoolName,
    required this.academicYearName,
  });

  factory AttendanceDetailDataEntity.fromJson(Map<String, dynamic> json) => _$AttendanceDetailDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceDetailDataEntityToJson(this);

  @override
  AttendanceDetailDataEntity restore(AttendanceDetailsData data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  AttendanceDetailsData transform() {
return AttendanceDetailsData(id: id, academicYearId: academicYearId, schoolId: schoolId, brandId: brandId, boardId: boardId, gradeId: gradeId, shiftId: shiftId, divisionId: divisionId, attendanceDate: attendanceDate, globalStudentId: globalStudentId,
    attendanceDetails: attendanceDetails?.map((e)=>e.transform()).toList(), intimationsDetails: intimationsDetails?.map((e)=>e.transform()).toList(), boardName: boardName, brandName: brandName, gradeName: gradeName, divisionName: divisionName, shiftName: shiftName, schoolName: schoolName, academicYearName: academicYearName);
  }
}



@JsonSerializable()
class AttendanceDetailEntity {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "attendance_id")
  int attendanceId;
  @JsonKey(name: "attendance_type")
  int? attendanceType;
  @JsonKey(name: "subject_id")
  int? subjectId;
  @JsonKey(name: "timetable_id")
  int? timetableId;
  @JsonKey(name: "global_student_id")
  int? globalStudentId;
  @JsonKey(name: "attendance_remark")
  String? attendanceRemark;
  @JsonKey(name: "start_time")
  String? startTime;
  @JsonKey(name: "end_time")
  String? endTime;
  @JsonKey(name: "day_id")
  int? dayId;
  @JsonKey(name: "period")
  int? period;
  @JsonKey(name: "subject_name")
  String? subjectName;
  @JsonKey(name: "first_name")
  String? firstName;
  @JsonKey(name: "middle_name")
  String? middleName;
  @JsonKey(name: "last_name")
  String? lastName;
  @JsonKey(name: "enr_on")
  String? enrOn;

  AttendanceDetailEntity({
    required this.id,
    required this.attendanceId,
    required this.attendanceType,
    required this.subjectId,
    required this.timetableId,
    required this.globalStudentId,
    required this.attendanceRemark,
    required this.startTime,
    required this.endTime,
    required this.dayId,
    required this.period,
    required this.subjectName,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.enrOn,
  });

  factory AttendanceDetailEntity.fromJson(Map<String, dynamic> json) => _$AttendanceDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceDetailEntityToJson(this);

  @override
  AttendanceDetailEntity restore(AttendanceDetail data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  AttendanceDetail transform() {
return AttendanceDetail(id: id, attendanceId: attendanceId,
    attendanceType: attendanceType, subjectId: subjectId,
    timetableId: timetableId, globalStudentId: globalStudentId,
    attendanceRemark: attendanceRemark, startTime: startTime,
    endTime: endTime, subjectName: subjectName, firstName: firstName,
    middleName: middleName, lastName: lastName, enrOn: enrOn, dayId: dayId, period: period);
  }
}




@JsonSerializable()
class IntimationsDetailEntity implements BaseLayerDataTransformer<IntimationsDetailEntity,IntimationsDetail>{
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "global_user_id")
  int globalUserId;
  @JsonKey(name: "global_student_id")
  int globalStudentId;
  @JsonKey(name: "from_date")
  DateTime fromDate;
  @JsonKey(name: "to_date")
  DateTime toDate;
  @JsonKey(name: "intimation_status")
  int intimationStatus;
  @JsonKey(name: "initimation_type")
  int initimationType;
  @JsonKey(name: "intimation_note")
  String intimationNote;

  IntimationsDetailEntity({
    required this.id,
    required this.globalUserId,
    required this.globalStudentId,
    required this.fromDate,
    required this.toDate,
    required this.intimationStatus,
    required this.initimationType,
    required this.intimationNote,
  });

  factory IntimationsDetailEntity.fromJson(Map<String, dynamic> json) => _$IntimationsDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => _$IntimationsDetailEntityToJson(this);

  @override
  IntimationsDetailEntity restore(IntimationsDetail data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  IntimationsDetail transform() {
  return IntimationsDetail(id: id, globalUserId: globalUserId, globalStudentId: globalStudentId, fromDate: fromDate, toDate: toDate, intimationStatus: intimationStatus, initimationType: initimationType, intimationNote: intimationNote);
  }
}



