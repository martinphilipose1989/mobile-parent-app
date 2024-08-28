import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'parent_contact_detail_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class ParentContactDetailEntity extends BaseLayerDataTransformer<ParentContactDetailEntity,ParentContactDetail>{
    @JsonKey(name: 'global_id')
    String? globalId;
    @JsonKey(name: 'first_name')
    String? firstName;
    @JsonKey(name: 'last_name')
    String? lastName;
    @JsonKey(name: 'email')
    String? email;
    @JsonKey(name: 'mobile')
    String? mobile;

    ParentContactDetailEntity({
      this.globalId,
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
    parentContactDetail.globalId = globalId;
    parentContactDetail.email = email;
    parentContactDetail.firstName = firstName;
    parentContactDetail.lastName = lastName;
    parentContactDetail.mobile = mobile;
    return parentContactDetail;
  }

  @override
  ParentContactDetailEntity restore(ParentContactDetail data) {
    ParentContactDetailEntity parentContactDetailEntity = ParentContactDetailEntity(
      globalId : data.globalId,
      email : data.email,
      firstName : data.firstName,
      lastName : data.lastName,
      mobile : data.mobile,
    );
    return parentContactDetailEntity;
  }

}