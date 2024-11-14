import 'package:shared/shared.dart';

class NewAdmissionDetail {
  String? enquiryNumber;
  String? enquiryDate;
  AcademicYear? academicYear;
  CommonDataClass? schoolLocation;
  bool? isGuestStudent;
  GuestStudentDetails? guestStudentDetails;
  ParentDetails? parentDetails;
  ExistingSchoolDetails? existingSchoolDetails;
  String? enquirerParent;
  StudentDetails? studentDetails;
  CommonDataClass? board;
  CommonDataClass? course;
  CommonDataClass? stream;
  CommonDataClass? shift;
  ResidentialAddress? residentialAddress;
  CommonDataClass? brand;
  String? brandName;
  String? brandId;

  @override
  String toString() {
    return 'NewAdmissionDetail('
        'enquiryNumber: $enquiryNumber, '
        'enquiryDate: $enquiryDate, '
        'academicYear: $academicYear, '
        'schoolLocation: $schoolLocation, '
        'isGuestStudent: $isGuestStudent, '
        'guestStudentDetails: $guestStudentDetails, '
        'parentDetails: $parentDetails, '
        'existingSchoolDetails: $existingSchoolDetails, '
        'enquirerParent: $enquirerParent, '
        'studentDetails: $studentDetails, '
        'board: $board, '
        'course: $course, '
        'stream: $stream, '
        'shift: $shift, '
        'residentialAddress: $residentialAddress, '
        'brand: $brand, '
        'brandName: $brandName, '
        'brandId: $brandId'
        ')';
  }
}
