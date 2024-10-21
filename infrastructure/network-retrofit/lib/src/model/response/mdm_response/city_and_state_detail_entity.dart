import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/mdm_response/district_city_detail_entity.dart';
import 'package:network_retrofit/src/model/response/mdm_response/state_detail_entity.dart';

part 'city_and_state_detail_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class CityAndStateDetailEntity extends BaseLayerDataTransformer<CityAndStateDetailEntity,CityAndStateDetail>{
  @JsonKey(name: 'Pincode')
  String? pincode;
  @JsonKey(name: 'createdAt')
  DateTime? createdAt;
  @JsonKey(name: 'updatedAt')
  DateTime? updatedAt;
  @JsonKey(name: 'publishedAt')
  DateTime? publishedAt;
  @JsonKey(name: 'District_Or_City')
  DistrictCityDetailEntity? districtOrCity;
  @JsonKey(name: 'State')
  StateDetailEntity? state;

  CityAndStateDetailEntity({
      this.pincode,
      this.createdAt,
      this.updatedAt,
      this.publishedAt,
      this.districtOrCity,
      this.state,
  });

  factory CityAndStateDetailEntity.fromJson(Map<String, dynamic> json) => _$CityAndStateDetailEntityFromJson(json);
  Map<String, dynamic> toJson() => _$CityAndStateDetailEntityToJson(this);

  @override
  CityAndStateDetail transform() {
    CityAndStateDetail cityAndStateDetail = CityAndStateDetail();
    cityAndStateDetail.pincode = pincode;
    cityAndStateDetail.createdAt = createdAt;
    cityAndStateDetail.updatedAt = updatedAt;
    cityAndStateDetail.publishedAt = publishedAt;
    cityAndStateDetail.districtOrCity = districtOrCity?.transform();
    cityAndStateDetail.state = state?.transform();
    return cityAndStateDetail;
  }
}