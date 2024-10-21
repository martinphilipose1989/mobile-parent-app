import '../../../../network_retrofit.dart';
part 'disciplinary_list_request.g.dart';

@JsonSerializable()
class DisciplinaryListRequest {
  @JsonKey(name: "academic_year_id")
  int academicYearId;
  @JsonKey(name: "student_id")
  int studentId;
  @JsonKey(name: "date")
  DateTime date;

  DisciplinaryListRequest({
    required this.academicYearId,
    required this.studentId,
    required this.date,
  });

  factory DisciplinaryListRequest.fromJson(Map<String, dynamic> json) => _$DisciplinaryListRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DisciplinaryListRequestToJson(this);
}
