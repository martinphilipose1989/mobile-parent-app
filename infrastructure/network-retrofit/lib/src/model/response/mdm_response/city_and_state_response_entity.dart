import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/mdm_response/city_and_state_base_entity.dart';

part 'city_and_state_response_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class CityAndStateResponseEntity extends BaseLayerDataTransformer<CityAndStateResponseEntity,CityAndStateResponse>{
  @JsonKey(name: 'data')
  List<CityAndStateBaseEntity>? data;

    CityAndStateResponseEntity({
        this.data,
    });

  factory CityAndStateResponseEntity.fromJson(Map<String, dynamic> json) => _$CityAndStateResponseEntityFromJson(json);
  Map<String, dynamic> toJson() => _$CityAndStateResponseEntityToJson(this);

  @override
  CityAndStateResponse transform() {
    CityAndStateResponse cityAndStateResponse = CityAndStateResponse();
    cityAndStateResponse.data = data?.map((e) => e.transform()).toList();
    return cityAndStateResponse;
  }

}