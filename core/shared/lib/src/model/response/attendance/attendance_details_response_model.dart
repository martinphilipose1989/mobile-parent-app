class AttendanceDetailsResponseModel {
  int status;
  AttendanceResponseData data;
  String message;
  bool success;

  AttendanceDetailsResponseModel({
    required this.status,
    required this.data,
    required this.message,
    required this.success,
  });

}

class AttendanceResponseData {
  List<AttendanceDetailsData> data;


  AttendanceResponseData({
    required this.data,

  });

}

class AttendanceDetailsData {
  int? id;
  int? academicYearId;
  int schoolId;
  int? brandId;
  int? boardId;
  int? gradeId;
  int? shiftId;
  int? divisionId;
  DateTime? attendanceDate;
  int? globalStudentId;
  List<AttendanceDetail>? attendanceDetails;
  List<IntimationsDetail>? intimationsDetails;
  String? boardName;
  String?  brandName;
  String?  gradeName;
  String?  divisionName;
  String?  shiftName;
  String? schoolName;
  String?  academicYearName;

  AttendanceDetailsData({
    required this.id,
    required this.academicYearId,
    required this.schoolId,
    required this.brandId,
    required this.boardId,
    required this.gradeId,
    required this.shiftId,
    required this.divisionId,
    required this.attendanceDate,
    required this.globalStudentId,
    required this.attendanceDetails,
    required this.intimationsDetails,
    required this.boardName,
    required this.brandName,
    required this.gradeName,
    required this.divisionName,
    required this.shiftName,
    required this.schoolName,
    required this.academicYearName,
  });

}

class AttendanceDetail {
  int id;
  int? attendanceId;
  int? attendanceType;
  int? subjectId;
  int? timetableId;
  int? globalStudentId;
  String? attendanceRemark;
  String? startTime;
  String? endTime;
  String?  subjectName;
  String?  firstName;
  String? middleName;
  String?  lastName;
  String? enrOn;

  AttendanceDetail({
    required this.id,
    required this.attendanceId,
    required this.attendanceType,
    required this.subjectId,
    required this.timetableId,
    required this.globalStudentId,
    required this.attendanceRemark,
    required this.startTime,
    required this.endTime,
    required this.subjectName,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.enrOn,
  });

}


class IntimationsDetail {
  int id;
  int globalUserId;
  int globalStudentId;
  DateTime fromDate;
  DateTime toDate;
  int intimationStatus;
  int initimationType;
  String intimationNote;

  IntimationsDetail({
    required this.id,
    required this.globalUserId,
    required this.globalStudentId,
    required this.fromDate,
    required this.toDate,
    required this.intimationStatus,
    required this.initimationType,
    required this.intimationNote,
  });

}


