import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'parent_contact_detail_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class ParentContactDetailEntity extends BaseLayerDataTransformer<ParentContactDetailEntity,ParentContactDetail>{
    @JsonKey(name: 'firstName')
    String? firstName;
    @JsonKey(name: 'lastName')
    String? lastName;
    @JsonKey(name: 'email')
    String? email;
    @JsonKey(name: 'mobile')
    String? mobile;

    ParentContactDetailEntity({
      this.firstName,
      this.lastName,
      this.email,
      this.mobile,
    });
  
  factory ParentContactDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$ParentContactDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ParentContactDetailEntityToJson(this);

  @override
  ParentContactDetail transform() {
    ParentContactDetail parentContactDetail =ParentContactDetail();
    parentContactDetail.email = email;
    parentContactDetail.firstName = firstName;
    parentContactDetail.lastName = lastName;
    parentContactDetail.mobile = mobile;
    return ParentContactDetail();
  }

}