import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:network_retrofit/src/model/response/finance/get_transaction_fees_collected/transaction.dart';

part 'get_transaction_fees_collected_data_entity.g.dart';

@JsonSerializable()
class GetTransactiontypefeesCollectedDataEntity
    extends BaseLayerDataTransformer<GetTransactiontypefeesCollectedDataEntity,
        GetTransactiontypefeesCollectedData> {
  @JsonKey(name: "transactions")
  final List<Transaction>? transactions;
  // @JsonKey(name: "paymentModes")
  // final PaymentModes? paymentModes;

  GetTransactiontypefeesCollectedDataEntity({
    this.transactions,
    //this.paymentModes,
  });

  factory GetTransactiontypefeesCollectedDataEntity.fromJson(
          Map<String, dynamic> json) =>
      _$GetTransactiontypefeesCollectedDataEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetTransactiontypefeesCollectedDataEntityToJson(this);

  @override
  GetTransactiontypefeesCollectedData transform() {
    // TODO: implement transform
    return GetTransactiontypefeesCollectedData(
        // paymentModes: paymentModes,
        transactions: transactions!.map((e) => e.transform()).toList());
  }
}
