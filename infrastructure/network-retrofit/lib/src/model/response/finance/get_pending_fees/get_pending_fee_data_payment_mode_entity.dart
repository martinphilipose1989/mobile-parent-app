import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'get_pending_fee_data_payment_mode_entity.g.dart';

@JsonSerializable()
class GetPendingFeesDataPaymentModeEntity extends BaseLayerDataTransformer<
    GetPendingFeesDataPaymentModeEntity, GetPendingFeesPaymentModeModel> {
  @JsonKey(name: "payment_mode_id")
  final int? paymentModeId;
  @JsonKey(name: "payment_mode_name")
  final String? paymentModeName;
  @JsonKey(name: "service_provider")
  final String? serviceProvider;
  @JsonKey(name: "is_transaction_charge_applicable")
  final int? isTransactionChargeApplicable;
  @JsonKey(name: "transaction_charge")
  final String? transactionCharge;
  @JsonKey(name: "is_manual")
  final dynamic isManual;
  @JsonKey(name: "fee_ids")
  final List<int>? feeIds;
  @JsonKey(name: "service_provider_id")
  final int? serviceProviderId;

  GetPendingFeesDataPaymentModeEntity(
      {this.paymentModeId,
      this.paymentModeName,
      this.serviceProvider,
      this.isTransactionChargeApplicable,
      this.transactionCharge,
      this.isManual,
      this.feeIds,
      this.serviceProviderId});

  factory GetPendingFeesDataPaymentModeEntity.fromJson(
          Map<String, dynamic> json) =>
      _$GetPendingFeesDataPaymentModeEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetPendingFeesDataPaymentModeEntityToJson(this);

  @override
  GetPendingFeesPaymentModeModel transform() {
    // TODO: implement transform
    return GetPendingFeesPaymentModeModel(
        feeIds: feeIds,
        isManual: isManual,
        isTransactionChargeApplicable: isTransactionChargeApplicable,
        paymentModeId: paymentModeId,
        paymentModeName: paymentModeName,
        serviceProvider: serviceProvider,
        transactionCharge: transactionCharge,
        serviceproviderId: serviceProviderId);
  }
}
