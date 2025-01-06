class NewEnrolmentResponse {
  final int? status;

  final NewEnrolmentResponseData? data;

  final String? message;

  NewEnrolmentResponse(
      {required this.status, required this.data, required this.message});
}

class NewEnrolmentResponseData {
  final String? message;
  final List<StudentFeeResponse>? data;

  NewEnrolmentResponseData({required this.message, required this.data});
}

class StudentFeeResponse {
  int? studentId;

  int? globalUserId;

  int? feeId;

  int? amount;

  int? paid;

  int? pending;

  int? adjustment;

  int? wOff;

  int? discount;

  int? tax1;

  int? tax2;

  int? tax3;

  bool? isDeenrolled;

  dynamic deenrollmentDate;

  dynamic gracePeriod;

  dynamic dueDate;

  dynamic actualDueDate;

  int? lateChargeAmount;

  String? lateChargeType;

  String? lateChargeDuration;

  dynamic lateChargeMaxAmount;

  DateTime? createdOn;

  DateTime? updatedOn;

  int? segment1;

  int? segment2;

  int? segment3;

  int? segment4Revenue;

  int? segment4Receivable;

  int? segment4Advance;

  int? segment4Discount;

  int? segment4WOff;

  int? segment5;

  int? segment6;

  int? segment7;

  int? segment8;

  dynamic segment9;

  int? academicYearId;

  dynamic brandId;

  dynamic enquiryId;

  dynamic enquiryNo;

  int? feeTypeId;

  String? urlKey;

  dynamic parentId;

  int? id;

  bool? stopLateFeeCalculation;

  StudentFeeResponse({
    this.studentId,
    this.globalUserId,
    this.feeId,
    this.amount,
    this.paid,
    this.pending,
    this.adjustment,
    this.wOff,
    this.discount,
    this.tax1,
    this.tax2,
    this.tax3,
    this.isDeenrolled,
    this.deenrollmentDate,
    this.gracePeriod,
    this.dueDate,
    this.actualDueDate,
    this.lateChargeAmount,
    this.lateChargeType,
    this.lateChargeDuration,
    this.lateChargeMaxAmount,
    this.createdOn,
    this.updatedOn,
    this.segment1,
    this.segment2,
    this.segment3,
    this.segment4Revenue,
    this.segment4Receivable,
    this.segment4Advance,
    this.segment4Discount,
    this.segment4WOff,
    this.segment5,
    this.segment6,
    this.segment7,
    this.segment8,
    this.segment9,
    this.academicYearId,
    this.brandId,
    this.enquiryId,
    this.enquiryNo,
    this.feeTypeId,
    this.urlKey,
    this.parentId,
    this.id,
    this.stopLateFeeCalculation,
  });
}
