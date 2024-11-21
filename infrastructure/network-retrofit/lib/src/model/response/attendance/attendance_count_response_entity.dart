import 'package:data/data.dart';

import '../../../../network_retrofit.dart';
part 'attendance_count_response_entity.g.dart';

@JsonSerializable()
class AttendanceCountResponseEntity
    implements
        BaseLayerDataTransformer<AttendanceCountResponseEntity,
            AttendanceCountResponseModel> {
  @JsonKey(name: "status")
  int status;
  @JsonKey(name: "data")
  AttendanceDataEntity data;
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "success")
  bool success;

  AttendanceCountResponseEntity({
    required this.status,
    required this.data,
    required this.message,
    required this.success,
  });

  factory AttendanceCountResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$AttendanceCountResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceCountResponseEntityToJson(this);

  @override
  AttendanceCountResponseEntity restore(AttendanceCountResponseModel data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  AttendanceCountResponseModel transform() {
    return AttendanceCountResponseModel(
        status: status,
        data: data.transform(),
        message: message,
        success: success);
  }
}

@JsonSerializable()
class AttendanceDataEntity
    implements BaseLayerDataTransformer<AttendanceDataEntity, AttendanceData> {
  @JsonKey(name: "student_id")
  int? studentId;
  @JsonKey(name: "total_days")
  String? totalDays;
  @JsonKey(name: "present_days_count")
  String? presentDaysCount;
  @JsonKey(name: "absent_days_count")
  String? absentDaysCount;
  @JsonKey(name: "attendance_summary")
  List<AttendanceSummaryEntity> attendanceSummary;

  AttendanceDataEntity({
    required this.studentId,
    required this.totalDays,
    required this.presentDaysCount,
    required this.absentDaysCount,
    required this.attendanceSummary,
  });

  factory AttendanceDataEntity.fromJson(Map<String, dynamic> json) =>
      _$AttendanceDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceDataEntityToJson(this);

  @override
  AttendanceDataEntity restore(AttendanceData data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  AttendanceData transform() {
    return AttendanceData(
        studentId: studentId,
        totalDays: totalDays,
        presentDaysCount: presentDaysCount,
        absentDaysCount: absentDaysCount,
        attendanceSummary:
            attendanceSummary.map((e) => e.transform()).toList());
  }
}

@JsonSerializable()
class AttendanceSummaryEntity
    implements
        BaseLayerDataTransformer<AttendanceSummaryEntity, AttendanceSummary> {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "academic_year_id")
  int? academicYearId;
  @JsonKey(name: "school_id")
  int? schoolId;
  @JsonKey(name: "grade_id")
  int? gradeId;
  @JsonKey(name: "shift_id")
  int? shiftId;
  @JsonKey(name: "division_id")
  dynamic divisionId;
  @JsonKey(name: "attendance_date")
  DateTime? attendanceDate;
  @JsonKey(name: "global_student_id")
  int? globalStudentId;
  @JsonKey(name: "attendance_type")
  int? attendanceType;
  @JsonKey(name: "subject_id")
  int? subjectId;
  @JsonKey(name: "timetable_id")
  int? timetableId;
  @JsonKey(name: "attendance_remark")
  String? attendanceRemark;

  AttendanceSummaryEntity({
    required this.id,
    required this.academicYearId,
    required this.schoolId,
    required this.gradeId,
    required this.shiftId,
    required this.divisionId,
    required this.attendanceDate,
    required this.globalStudentId,
    required this.attendanceType,
    required this.subjectId,
    required this.timetableId,
    required this.attendanceRemark,
  });

  factory AttendanceSummaryEntity.fromJson(Map<String, dynamic> json) =>
      _$AttendanceSummaryEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceSummaryEntityToJson(this);

  @override
  AttendanceSummaryEntity restore(AttendanceSummary data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  AttendanceSummary transform() {
    return AttendanceSummary(
        id: id ?? 0,
        academicYearId: academicYearId ?? 0,
        schoolId: schoolId ?? 0,
        gradeId: gradeId ?? 0,
        shiftId: shiftId ?? 0,
        divisionId: divisionId ?? 0,
        attendanceDate: attendanceDate ?? DateTime.now(),
        globalStudentId: globalStudentId ?? 0,
        attendanceType: attendanceType ?? 0,
        subjectId: subjectId ?? 0,
        timetableId: timetableId ?? 0,
        attendanceRemark: attendanceRemark ?? '');
  }
}
