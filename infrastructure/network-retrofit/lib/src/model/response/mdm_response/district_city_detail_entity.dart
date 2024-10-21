import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/mdm_response/mdm_response_entity.dart';

part 'district_city_detail_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class DistrictCityDetailEntity extends BaseLayerDataTransformer<DistrictCityDetailEntity,DistrictCityDetail>{
  @JsonKey(name: 'data')
  MdmAttributeEntity? data;

  DistrictCityDetailEntity({
    this.data
  });

  factory DistrictCityDetailEntity.fromJson(Map<String, dynamic> json) => _$DistrictCityDetailEntityFromJson(json);
  Map<String, dynamic> toJson() => _$DistrictCityDetailEntityToJson(this);

  @override
  DistrictCityDetail transform() {
    DistrictCityDetail districtCityDetail = DistrictCityDetail();
    districtCityDetail.data = data?.transform();
    return districtCityDetail;
  }
}