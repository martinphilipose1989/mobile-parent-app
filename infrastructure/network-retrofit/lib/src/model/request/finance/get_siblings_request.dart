import 'package:network_retrofit/network_retrofit.dart';

part 'get_siblings_request.g.dart';

@JsonSerializable(explicitToJson: true)
class GetSiblingsRequest {
  @JsonKey(name: "student_id")
  final int studentId;
  @JsonKey(name: "lob_ids")
  final List<int> lobIDs;

  GetSiblingsRequest({required this.studentId, required this.lobIDs});

  factory GetSiblingsRequest.fromJson(Map<String, dynamic> json) =>
      _$GetSiblingsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetSiblingsRequestToJson(this);
}
