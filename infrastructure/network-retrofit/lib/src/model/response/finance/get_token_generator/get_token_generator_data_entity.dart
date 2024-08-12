import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:network_retrofit/src/model/response/finance/get_token_generator/get_token_generator_details_entity.dart';

part 'get_token_generator_data_entity.g.dart';

@JsonSerializable()
class GetTokenGeneratorDataEntity extends BaseLayerDataTransformer<
    GetTokenGeneratorDataEntity, GetTokenGeneratorDataModel> {
  @JsonKey(name: "number")
  final String? number;
  @JsonKey(name: "details")
  final GetTokenGeneratorDetailsEntity? details;

  GetTokenGeneratorDataEntity({
    this.number,
    this.details,
  });

  factory GetTokenGeneratorDataEntity.fromJson(Map<String, dynamic> json) =>
      _$GetTokenGeneratorDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetTokenGeneratorDataEntityToJson(this);

  @override
  GetTokenGeneratorDataModel transform() {
    // TODO: implement transform
    return GetTokenGeneratorDataModel(
        number: number, details: details!.transform());
  }
}
