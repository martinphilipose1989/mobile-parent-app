import 'package:network_retrofit/network_retrofit.dart';

part 'cancel_payment_order_request.g.dart';

@JsonSerializable()
class CancelPaymentRequestEntity {
  @JsonKey(name: "orderId")
  String? orderId;

  CancelPaymentRequestEntity({this.orderId});

  factory CancelPaymentRequestEntity.fromJson(Map<String, dynamic> json) =>
      _$CancelPaymentRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CancelPaymentRequestEntityToJson(this);
}
