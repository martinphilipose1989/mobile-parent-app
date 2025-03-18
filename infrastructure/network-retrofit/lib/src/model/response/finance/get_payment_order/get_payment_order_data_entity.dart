import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:network_retrofit/src/model/response/finance/get_payment_order/get_payment_order_order_entity.dart';

part 'get_payment_order_data_entity.g.dart';

@JsonSerializable()
class GetPaymentOrderDataEntity extends BaseLayerDataTransformer<
    GetPaymentOrderDataEntity, GetPaymentOrderDataResponseModel> {
  @JsonKey(name: "order")
  GetPaymentOrderOrderEntity? order;
  @JsonKey(name: "paymentLink")
  String? paymentLink;

  GetPaymentOrderDataEntity({
    this.order,
    this.paymentLink,
  });

  factory GetPaymentOrderDataEntity.fromJson(Map<String, dynamic> json) =>
      _$GetPaymentOrderDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetPaymentOrderDataEntityToJson(this);

  @override
  GetPaymentOrderDataResponseModel transform() {
    // TODO: implement transform
    return GetPaymentOrderDataResponseModel(
        order: order?.transform(), paymentLink: paymentLink);
  }
}
