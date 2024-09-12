import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:network_retrofit/src/model/response/get_sibling_detail/sibling_profile_entity.dart';

part 'sibling_data_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class SiblingDataEntity extends BaseLayerDataTransformer<SiblingDataEntity,SiblingData>{
  @JsonKey(name: 'studentProfile')
  SiblingProfileEntity? siblingProfileEntity;

  SiblingDataEntity({
    this.siblingProfileEntity,
  });

  factory SiblingDataEntity.fromJson(Map<String, dynamic> json) => _$SiblingDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SiblingDataEntityToJson(this); 

  @override
  SiblingData transform() {
    SiblingData siblingData = SiblingData();
    siblingData.siblingProfile = siblingProfileEntity?.transform();
    return siblingData;
  }
}