import 'package:data/data.dart';

import '../../../../network_retrofit.dart';
part 'attendance_count_response_entity.g.dart';
@JsonSerializable()
class AttendanceCountResponseEntity implements BaseLayerDataTransformer<AttendanceCountResponseEntity,AttendanceCountResponseModel>{
  @JsonKey(name: "status")
  int status;
  @JsonKey(name: "data")
  AttendanceDataEntity? data;
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "success")
  bool success;

  AttendanceCountResponseEntity({
    required this.status,
    required this.data,
    required this.message,
    required this.success,
  });

  factory AttendanceCountResponseEntity.fromJson(Map<String, dynamic> json) => _$AttendanceCountResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceCountResponseEntityToJson(this);

  @override
  AttendanceCountResponseEntity restore(AttendanceCountResponseModel data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  AttendanceCountResponseModel transform() {
    return AttendanceCountResponseModel(status: status, data: data!.transform(), message: message, success: success);
  }


}

@JsonSerializable()
class   AttendanceDataEntity implements BaseLayerDataTransformer<AttendanceDataEntity, AttendanceData> {
  @JsonKey(name: "student_id")
  int? studentId;
  @JsonKey(name: "total_days")
  String? totalDays;
  @JsonKey(name: "present_days_count")
  String? presentDaysCount;
  @JsonKey(name: "absent_days_count")
  String? absentDaysCount;


  AttendanceDataEntity({
    required this.studentId,
    required this.totalDays,
    required this.presentDaysCount,
    required this.absentDaysCount,

  });

  factory AttendanceDataEntity.fromJson(Map<String, dynamic> json) =>
      _$AttendanceDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceDataEntityToJson(this);

  @override
  AttendanceDataEntity restore(AttendanceData data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  AttendanceData transform() {
    return AttendanceData(studentId: studentId,
        totalDays: totalDays,
        presentDaysCount: presentDaysCount,
        absentDaysCount: absentDaysCount,
    );  }


}


