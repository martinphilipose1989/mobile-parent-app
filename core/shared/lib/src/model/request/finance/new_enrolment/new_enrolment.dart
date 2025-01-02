class NewEnrolmentCreate {
  List<StudentEnrolmentFee>? studentFees;

  NewEnrolmentCreate({this.studentFees});
}

class StudentEnrolmentFee {
  int? studentId;
  int? globalUserId;
  String? enquiryId;
  String? enquiryNo;
  int? lobId;
  int? gradeId;
  int? boardId;
  int? courseId;
  dynamic shiftId;
  dynamic batchId;
  dynamic streamId;
  dynamic brandId;
  dynamic schoolId;
  dynamic hostSchoolId;
  int? academicYearId;
  String? feeType;
  int? feeSubTypeId;
  int? feeCategoryId;
  int? feeSubcategoryId;
  String? feeSubcategoryStart;
  String? feeSubcategoryEnd;
  int? periodOfServiceId;

  StudentEnrolmentFee({
    this.studentId,
    this.globalUserId,
    this.enquiryId,
    this.enquiryNo,
    this.lobId,
    this.gradeId,
    this.boardId,
    this.courseId,
    this.shiftId,
    this.batchId,
    this.streamId,
    this.brandId,
    this.schoolId,
    this.hostSchoolId,
    this.academicYearId,
    this.feeType,
    this.feeSubTypeId,
    this.feeCategoryId,
    this.feeSubcategoryId,
    this.feeSubcategoryStart,
    this.feeSubcategoryEnd,
    this.periodOfServiceId,
  });
}
