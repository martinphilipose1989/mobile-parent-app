import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:network_retrofit/src/model/response/finance/get_pending_fees/get_pending_fee_data_payment_mode_entity.dart';
import 'package:network_retrofit/src/model/response/finance/get_pending_fees/get_pending_fees_data_fee_entity.dart';

part 'get_pending_fees_data_entity.g.dart';

@JsonSerializable()
class GetPendingFeesDataEntity extends BaseLayerDataTransformer<
    GetPendingFeesDataEntity, GetPendingFeesDataModel> {
  @JsonKey(name: "fees")
  final List<GetPendingFeesDataFeeEntity>? fees;
  @JsonKey(name: "paymentModes")
  final List<GetPendingFeesDataPaymentModeEntity>? paymentModes;

  GetPendingFeesDataEntity({
    this.fees,
    this.paymentModes,
  });

  factory GetPendingFeesDataEntity.fromJson(Map<String, dynamic> json) =>
      _$GetPendingFeesDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetPendingFeesDataEntityToJson(this);

  @override
  GetPendingFeesDataModel transform() {
    // TODO: implement transform
    return GetPendingFeesDataModel(
        fees: fees!.map((e) => e.transform()).toList(),
        paymentModes: paymentModes!.map((e) => e.transform()).toList());
  }
}
