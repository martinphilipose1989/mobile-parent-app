import 'package:shared/shared.dart';
import 'package:shared/src/model/response/new_admission/common_data_class.dart';

class StudentDetails {
  String? firstName;
  String? lastName;
  CommonDataClass? grade;
  CommonDataClass? gender;
  String? dob;
  String? eligibleGrade;
  String? placeOfBirth;
  CommonDataClass? religion;
  CommonDataClass? caste;
  CommonDataClass? subCaste;
  CommonDataClass? nationality;
  CommonDataClass? motherTongue;
  String? aadhar;
  String? globalId;

  StudentDetails({
    this.firstName,
    this.lastName,
    this.grade,
    this.gender,
    this.dob,
    this.eligibleGrade,
    this.placeOfBirth,
    this.religion,
    this.caste,
    this.subCaste,
    this.nationality,
    this.motherTongue,
    this.aadhar,
    this.globalId,
  });

  @override
  String toString() {
    return 'StudentDetails(firstName: $firstName, lastName: $lastName, grade: $grade, gender: $gender, dob: $dob, eligibleGrade: $eligibleGrade, placeOfBirth: $placeOfBirth, religion: $religion, caste: $caste, subCaste: $subCaste, nationality: $nationality, motherTongue: $motherTongue, aadhar: $aadhar, globalId: $globalId)';
  }
}
