import 'package:shared/shared.dart';

class EnquiryDetail {
  String? enquiryNumber;
  String? enquiryDate;
  String? enquiryType;
  String? schoolLocation;
  String? studentFirstName;
  String? studentLastName;
  String? grade;
  String? dob;
  String? gender;
  String? existingSchoolName;
  String? existingSchoolBoard;
  String? existingSchoolGrade;
  String? parentType;
  String? globalId;
  String? parentFirstName;
  String? parentLastName;
  String? parentEmail;
  String? parentMobile;
  List<EnquiryDocument>? enquiryDocuments;
  List<EnquiryStage>? enquiryStage;
  String? eligibleGrade;
  String? studentAadhaarNumber;
  String? placeOfBirth;
  dynamic religion;
  dynamic caste;
  dynamic subCaste;
  dynamic nationality;
  dynamic motherTongue;
  int? schoolId;
  int? boardId;
  int? streamId;
  int? gradeId;
  int? academicYearId;
  String? currentStage;
  String? boardName;
  String? academicYear;
  int? brandId;
  String? brandName;
  int? courseId;
  String? courseName;
  int? shiftId;

  @override
  String toString() {
    return '''
EnquiryDetail(
  enquiryNumber: $enquiryNumber,
  enquiryDate: $enquiryDate,
  enquiryType: $enquiryType,
  schoolLocation: $schoolLocation,
  studentFirstName: $studentFirstName,
  studentLastName: $studentLastName,
  grade: $grade,
  dob: $dob,
  gender: $gender,
  existingSchoolName: $existingSchoolName,
  existingSchoolBoard: $existingSchoolBoard,
  existingSchoolGrade: $existingSchoolGrade,
  parentType: $parentType,
  globalId: $globalId,
  parentFirstName: $parentFirstName,
  parentLastName: $parentLastName,
  parentEmail: $parentEmail,
  parentMobile: $parentMobile,
  enquiryDocuments: $enquiryDocuments,
  enquiryStage: $enquiryStage,
  eligibleGrade: $eligibleGrade,
  studentAadhaarNumber: $studentAadhaarNumber,
  placeOfBirth: $placeOfBirth,
  religion: $religion,
  caste: $caste,
  subCaste: $subCaste,
  nationality: $nationality,
  motherTongue: $motherTongue,
  schoolId: $schoolId,
  boardId: $boardId,
  streamId: $streamId,
  gradeId: $gradeId,
  academicYearId: $academicYearId,
  currentStage: $currentStage,
  boardName: $boardName,
  academicYear: $academicYear.
  brandName: $brandName,
  brandId: $brandId,
  courseId: $courseId,
  courseName: $courseName,
  shiftId: $shiftId
)''';
  }
}
