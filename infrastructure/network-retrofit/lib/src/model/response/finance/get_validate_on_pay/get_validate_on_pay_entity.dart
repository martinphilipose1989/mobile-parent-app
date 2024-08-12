import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:network_retrofit/src/model/response/finance/get_validate_on_pay/get_validate_on_pay_data_entity.dart';

part 'get_validate_on_pay_entity.g.dart';

@JsonSerializable()
class GetValidateOnPayEntity extends BaseLayerDataTransformer<
    GetValidateOnPayEntity, GetValidateOnPayModel> {
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final GetValidateOnPayDataEntity? data;
  @JsonKey(name: "message")
  final String? message;

  GetValidateOnPayEntity({
    this.status,
    this.data,
    this.message,
  });

  factory GetValidateOnPayEntity.fromJson(Map<String, dynamic> json) =>
      _$GetValidateOnPayEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetValidateOnPayEntityToJson(this);

  @override
  GetValidateOnPayModel transform() {
    // TODO: implement transform
    return GetValidateOnPayModel(
      data: data?.transform(),
      message: message,
      status: status,
    );
  }
}
