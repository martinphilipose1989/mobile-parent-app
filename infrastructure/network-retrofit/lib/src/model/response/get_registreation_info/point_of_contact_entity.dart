import 'package:data/data.dart';

import '../../../../network_retrofit.dart';
part 'point_of_contact_entity.g.dart';
@JsonSerializable(explicitToJson: true,createPerFieldToJson: false)
class PointOfContactInfoEntity extends BaseLayerDataTransformer<PointOfContactInfoEntity,PointOfContactDetail>{
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'contact_person')
  String? parentType;
  @JsonKey(name: 'mobile')
  String? parentContactNumber;
  @JsonKey(name: 'email')
  String? parentEmailId;


  PointOfContactInfoEntity({
    this.id,
    this.parentType,
    this.parentContactNumber,
    this.parentEmailId
  });

  factory PointOfContactInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$PointOfContactInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => {
    "id": id,
    "contact_person": parentType,
    "mobile": parentContactNumber,
    "email": parentEmailId,

  };

  @override
  PointOfContactDetail transform() {
    PointOfContactDetail pointOfContactDetail = PointOfContactDetail();
    pointOfContactDetail.parentType = parentType;
    pointOfContactDetail.parentEmailId = parentEmailId;
    pointOfContactDetail.parentContactNumber = parentContactNumber;

    return pointOfContactDetail;
  }

  @override
  PointOfContactInfoEntity restore(PointOfContactDetail data) {
    PointOfContactInfoEntity pointOfContactInfoEntity = PointOfContactInfoEntity(
      parentContactNumber: data.parentContactNumber,
      parentEmailId: data.parentEmailId,
      parentType: data.parentType
    );
    return pointOfContactInfoEntity;
  }
}