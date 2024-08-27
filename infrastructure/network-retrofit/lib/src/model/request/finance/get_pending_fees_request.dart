// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:network_retrofit/network_retrofit.dart';

part 'get_pending_fees_request.g.dart';

@JsonSerializable(explicitToJson: true)
class GetPendingFeesRequest {
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "students")
  final List<int> students;
  @JsonKey(name: "applicable_to")
  final int applicableTo;
  @JsonKey(name: "academic_years")
  final List<int> academicYear;
  @JsonKey(name: "entity_id")
  final int? entityId;
  @JsonKey(name: "brand_id")
  final int? brandId;

  GetPendingFeesRequest(
      {required this.type,
      required this.students,
      required this.applicableTo,
      required this.academicYear,
      this.brandId,
      this.entityId});

  factory GetPendingFeesRequest.fromJson(Map<String, dynamic> json) =>
      _$GetPendingFeesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetPendingFeesRequestToJson(this);
}
