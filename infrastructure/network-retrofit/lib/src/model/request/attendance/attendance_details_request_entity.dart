import '../../../../network_retrofit.dart';
part 'attendance_details_request_entity.g.dart';
@JsonSerializable()
class AttendanceDetailsRequestEntity {
  @JsonKey(name: "student_id")
  List<String>? studentId;
  @JsonKey(name: "attendance_start_date")
  String? attendanceStartDate;
  @JsonKey(name: "attendance_end_date")
  String? attendanceEndDate;
  @JsonKey(name: "academic_year_id")
  int? academicYearId;
  @JsonKey(name: "pageSize")
  int? pageSize;
  @JsonKey(name: "page")
  int? page;

  AttendanceDetailsRequestEntity({
    this.studentId,
    this.attendanceStartDate,
    this.attendanceEndDate,
    this.academicYearId,
    this.pageSize,
    this.page,
  });

  factory AttendanceDetailsRequestEntity.fromJson(Map<String, dynamic> json) => _$AttendanceDetailsRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceDetailsRequestEntityToJson(this);
}
