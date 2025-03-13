import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'student_attendance_response_entity.g.dart';

@JsonSerializable()
class StudentAttendanceResponseEntity
    implements
        BaseLayerDataTransformer<StudentAttendanceResponseEntity,
            GetStudentAttendance> {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "data")
  StudentDataEntity? data;
  @JsonKey(name: "message")
  String? message;

  StudentAttendanceResponseEntity({this.status, this.data, this.message});

  factory StudentAttendanceResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$StudentAttendanceResponseEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$StudentAttendanceResponseEntityToJson(this);

  @override
  StudentAttendanceResponseEntity restore(GetStudentAttendance data) {
    return StudentAttendanceResponseEntity();
  }

  @override
  GetStudentAttendance transform() {
    return GetStudentAttendance(
      status: status,
      message: message,
      data: data?.transform(),
    );
  }
}
@JsonSerializable()
class StudentDataEntity
    implements
        BaseLayerDataTransformer<StudentDataEntity,
            StudentAttendance> {

  @JsonKey(name: "data")
  List<StudentAttendanceDetailsEntity>? data;

  StudentDataEntity({this.data});

  factory StudentDataEntity.fromJson(Map<String, dynamic> json) =>
      _$StudentDataEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$StudentDataEntityToJson(this);

  @override
  StudentDataEntity restore(StudentAttendance data) {
    return StudentDataEntity(); }

  @override
  StudentAttendance transform() {
    return StudentAttendance(
       attendents: data?.map((e)=>e.transform()).toList()
    );
  }
}
@JsonSerializable()
class StudentAttendanceDetailsEntity
    implements
        BaseLayerDataTransformer<StudentAttendanceDetailsEntity,
            StudentAttendanceDetails> {
  @JsonKey(name: "student_id")
  int? studentId;
  @JsonKey(name: "first_name")
  String? firstName;
  @JsonKey(name: "middle_name")
  String? middleName;
  @JsonKey(name: "last_name")
  String? lastName;
  @JsonKey(name: "profile_image_url")
  String? profileImage;
  @JsonKey(name: "crt_enr_on")
  String? crtEnrOn;
  @JsonKey(name: "crt_school_id")
  int? crtSchoolId;
  @JsonKey(name: "crt_board_id")
  int? crtBoardId;
  @JsonKey(name: "crt_brand_id")
  int? crtBrandId;
  @JsonKey(name: "crt_grade_id")
  int? crtGradeId;
  @JsonKey(name: "crt_shift_id")
  int? crtShiftId;
  @JsonKey(name: "intimation_details")
  List<IntimationDetailsEntity>? intimationList;
  @JsonKey(name: "attendance_details")
  List<AttendanceLogDetailsResponseEntity>? attendanceList;

  StudentAttendanceDetailsEntity(
      {this.studentId,
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
      this.attendanceList});

  factory StudentAttendanceDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$StudentAttendanceDetailsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$StudentAttendanceDetailsEntityToJson(this);

  @override
  StudentAttendanceDetailsEntity restore( StudentAttendanceDetails data) {
    return StudentAttendanceDetailsEntity();
  }

  @override
  StudentAttendanceDetails transform() {
    return StudentAttendanceDetails(

      crtEnrOn: crtEnrOn,
      firstName: firstName,
      studentId: studentId,
      lastName: lastName,
      middleName: middleName,
      profileImage: profileImage,
      crtBoardId: crtBoardId,
      crtBrandId: crtBrandId,
      crtGradeId: crtGradeId,
      crtSchoolId: crtSchoolId,
      crtShiftId: crtShiftId,
      intimationList: intimationList?.map((e) => e.transform()).toList(),
      attendanceList: attendanceList?.map((e) => e.transform()).toList(),
    );
  }
}

@JsonSerializable()
class IntimationDetailsEntity
    implements
        BaseLayerDataTransformer<IntimationDetailsEntity, IntimationDetails> {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "global_user_id")
  int? globalUserId;
  @JsonKey(name: "global_student_id")
  int? globalStudentId;
  @JsonKey(name: "from_date")
  String? fromDate;
  @JsonKey(name: "to_date")
  String? toDate;
  @JsonKey(name: "intimation_status")
  int? intimationStatus;
  @JsonKey(name: "initimation_type")
  int? initimationType;
  @JsonKey(name: "intimation_note")
  String? intimationNote;

  IntimationDetailsEntity({
    this.id,
    this.globalUserId,
    this.globalStudentId,
    this.fromDate,
    this.toDate,
    this.intimationStatus,
    this.initimationType,
    this.intimationNote,
  });

  factory IntimationDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$IntimationDetailsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$IntimationDetailsEntityToJson(this);

  @override
  IntimationDetailsEntity restore(IntimationDetails data) {
    return IntimationDetailsEntity();
  }

  @override
  IntimationDetails transform() {
    return IntimationDetails(
        fromDate: fromDate,
        globalStudentId: globalStudentId,
        globalUserId: globalUserId,
        id: id,
        initimationType: initimationType,
        intimationNote: intimationNote,
        intimationStatus: intimationStatus,
        toDate: toDate);
  }
}

@JsonSerializable()
class AttendanceLogDetailsResponseEntity
    implements
        BaseLayerDataTransformer<AttendanceLogDetailsResponseEntity,
            AttendanceLogDetailsResponse> {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "attendance_id")
  int? attendanceId;
  @JsonKey(name: "attendance_type")
  dynamic attendanceType;
  @JsonKey(name: "subject_id")
  dynamic subjectId;
  @JsonKey(name: "timetable_id")
  dynamic timetableId;
  @JsonKey(name: "global_student_id")
  int? globalStudentId;
  @JsonKey(name: "attendance_remark")
  String? attendanceRemark;
  @JsonKey(name: "start_time")
  dynamic startTime;
  @JsonKey(name: "end_time")
  dynamic endTime;
  @JsonKey(name: "subject_name")
  dynamic subjectName;
  @JsonKey(name: "first_name")
  String? firstName;
  @JsonKey(name: "middle_name")
  dynamic middleName;
  @JsonKey(name: "last_name")
  String? lastName;
  @JsonKey(name: "enr_on")
  String? enrOn;

  AttendanceLogDetailsResponseEntity({
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

  factory AttendanceLogDetailsResponseEntity.fromJson(
          Map<String, dynamic> json) =>
      _$AttendanceLogDetailsResponseEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AttendanceLogDetailsResponseEntityToJson(this);

  @override
  AttendanceLogDetailsResponseEntity restore(
      AttendanceLogDetailsResponse data) {
    return AttendanceLogDetailsResponseEntity();
  }

  @override
  AttendanceLogDetailsResponse transform() {
    return AttendanceLogDetailsResponse(
        attendanceId: attendanceId,
        attendanceRemark: attendanceRemark,
        attendanceType: attendanceType,
        endTime: endTime,
        enrOn: enrOn,
        firstName: firstName,
        lastName: lastName,
        globalStudentId: globalStudentId,
        id: id,
        middleName: middleName,
        startTime: startTime,
        subjectId: subjectId,
        subjectName: subjectName,
        timetableId: timetableId);
  }
}
