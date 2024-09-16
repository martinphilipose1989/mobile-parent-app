import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'sibling_registration_entity.g.dart';

@JsonSerializable(explicitToJson: true,createToJson: false)
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
  @JsonKey(name: 'gender',fromJson: _fromJson)
  dynamic gender;
  @JsonKey(name: 'school')
  String? school;
  @JsonKey(name: 'grade',fromJson: _fromJson)
  dynamic grade;

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

  static dynamic _fromJson(dynamic value) => (value is Map<String, dynamic>)
      ? CommonDataEntity.fromJson(value)
      : value;

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};

    void addIfNotEmpty(String key, dynamic value) {
      if (value != null && value != '' && value != "N/A") {
        json[key] = value;
      }
    }

    addIfNotEmpty('type', type);
    addIfNotEmpty('enrollment_number', enrollmentNumber);
    addIfNotEmpty('first_name', firstName);
    addIfNotEmpty('last_name', lastName);
    addIfNotEmpty('dob', dob);
    addIfNotEmpty('school', school);

    if (grade != null) {
      if (grade is CommonDataEntity) {
        json.addAll({"grade": grade.toJson()});
      } else {
        if (grade is String) {
          if (grade.toString().isNotEmpty && grade.toString() != 'N/A') {
            json.addAll({"grade": grade.toString()});
          }
        }
      }
    }

    if (gender != null) {
      if (gender is CommonDataEntity) {
        json.addAll({"gender": gender.toJson()});
      } else {
        if (gender is String) {
          if (gender.toString().isNotEmpty && gender.toString() != 'N/A') {
            json.addAll({"gender": gender.toString()});
          }
        }
      }
    }

    return json;
  }

  @override
  SiblingDetail transform() {
    SiblingDetail siblingDetail = SiblingDetail();
    siblingDetail.type = type;
    siblingDetail.enrollmentNumber = enrollmentNumber;
    siblingDetail.firstName = firstName;
    siblingDetail.lastName = lastName;
    siblingDetail.dob = dob;
    siblingDetail.gender = (gender is CommonDataEntity) ? gender?.transform() : gender;
    siblingDetail.school = school;
    siblingDetail.grade = (grade is CommonDataEntity) ? grade?.transform() : grade;
    return siblingDetail;
  }

  @override
  SiblingDetailEntity restore(SiblingDetail data) {
    CommonDataEntity commonDataEntity = CommonDataEntity();
    return SiblingDetailEntity(
      type: data.type,
      enrollmentNumber: data.enrollmentNumber,
      firstName: data.firstName,
      lastName: data.lastName,
      dob: data.dob,
      gender: (data.gender is CommonDataClass)
          ? commonDataEntity.restore(data.gender)
          : data.gender,
      school: data.school,
      grade: (data.grade is CommonDataClass)
          ? commonDataEntity.restore(data.grade)
          : data.grade,
    );
  }
}