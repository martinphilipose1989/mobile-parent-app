import 'package:network_retrofit/network_retrofit.dart';

part 'get_academic_year_request.g.dart';

@JsonSerializable(explicitToJson: true)
class GetAcademicYearRequest {
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "students")
  final List students;

  GetAcademicYearRequest({required this.type, required this.students});

  factory GetAcademicYearRequest.fromJson(Map<String, dynamic> json) =>
      _$GetAcademicYearRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetAcademicYearRequestToJson(this);
}
