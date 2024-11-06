// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:network_retrofit/network_retrofit.dart';

part 'get_validate_pay_now_request.g.dart';

@JsonSerializable(explicitToJson: true)
class GetValidatePayNowRequest {
  @JsonKey(name: "payment_mode")
  final int paymentMode;

  @JsonKey(name: "student_fee_ids")
  final List studentFeeIds;

  GetValidatePayNowRequest({
    required this.paymentMode,
    required this.studentFeeIds,
  });

  factory GetValidatePayNowRequest.fromJson(Map<String, dynamic> json) =>
      _$GetValidatePayNowRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetValidatePayNowRequestToJson(this);
}
