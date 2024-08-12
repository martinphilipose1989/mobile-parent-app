import 'package:network_retrofit/network_retrofit.dart';

part 'get_guardian_student_details_request.g.dart';

@JsonSerializable(explicitToJson: true)
class GetGuardianStudentDetailsRequest {
  @JsonKey(name: "mobile_no")
  final int mobileNo;

  GetGuardianStudentDetailsRequest({required this.mobileNo});

  factory GetGuardianStudentDetailsRequest.fromJson(
          Map<String, dynamic> json) =>
      _$GetGuardianStudentDetailsRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetGuardianStudentDetailsRequestToJson(this);
}
