import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:network_retrofit/src/model/request/finance/payment_order/additional_info_request.dart';
import 'package:network_retrofit/src/model/request/finance/payment_order/device_request.dart';
import 'package:network_retrofit/src/model/request/finance/payment_order/student_fee_request.dart';

part 'orders_request.g.dart';

@JsonSerializable()
class OrdersRequest extends BaseLayerDataTransformer<OrdersRequest, Orders> {
  @JsonKey(name: "student_fees")
  final List<StudentFeeRequest>? studentFees;
  @JsonKey(name: "amount")
  final int? amount;
  @JsonKey(name: "currency")
  final String? currency;
  @JsonKey(name: "additional_info")
  final AdditionalInfoRequest? additionalInfo;
  @JsonKey(name: "device")
  final DeviceRequest? device;
  @JsonKey(name: "paymentGateway")
  final String? paymentGateway;
  @JsonKey(name: "receipt")
  final String? receipt;
  @JsonKey(name: "lob_id")
  final int? lobId;
  @JsonKey(name: "transaction_type_id")
  final int? transactionTypeId;
  @JsonKey(name: "service_provider_id")
  final int? serviceProviderId;
  @JsonKey(name: "payment_mode_id")
  final int? paymentModeId;
  @JsonKey(name: "bank_wallet_merchant_id")
  final int? bankWalletMerchantId;

  OrdersRequest({
    this.studentFees,
    this.amount,
    this.currency,
    this.additionalInfo,
    this.device,
    this.paymentGateway,
    this.receipt,
    this.lobId,
    this.transactionTypeId,
    this.serviceProviderId,
    this.paymentModeId,
    this.bankWalletMerchantId,
  });

  factory OrdersRequest.fromJson(Map<String, dynamic> json) =>
      _$OrdersRequestFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersRequestToJson(this);

  @override
  OrdersRequest restore(Orders data) {
    // TODO: implement restore
    return OrdersRequest(
        additionalInfo: additionalInfo,
        amount: amount,
        bankWalletMerchantId: bankWalletMerchantId,
        currency: currency,
        device: device,
        lobId: lobId,
        paymentGateway: paymentGateway,
        paymentModeId: paymentModeId,
        receipt: receipt,
        serviceProviderId: serviceProviderId,
        studentFees: studentFees,
        transactionTypeId: transactionTypeId);
  }
}
