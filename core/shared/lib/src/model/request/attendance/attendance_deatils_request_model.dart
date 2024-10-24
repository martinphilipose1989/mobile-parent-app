class AttendanceDetailsRequestModel {
  List<String> studentId;
  String attendanceStartDate;
String attendanceEndDate;
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
