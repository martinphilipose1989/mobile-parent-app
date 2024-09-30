import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'payment_status_entity.g.dart';

@JsonSerializable()
class PaymentStatusEntity extends BaseLayerDataTransformer<PaymentStatusEntity,
    GetPaymentStatusModel> {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "data")
  String? data;
  @JsonKey(name: "message")
  String? message;

  PaymentStatusEntity({
    this.status,
    this.data,
    this.message,
  });

  factory PaymentStatusEntity.fromJson(Map<String, dynamic> json) =>
      _$PaymentStatusEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentStatusEntityToJson(this);

  @override
  GetPaymentStatusModel transform() {
    // TODO: implement transform
    return GetPaymentStatusModel(data: data, message: message, status: status);
  }
}
