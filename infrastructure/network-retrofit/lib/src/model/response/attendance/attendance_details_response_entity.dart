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
class AttendanceDetailDataEntity implements BaseLayerDataTransformer<AttendanceDetailDataEntity,AttendanceDetailsData> {
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


  });

  factory AttendanceDetailDataEntity.fromJson(Map<String, dynamic> json) =>
      _$AttendanceDetailDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceDetailDataEntityToJson(this);

  @override
  AttendanceDetailDataEntity restore(AttendanceDetailsData data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  AttendanceDetailsData transform() {
    return AttendanceDetailsData(id: id,
      academicYearId: academicYearId,
      schoolId: schoolId,
      brandId: brandId,
      boardId: boardId,
      gradeId: gradeId,
      shiftId: shiftId,
      divisionId: divisionId,
      attendanceDate: attendanceDate,
      globalStudentId: globalStudentId,
      attendanceDetails: attendanceDetails?.map((e) => e.transform())
          .toList());
  }
}



@JsonSerializable()
class AttendanceDetailEntity {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "attendance_id")
  int? attendanceId;
  @JsonKey(name: "attendance_type")
  int? attendanceType;
  @JsonKey(name: "timetable_id")
  int? timetableId;
  @JsonKey(name: "timetable_detail_id")
  int? timetableDetailId;
  @JsonKey(name: "start_time")
  String? startTime;
  @JsonKey(name: "subject_id")
  int? subjectId;
  @JsonKey(name: "end_time")
  String? endTime;
  @JsonKey(name: "global_student_id")
  int? globalStudentId;
  @JsonKey(name: "attendance_remark")
  String? attendanceRemark;
  @JsonKey(name: "period")
  String? period;

  AttendanceDetailEntity({
    this.id,
    this.attendanceId,
    this.attendanceType,
    this.timetableId,
    this.timetableDetailId,
    this.startTime,
    this.subjectId,
    this.endTime,
    this.globalStudentId,
    this.attendanceRemark,
    this.period,
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
    endTime: endTime,  period: period, );
  }
}





