import '../../../../network_retrofit.dart';
part 'attendance_count_request_entity.g.dart';
@JsonSerializable()
class AttendanceCountRequestEntity {
  @JsonKey(name: "student_id")
  int studentId;
  @JsonKey(name: "attendance_date")
  String attendanceDate;
  @JsonKey(name: "academic_year_id")
  int academicYearId;
  @JsonKey(name: "pageSize")
  int? pageSize;
  @JsonKey(name: "page")
  int? page;

  AttendanceCountRequestEntity({
    required this.studentId,
    required this.attendanceDate,
    required this.academicYearId,
  this.pageSize,
 this.page,
  });

  factory AttendanceCountRequestEntity.fromJson(Map<String, dynamic> json) => _$AttendanceCountRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceCountRequestEntityToJson(this);
}
