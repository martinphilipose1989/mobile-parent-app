import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/mdm_response/city_and_state_detail_entity.dart';

part 'city_and_state_base_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class CityAndStateBaseEntity extends BaseLayerDataTransformer<CityAndStateBaseEntity,CityAndStateBase>{
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'attributes')
  CityAndStateDetailEntity? attributes;

  CityAndStateBaseEntity({
    this.id,
    this.attributes,
  });

  factory CityAndStateBaseEntity.fromJson(Map<String, dynamic> json) => _$CityAndStateBaseEntityFromJson(json);
    Map<String, dynamic> toJson() => _$CityAndStateBaseEntityToJson(this);

  @override
  CityAndStateBase transform() {
    CityAndStateBase cityAndStateBase = CityAndStateBase();
    cityAndStateBase.id = id;
    cityAndStateBase.attributes = attributes?.transform();
    return cityAndStateBase;
  }
}