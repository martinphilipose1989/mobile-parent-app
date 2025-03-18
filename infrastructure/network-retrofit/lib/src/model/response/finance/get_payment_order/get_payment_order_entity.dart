import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:network_retrofit/src/model/response/finance/get_payment_order/get_payment_order_data_entity.dart';

part 'get_payment_order_entity.g.dart';

@JsonSerializable()
class GetPaymentOrderEntity extends BaseLayerDataTransformer<
    GetPaymentOrderEntity, GetPaymentOrderResponseModel> {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "data")
  GetPaymentOrderDataEntity? data;
  @JsonKey(name: "message")
  String? message;

  GetPaymentOrderEntity({
    this.status,
    this.data,
    this.message,
  });

  factory GetPaymentOrderEntity.fromJson(Map<String, dynamic> json) =>
      _$GetPaymentOrderEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetPaymentOrderEntityToJson(this);

  @override
  GetPaymentOrderResponseModel transform() {
    // TODO: implement transform
    return GetPaymentOrderResponseModel(
        data: data?.transform(), message: message, status: status);
  }
}
