class AttendanceCountRequestModel {
  int studentId;
  String attendanceDate;
  int academicYearId;
  int? pageSize;
  int? page;

  AttendanceCountRequestModel({
    required this.studentId,
    required this.attendanceDate,
    required this.academicYearId,
    this.pageSize,
   this.page,
  });

}
