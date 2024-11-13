class GetStudentAttendance {
  int? status;
  StudentAttendanceDetails? data;
  String? message;

  GetStudentAttendance({this.status, this.data, this.message});
}

class StudentAttendanceDetails {
  String? firstName;
  String? middleName;
  String? lastName;
  String? profileImage;
  String? crtEnrOn;
  int? crtSchoolId;
  int? crtBoardId;
  int? crtBrandId;
  int? crtGradeId;
  int? crtShiftId;
  List<IntimationDetails>? intimationList;
  List<AttendanceLogDetailsResponse>? attendanceList;

  StudentAttendanceDetails({
    this.firstName,
    this.middleName,
    this.lastName,
    this.profileImage,
    this.crtEnrOn,
    this.crtBoardId,
    this.crtBrandId,
    this.crtGradeId,
    this.crtSchoolId,
    this.crtShiftId,
    this.intimationList,
    this.attendanceList,
  });
}

class IntimationDetails {
  int? id;
  int? globalUserId;
  int? globalStudentId;
  String? fromDate;
  String? toDate;
  int? intimationStatus;
  int? initimationType;
  String? intimationNote;

  IntimationDetails(
      {this.id,
      this.globalUserId,
      this.globalStudentId,
      this.fromDate,
      this.toDate,
      this.intimationStatus,
      this.initimationType,
      this.intimationNote});
}

class AttendanceLogDetailsResponse {
  int? id;
  int? attendanceId;
  dynamic attendanceType;
  dynamic subjectId;
  dynamic timetableId;
  int? globalStudentId;
  String? attendanceRemark;
  dynamic startTime;
  dynamic endTime;
  dynamic subjectName;
  String? firstName;
  dynamic middleName;
  String? lastName;
  String? enrOn;

  AttendanceLogDetailsResponse({
    this.id,
    this.attendanceId,
    this.attendanceType,
    this.subjectId,
    this.timetableId,
    this.globalStudentId,
    this.attendanceRemark,
    this.startTime,
    this.endTime,
    this.subjectName,
    this.firstName,
    this.middleName,
    this.lastName,
    this.enrOn,
  });
}
