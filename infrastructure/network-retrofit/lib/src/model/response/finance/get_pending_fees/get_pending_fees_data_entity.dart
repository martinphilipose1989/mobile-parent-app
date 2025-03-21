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
      GetPendingFeesDataEntity(
        fees: json['fees'] is List
            ? (json['fees'] as List<dynamic>)
                .map((e) => GetPendingFeesDataFeeEntity.fromJson(
                    e as Map<String, dynamic>))
                .toList()
            : json['fees'] == null
                ? []
                : json['fees'] is Map && json['fees'].isEmpty
                    ? []
                    : [
                        GetPendingFeesDataFeeEntity.fromJson(
                            json['fees'] as Map<String, dynamic>)
                      ],
        paymentModes: (json['paymentModes'] as List<dynamic>?)
            ?.map((e) => GetPendingFeesDataPaymentModeEntity.fromJson(
                e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() {
    return {
      'fees': fees?.map((e) => e.toJson()).toList(),
      'paymentModes': paymentModes?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  GetPendingFeesDataModel transform() {
    // TODO: implement transform
    return GetPendingFeesDataModel(
        fees: fees!.map((e) => e.transform()).toList(),
        paymentModes: paymentModes!.map((e) => e.transform()).toList());
  }
}
