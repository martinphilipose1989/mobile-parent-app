import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/get_new_admission/common_data_entity.dart';

part 'student_detail_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class StudentDetailsEntity extends BaseLayerDataTransformer<StudentDetailsEntity,StudentDetails>{
    String? firstName;
    String? lastName;
    CommonDataEntity? grade;
    CommonDataEntity? gender;
    String? dob;
    String? eligibleGrade;

    StudentDetailsEntity({
     this.firstName,
     this.lastName,
     this.grade,
     this.gender,
     this.dob,
     this.eligibleGrade,
    });

  factory StudentDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$StudentDetailsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$StudentDetailsEntityToJson(this);

  @override
  StudentDetails transform() {
    StudentDetails studentDetails = StudentDetails();
    studentDetails.dob = dob;
    studentDetails.eligibleGrade = eligibleGrade;
    studentDetails.firstName = firstName;
    studentDetails.gender = gender?.transform();
    studentDetails.grade = grade?.transform();
    return studentDetails;
  }

}