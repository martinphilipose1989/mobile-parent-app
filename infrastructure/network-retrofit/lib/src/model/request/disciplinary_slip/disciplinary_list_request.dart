import '../../../../network_retrofit.dart';
part 'disciplinary_list_request.g.dart';

@JsonSerializable()
class DisciplinaryListRequest {
  @JsonKey(name: "academic_year_id",defaultValue: 0)
  int? academicYearId;
  @JsonKey(name: "student_id")
  int studentId;
  @JsonKey(name: "date")
  DateTime? date;

  DisciplinaryListRequest(
     {
  this.academicYearId, this.date,
    required this.studentId,

  });

  factory DisciplinaryListRequest.fromJson(Map<String, dynamic> json) => _$DisciplinaryListRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DisciplinaryListRequestToJson(this);
}
