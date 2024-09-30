import 'package:network_retrofit/network_retrofit.dart';

part 'get_payment_status_request.g.dart';

@JsonSerializable()
class GetPaymentStatusRequest {
  @JsonKey(name: "order_id")
  String? orderId;

  GetPaymentStatusRequest({
    this.orderId,
  });

  factory GetPaymentStatusRequest.fromJson(Map<String, dynamic> json) =>
      _$GetPaymentStatusRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetPaymentStatusRequestToJson(this);
}
