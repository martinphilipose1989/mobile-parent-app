import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:network_retrofit/src/model/response/finance/get_transaction_type/get_transaction_type_datum.dart';

part 'get_transaction_type_entity.g.dart';

@JsonSerializable()
class GetTransactionTypeEntity extends BaseLayerDataTransformer<
    GetTransactionTypeEntity, GetTransactionTypeModel> {
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final List<GetTransactionTypeDatum>? data;
  @JsonKey(name: "message")
  final String? message;

  GetTransactionTypeEntity({
    this.status,
    this.data,
    this.message,
  });

  factory GetTransactionTypeEntity.fromJson(Map<String, dynamic> json) =>
      _$GetTransactionTypeEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetTransactionTypeEntityToJson(this);

  @override
  GetTransactionTypeModel transform() {
    return GetTransactionTypeModel(
        status: status,
        message: message,
        data: data!.map((e) => e.transform()).toList());
  }
}
