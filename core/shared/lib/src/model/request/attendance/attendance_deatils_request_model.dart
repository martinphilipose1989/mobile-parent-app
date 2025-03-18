class AttendanceDetailsRequestModel {
  List<dynamic>? studentId;
  String? attendanceStartDate;
  String? attendanceEndDate;
  int? academicYearId;
List<int>? attendanceType;
  int? pageSize;
  int? page;

  AttendanceDetailsRequestModel({
    this.studentId,
    this.attendanceType,
    this.attendanceStartDate,
    this.attendanceEndDate,
    this.academicYearId,
    this.pageSize,
    this.page,
  });

}
