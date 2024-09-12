import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sibling_profile_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class SiblingProfileEntity extends BaseLayerDataTransformer<SiblingProfileEntity,SiblingProfile>{
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  @JsonKey(name: 'dob')
  DateTime? dob;
  @JsonKey(name: 'birth_place')
  String? birthPlace;
  @JsonKey(name: 'status')
  int? status;
  @JsonKey(name: 'gender')
  String? gender;
  @JsonKey(name: 'nationality')
  String? nationality;
  @JsonKey(name: 'caste')
  String? caste;
  @JsonKey(name: 'sub_caste')
  String? subCaste;
  @JsonKey(name: 'sub_caste_id')
  dynamic subCasteId;
  @JsonKey(name: 'is_parents_seperated')
  dynamic isParentsSeperated;
  @JsonKey(name: 'religion')
  String? religion;
  @JsonKey(name: 'blood_group')
  String? bloodGroup;
  @JsonKey(name: 'mother_tongue')
  String? motherTongue;

  SiblingProfileEntity({
    this.id,
    this.firstName,
    this.lastName,
    this.dob,
    this.birthPlace,
    this.status,
    this.gender,
    this.nationality,
    this.caste,
    this.subCaste,
    this.subCasteId,
    this.isParentsSeperated,
    this.religion,
    this.bloodGroup,
    this.motherTongue,
  });

  factory SiblingProfileEntity.fromJson(Map<String, dynamic> json) =>
    _$SiblingProfileEntityFromJson(json);

  Map<String,dynamic> toJson () => _$SiblingProfileEntityToJson(this);

  @override
  SiblingProfile transform() {
    SiblingProfile siblingProfile = SiblingProfile();
    siblingProfile.id = id;
    siblingProfile.firstName = firstName;
    siblingProfile.lastName = lastName;
    siblingProfile.dob = dob;
    siblingProfile.birthPlace = birthPlace;
    siblingProfile.status = status;
    siblingProfile.gender = gender;
    siblingProfile.nationality = nationality;
    siblingProfile.caste = caste;
    siblingProfile.subCaste = subCaste;
    siblingProfile.subCasteId = subCasteId;
    siblingProfile.isParentsSeperated = isParentsSeperated;
    siblingProfile.religion = religion;
    siblingProfile.bloodGroup = bloodGroup;
    siblingProfile.motherTongue = motherTongue;
    return siblingProfile;
  }
}
