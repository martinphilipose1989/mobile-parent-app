class AttendanceDetailsRequestModel {
  List<String>? studentId;
  String? attendanceStartDate;
  String? attendanceEndDate;
  int? academicYearId;
  int? pageSize;
  int? page;

  AttendanceDetailsRequestModel({
    this.studentId,
    this.attendanceStartDate,
    this.attendanceEndDate,
    this.academicYearId,
    this.pageSize,
    this.page,
  });

}
