import 'package:data/data.dart';
import 'package:network_retrofit/src/model/response/mdm_response/attributes_entity.dart';

import 'package:json_annotation/json_annotation.dart';

part 'mdm_response_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class MdmAttributeEntity extends BaseLayerDataTransformer<MdmAttributeEntity,MdmAttributeModel> {
    @JsonKey(name: 'id')
    int? id;
    @JsonKey(name: 'attributes')
    AttributesDetailsEntity? attributes;

    MdmAttributeEntity({
        this.id,
        this.attributes,
    });

    factory MdmAttributeEntity.fromJson(Map<String, dynamic> json) => _$MdmAttributeEntityFromJson(json);
    Map<String, dynamic> toJson() => _$MdmAttributeEntityToJson(this);

    @override
  MdmAttributeModel transform() {
    MdmAttributeModel model = MdmAttributeModel();
    model.id = id;
    model.attributes = attributes?.transform();
    return model;
  }
}