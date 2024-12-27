class GetTransactionTypeModel {
  final int? status;
  final List<GetTransactionTypeDatumModel>? data;
  final String? message;

  GetTransactionTypeModel({
    this.status,
    this.data,
    this.message,
  });
}

class GetTransactionTypeDatumModel {
  final int? paymentId;
  final int? studentFeeId;
  final int? transactionId;
  final String? paidAmount;
  final int? paymentStatus;
  final int? feeId;
  final String? feeAmount;
  final String? paid;
  final String? pending;
  final String? adjustment;
  final String? wOff;
  final String? discount;
  final DateTime? dueDate;
  final String? tax1;
  final String? tax2;
  final String? tax3;
  final String? feeType;
  final String? feeUrlKey;
  final FeeDetailsModel? feeDetailsModel;

  GetTransactionTypeDatumModel(
      {this.paymentId,
      this.studentFeeId,
      this.transactionId,
      this.paidAmount,
      this.paymentStatus,
      this.feeId,
      this.feeAmount,
      this.paid,
      this.pending,
      this.adjustment,
      this.wOff,
      this.discount,
      this.dueDate,
      this.tax1,
      this.tax2,
      this.tax3,
      this.feeType,
      this.feeDetailsModel,
      this.feeUrlKey});
}

class FeeDetailsModel {
  final int? id;
  final bool? isAdvance;
  final String? feeType;
  final int? feeTypeOrder;
  final String? feeSubType;
  final int? feeOrder;
  final dynamic feeCategory;
  final dynamic feeSubCategory;
  final String? periodOfService;
  final int? feeAmountForPeriod;
  final int? activityStartInDuration;
  final String? activityStartType;
  final int? dueDateDuration;
  final String? dueDateDurationType;
  final String? academicYear;
  final int? academicYearId;
  final String? entityName;
  final DateTime? yearStartDate;
  final String? brandCode;
  final String? brandName;
  final int? entitySegmentId;
  final int? lobSegmentId;
  final int? costCenterSegmentId;
  final int? productGroupSegmentId;
  final dynamic projectSegmentId;
  final int? revenueSegmentId;
  final int? receivableSegmentId;
  final int? advanceSegmentId;
  final int? discountSegmentId;
  final int? wOffSegmentId;
  final dynamic locationSegmentId;
  final dynamic intercompanySegmentId;
  final dynamic feeDisplayName;
  final DateTime? activityStartDate;
  final DateTime? publishStartDate;

  FeeDetailsModel({
    this.id,
    this.isAdvance,
    this.feeType,
    this.feeTypeOrder,
    this.feeSubType,
    this.feeOrder,
    this.feeCategory,
    this.feeSubCategory,
    this.periodOfService,
    this.feeAmountForPeriod,
    this.activityStartInDuration,
    this.activityStartType,
    this.dueDateDuration,
    this.dueDateDurationType,
    this.academicYear,
    this.academicYearId,
    this.entityName,
    this.yearStartDate,
    this.brandCode,
    this.brandName,
    this.entitySegmentId,
    this.lobSegmentId,
    this.costCenterSegmentId,
    this.productGroupSegmentId,
    this.projectSegmentId,
    this.revenueSegmentId,
    this.receivableSegmentId,
    this.advanceSegmentId,
    this.discountSegmentId,
    this.wOffSegmentId,
    this.locationSegmentId,
    this.intercompanySegmentId,
    this.feeDisplayName,
    this.activityStartDate,
    this.publishStartDate,
  });
}
