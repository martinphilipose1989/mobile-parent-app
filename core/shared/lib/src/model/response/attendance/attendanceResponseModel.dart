class AttendanceCountResponseModel {
  int status;
  AttendanceData data;
  String message;
  bool success;

  AttendanceCountResponseModel({
    required this.status,
    required this.data,
    required this.message,
    required this.success,
  });

}

class  AttendanceData {
  int? studentId;
  String? totalDays;
  String? presentDaysCount;
  String? absentDaysCount;

  AttendanceData({
    required this.studentId,
    required this.totalDays,
    required this.presentDaysCount,
    required this.absentDaysCount,

  });

}



