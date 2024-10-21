import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/mdm_response/mdm_response_entity.dart';

part 'state_detail_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class StateDetailEntity extends BaseLayerDataTransformer<StateDetailEntity,StateDetail>{
  @JsonKey(name: 'data')
  MdmAttributeEntity? data;

  StateDetailEntity({
    this.data
  });

  factory StateDetailEntity.fromJson(Map<String, dynamic> json) => _$StateDetailEntityFromJson(json);
  Map<String, dynamic> toJson() => _$StateDetailEntityToJson(this);

  @override
  StateDetail transform() {
    StateDetail stateDetail = StateDetail();
    stateDetail.data = data?.transform();
    return stateDetail;
  }
}