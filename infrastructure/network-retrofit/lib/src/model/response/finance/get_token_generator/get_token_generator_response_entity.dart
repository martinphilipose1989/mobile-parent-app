import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:network_retrofit/src/model/response/finance/get_token_generator/get_token_generator_data_entity.dart';
import 'package:network_retrofit/src/model/response/finance/get_token_generator/get_token_generator_meta_entity.dart';

part 'get_token_generator_response_entity.g.dart';

@JsonSerializable()
class GetTokenGeneratorResponseEntity extends BaseLayerDataTransformer<
    GetTokenGeneratorResponseEntity, GetTokenGeneratorModel> {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "data")
  final GetTokenGeneratorDataEntity? data;
  @JsonKey(name: "meta")
  final GetTokenGeneratorMetaEntity? meta;
  @JsonKey(name: "message")
  final String? message;

  GetTokenGeneratorResponseEntity({
    this.success,
    this.data,
    this.meta,
    this.message,
  });

  factory GetTokenGeneratorResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$GetTokenGeneratorResponseEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetTokenGeneratorResponseEntityToJson(this);

  @override
  GetTokenGeneratorModel transform() {
    return GetTokenGeneratorModel(
        data: data!.transform(),
        message: message,
        meta: meta!.transform(),
        success: success);
  }
}
