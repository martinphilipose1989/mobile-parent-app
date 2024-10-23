import 'package:data/data.dart';

import '../../../../network_retrofit.dart';
part 'attendance_details_request_entity.g.dart';

@JsonSerializable()
class AttendanceDetailsRequestEntity {
  @JsonKey(name: "student_id")
  List<int> studentId;
  @JsonKey(name: "pageSize")
  int pageSize;
  @JsonKey(name: "page")
  int page;

  AttendanceDetailsRequestEntity({
    required this.studentId,
    required this.pageSize,
    required this.page,
  });

  factory AttendanceDetailsRequestEntity.fromJson(Map<String, dynamic> json) => _$AttendanceDetailsRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceDetailsRequestEntityToJson(this);
}
