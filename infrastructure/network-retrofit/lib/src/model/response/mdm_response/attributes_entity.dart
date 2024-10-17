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
    @JsonKey(name: 'reason')
    String? reason;
    @JsonKey(name: 'Name')
    String? occupation;
    @JsonKey(name: 'Education')
    String? education;
    @JsonKey(name: 'Description')
    String? description;
    @JsonKey(name: 'Designation')
    String? designation;
    @JsonKey(name: 'nationality')
    String? nationality;

    AttributesDetailsEntity({
        this.name,
        this.shortName,
        this.shortform,
        this.shortNameTwoDigit,
        this.group,
        this.reason,
        this.occupation,
        this.education,
        this.description,
        this.designation,
        this.nationality
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
    model.reason = reason;
    model.occupation = occupation;
    model.education = education;
    model.description = description;
    model.nationality = nationality;
    model.designation = designation;
    return model;
  }
}