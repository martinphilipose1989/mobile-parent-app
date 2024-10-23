class AttendanceDetailsRequestModel {
  List<int> studentId;
  int pageSize;
  int page;

  AttendanceDetailsRequestModel({
    required this.studentId,
    required this.pageSize,
    required this.page,
  });

}
