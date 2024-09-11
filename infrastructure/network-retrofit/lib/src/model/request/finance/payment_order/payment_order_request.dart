import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:network_retrofit/src/model/request/finance/payment_order/orders_request.dart';

part 'payment_order_request.g.dart';

@JsonSerializable()
class PaymentOrderRequestModel extends BaseLayerDataTransformer<
    PaymentOrderRequestModel, PaymentOrderModel> {
  @JsonKey(name: "orders")
  final OrdersRequest? orders;

  PaymentOrderRequestModel({
    this.orders,
  });

  factory PaymentOrderRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentOrderRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentOrderRequestModelToJson(this);

  @override
  PaymentOrderRequestModel restore(PaymentOrderModel data) {
    // TODO: implement restore
    return PaymentOrderRequestModel(orders: orders);
  }
}
