import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'attributes_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class AttributesDetailsEntity extends BaseLayerDataTransformer<AttributesDetailsEntity,AttributesDetailsModel>{
    @JsonKey(name: 'name')
    String? name;
    @JsonKey(name: 'short_name')
    String? shortName;
    @JsonKey(name: 'shortform')
    String? shortform;
    @JsonKey(name: 'short_name_two_digit')
    String? shortNameTwoDigit;
    @JsonKey(name: 'group')
    String? group;

    AttributesDetailsEntity({
        this.name,
        this.shortName,
        this.shortform,
        this.shortNameTwoDigit,
        this.group,
    });

    factory AttributesDetailsEntity.fromJson(Map<String, dynamic> json) => _$AttributesDetailsEntityFromJson(json);
    Map<String, dynamic> toJson() => _$AttributesDetailsEntityToJson(this);
  
  @override
  AttributesDetailsModel transform() {
    AttributesDetailsModel model = AttributesDetailsModel();
    model.name = name;
    model.shortName = shortName;
    model.shortform = shortform;
    model.shortNameTwoDigit = shortNameTwoDigit;
    model.group = group;
    return model;
  }
}