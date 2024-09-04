import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'sibling_registration_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class SiblingDetailEntity extends BaseLayerDataTransformer<SiblingDetailEntity,SiblingDetail>{
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'enrollment_number')
  String? enrollmentNumber;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  @JsonKey(name: 'dob')
  String? dob;
  @JsonKey(name: 'gender')
  String? gender;
  @JsonKey(name: 'school')
  String? school;
  @JsonKey(name: 'grade')
  String? grade;

  SiblingDetailEntity({
    this.type,
    this.enrollmentNumber,
    this.firstName,
    this.lastName,
    this.dob,
    this.gender,
    this.school,
    this.grade,
  });

  factory SiblingDetailEntity.fromJson(Map<String, dynamic> json) => _$SiblingDetailEntityFromJson(json);
  Map<String, dynamic> toJson() => _$SiblingDetailEntityToJson(this);

  @override
  SiblingDetail transform() {
    SiblingDetail siblingDetail = SiblingDetail();
    siblingDetail.type = type;
    siblingDetail.enrollmentNumber = enrollmentNumber;
    siblingDetail.firstName = firstName;
    siblingDetail.lastName = lastName;
    siblingDetail.dob = dob;
    siblingDetail.gender = gender;
    siblingDetail.school = school;
    siblingDetail.grade = grade;
    return siblingDetail;
  }

  @override
  SiblingDetailEntity restore(SiblingDetail data) {
    return SiblingDetailEntity(
      type: data.type,
      enrollmentNumber: data.enrollmentNumber,
      firstName: data.firstName,
      lastName: data.lastName,
      dob: data.dob,
      gender: data.gender,
      school: data.school,
      grade: data.grade,
    );
  }
}