import 'package:shared/shared.dart';

class PSADetail {
  String? enquiryDate;
  String? enquiryNumber;
  AcademicYear? academicYear;
  CommonDataClass? schoolLocation;
  ParentDetails? parentDetails;
  ExistingSchoolDetails? existingSchoolDetails;
  String? enquirerParent;
  StudentDetails? studentDetails;
  CommonDataClass? psaSubType;
  CommonDataClass? psaCategory;
  CommonDataClass? psaSubCategory;
  CommonDataClass? psaPeriodOfService;
  CommonDataClass? psaBatch;

  PSADetail({
    this.enquiryDate,
    this.enquiryNumber,
    this.academicYear,
    this.schoolLocation,
    this.parentDetails,
    this.existingSchoolDetails,
    this.enquirerParent,
    this.studentDetails,
    this.psaSubType,
    this.psaCategory,
    this.psaSubCategory,
    this.psaPeriodOfService,
    this.psaBatch,
  });

  @override
  String toString() {
    return 'PSADetail(enquiryDate: $enquiryDate, enquiryNumber: $enquiryNumber, academicYear: $academicYear, schoolLocation: $schoolLocation, parentDetails: $parentDetails, existingSchoolDetails: $existingSchoolDetails, enquirerParent: $enquirerParent, studentDetails: $studentDetails, psaSubType: $psaSubType, psaCategory: $psaCategory, psaSubCategory: $psaSubCategory, psaPeriodOfService: $psaPeriodOfService, psaBatch: $psaBatch)';
  }
}
