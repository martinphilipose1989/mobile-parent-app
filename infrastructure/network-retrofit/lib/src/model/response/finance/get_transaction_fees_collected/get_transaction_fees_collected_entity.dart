import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:network_retrofit/src/model/response/finance/get_transaction_fees_collected/get_transaction_fees_collected_data_entity.dart';

part 'get_transaction_fees_collected_entity.g.dart';

@JsonSerializable()
class GetTransactiontypefeesCollectedEntity extends BaseLayerDataTransformer<
    GetTransactiontypefeesCollectedEntity,
    GetTransactiontypefeesCollectedModel> {
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final GetTransactiontypefeesCollectedDataEntity? data;
  @JsonKey(name: "message")
  final String? message;

  GetTransactiontypefeesCollectedEntity({
    this.status,
    this.data,
    this.message,
  });

  factory GetTransactiontypefeesCollectedEntity.fromJson(
          Map<String, dynamic> json) =>
      _$GetTransactiontypefeesCollectedEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetTransactiontypefeesCollectedEntityToJson(this);
  @override
  GetTransactiontypefeesCollectedModel transform() {
    // TODO: implement transform
    return GetTransactiontypefeesCollectedModel(
        data: data!.transform(), message: message, status: status);
  }
}
