class AttendanceDetailsRequestModel {
  List<String> studentId;
  DateTime attendanceStartDate;
  DateTime attendanceEndDate;
  int? pageSize;
  int? page;

  AttendanceDetailsRequestModel({
    required this.studentId,
    required this.attendanceStartDate,
    required this.attendanceEndDate,
this.pageSize,
 this.page,
  });

}
