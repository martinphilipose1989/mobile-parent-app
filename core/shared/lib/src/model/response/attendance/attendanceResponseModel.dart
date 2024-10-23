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
  int studentId;
  String totalDays;
  String presentDaysCount;
  String absentDaysCount;
  List<AttendanceSummary> attendanceSummary;

  AttendanceData({
    required this.studentId,
    required this.totalDays,
    required this.presentDaysCount,
    required this.absentDaysCount,
    required this.attendanceSummary,
  });

}

class AttendanceSummary {
  int id;
  int academicYearId;
  int schoolId;
  int gradeId;
  int shiftId;
  dynamic divisionId;
  DateTime attendanceDate;
  int globalStudentId;
  int attendanceType;
  int subjectId;
  int timetableId;
  String attendanceRemark;

  AttendanceSummary({
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

}
