import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'get_validate_on_pay_last_transaction_entity.g.dart';

@JsonSerializable()
class LastTransactionDetail extends BaseLayerDataTransformer<
    LastTransactionDetail, LastTransactionDetailModel> {
  @JsonKey(name: "customer_bank_ifsc")
  final String? customerBankIfsc;
  @JsonKey(name: "customer_bank_name")
  final String? customerBankName;

  LastTransactionDetail({
    this.customerBankIfsc,
    this.customerBankName,
  });

  factory LastTransactionDetail.fromJson(Map<String, dynamic> json) =>
      _$LastTransactionDetailFromJson(json);

  Map<String, dynamic> toJson() => _$LastTransactionDetailToJson(this);

  @override
  LastTransactionDetailModel transform() {
    // TODO: implement transform
    return LastTransactionDetailModel(
        customerBankIfsc: customerBankIfsc ?? "",
        customerBankName: customerBankName ?? "");
  }
}
