import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'get_token_generator_meta_entity.g.dart';

@JsonSerializable()
class GetTokenGeneratorMetaEntity extends BaseLayerDataTransformer<
    GetTokenGeneratorMetaEntity, GetTokenGeneratorMetaModel> {
  GetTokenGeneratorMetaEntity();

  factory GetTokenGeneratorMetaEntity.fromJson(Map<String, dynamic> json) =>
      _$GetTokenGeneratorMetaEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetTokenGeneratorMetaEntityToJson(this);

  @override
  GetTokenGeneratorMetaModel transform() {
    // TODO: implement transform
    return GetTokenGeneratorMetaModel();
  }
}
