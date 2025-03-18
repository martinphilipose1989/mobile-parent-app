import 'package:network_retrofit/network_retrofit.dart';

part 'get_school_name_request.g.dart';

@JsonSerializable()
class SchoolNamesRequest {
  @JsonKey(name: "studentIds")
  final List? studentIds;
  @JsonKey(name: "academicYearIds")
  final List<int>? academicYearIds;

  SchoolNamesRequest({
    this.studentIds,
    this.academicYearIds,
  });

  factory SchoolNamesRequest.fromJson(Map<String, dynamic> json) =>
      _$SchoolNamesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SchoolNamesRequestToJson(this);
}
