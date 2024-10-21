import 'package:data/data.dart';
import 'package:network_retrofit/src/model/response/mdm_response/mdm_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mdm_base_response_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class MdmBaseResponseBaseEntity extends BaseLayerDataTransformer<MdmBaseResponseBaseEntity,MdmAttributeBaseModel>{
  @JsonKey(name: "data")
  List<MdmAttributeEntity>? data;

  MdmBaseResponseBaseEntity({
    this.data,
  });

  factory MdmBaseResponseBaseEntity.fromJson(Map<String, dynamic> json) => _$MdmBaseResponseBaseEntityFromJson(json);
  Map<String, dynamic> toJson() => _$MdmBaseResponseBaseEntityToJson(this);

  @override
  MdmAttributeBaseModel transform() {
    MdmAttributeBaseModel mdmAttributeBaseModel = MdmAttributeBaseModel();
    mdmAttributeBaseModel.data = data?.map((e) => e.transform()).toList();
    return mdmAttributeBaseModel;
  }
}