// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:network_retrofit/network_retrofit.dart';

part 'get_transaction_type_fees_collectes_request.g.dart';

@JsonSerializable(explicitToJson: true)
class GetTransactionTypeFeesCollectesRequest {
  @JsonKey(name: "students")
  final List<dynamic> students;

  @JsonKey(name: "academic_years")
  final List<int> academicYear;

  GetTransactionTypeFeesCollectesRequest({
    required this.students,
    required this.academicYear,
  });

  factory GetTransactionTypeFeesCollectesRequest.fromJson(
          Map<String, dynamic> json) =>
      _$GetTransactionTypeFeesCollectesRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetTransactionTypeFeesCollectesRequestToJson(this);
}
