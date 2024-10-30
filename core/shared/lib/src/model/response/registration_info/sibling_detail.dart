import 'package:shared/shared.dart';

class SiblingDetail{
  String? enrollmentNumber;
  String? type;
  String? firstName;
  String? lastName;
  String? dob;
  dynamic gender;
  String? school;
  dynamic grade;

  SiblingDetail({
    this.enrollmentNumber,
    this.type,
    this.firstName,
    this.lastName,
    this.dob,
    this.gender,
    this.school,
    this.grade,
  });

  bool isOnlyDOB(){
   return (firstName == null || (firstName??'').isEmpty) &&
           (lastName == null || (lastName??'').isEmpty) &&
           (type == null || (type??'') .isEmpty) &&
           ((gender is CommonDataClass) ? gender?.isValid() : (gender == null || (gender??'').isEmpty)) &&
           ((grade is CommonDataClass) ? grade?.isValid() : (grade == null || (grade??'').isEmpty)) &&
           ((school == null || (school??'').isEmpty) || (enrollmentNumber == null || (enrollmentNumber??'').isEmpty)) &&
           (dob != null && (dob??'').isNotEmpty);
  }
}