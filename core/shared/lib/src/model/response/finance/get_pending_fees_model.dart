// ignore_for_file: public_member_api_docs, sort_constructors_first
class GetPendingFeesModel {
  final int? status;
  final GetPendingFeesDataModel? data;
  final String? message;

  GetPendingFeesModel({
    this.status,
    this.data,
    this.message,
  });
}

class GetPendingFeesDataModel {
  final List<GetPendingFeesFeeModel>? fees;
  final List<GetPendingFeesPaymentModeModel>? paymentModes;

  GetPendingFeesDataModel({
    this.fees,
    this.paymentModes,
  });
}

class GetPendingFeesFeeModel {
  final int? id;
  final int? studentId;
  final dynamic globalUserId;
  final int? feeId;
  final String? amount;
  final String? paid;
  final String? pending;
  final String? adjustment;
  final String? wOff;
  final String? discount;
  final String? tax1;
  final String? tax2;
  final String? tax3;
  final bool? isDeenrolled;
  final dynamic deenrollmentDate;
  final dynamic gracePeriod;
  final DateTime? dueDate;
  final DateTime? actualDueDate;
  final int? lateChargeAmount;
  final dynamic lateChargeType;
  final dynamic lateChargeMaxAmount;
  final String? createdOn;
  final dynamic updatedOn;
  final dynamic lateChargeDuration;
  final String? segment1;
  final String? segment2;
  final String? segment3;
  final String? segment4Revenue;
  final String? segment4Receivable;
  final String? segment4Advance;
  final String? segment4Discount;
  final String? segment4WOff;
  final dynamic segment5;
  final String? segment6;
  final dynamic segment7;
  final dynamic segment8;
  final dynamic segment9;
  final int? academicYearId;
  final int? brandId;
  final bool? isAdvance;
  final dynamic enquiryId;
  final dynamic enquiryNo;
  final int? feeTypeId;
  final int? paymentModeId;
  final DateTime? receivedOn;
  final String? receiptNumber;
  final String? receiptDate;
  final String? acknowledgementDate;
  final String? acknowledgementNo;
  final int? transactionStatus;
  final int? transactionId;
  final String? eligibleRefund;
  final String? calculateLateFeeCharge;
  final String? overdueLabel;
  final String? feeType;
  final int? feeTypeOrder;
  final String? feeSubType;
  final int? feeOrder;
  final String? feeCategory;
  final dynamic feeSubCategory;
  final String? periodOfService;
  final int? feeAmountForPeriod;
  final int? activityStartInDuration;
  final String? activityStartType;
  final int? dueDateDuration;
  final String? dueDateDurationType;
  final String? academicYear;
  final String? entityName;
  final dynamic yearStartDate;
  final int? lateFeeCharge;
  final dynamic brandCode;
  final dynamic brandName;
  final String? lateFeeChargeDuration;
  final String? lateFeeChargeType;
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
  final dynamic activityStartDate;
  final dynamic publishStartDate;
  final int? overdueDays;
  final int? isOverdue;
  final String? paymentMode;
  final String? instrumentNumber;
  final String? feeSubCategoryIds;
  final String? feeCategoryIds;
  bool isSelected;
  String? discountedAmount;
  bool isDiscountApplied;
  String? couponId;
  String? differenceAmount;
  String? urlKey;
  int? studentFeeId;
  int? feeSubTypeId;
  String? transactionDate;

  GetPendingFeesFeeModel(
      {this.id,
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
      this.lateChargeMaxAmount,
      this.createdOn,
      this.updatedOn,
      this.lateChargeDuration,
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
      this.isAdvance,
      this.enquiryId,
      this.enquiryNo,
      this.feeTypeId,
      this.paymentModeId,
      this.receivedOn,
      this.receiptNumber,
      this.receiptDate,
      this.acknowledgementDate,
      this.acknowledgementNo,
      this.transactionStatus,
      this.transactionId,
      this.eligibleRefund,
      this.calculateLateFeeCharge,
      this.overdueLabel,
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
      this.entityName,
      this.yearStartDate,
      this.lateFeeCharge,
      this.brandCode,
      this.brandName,
      this.lateFeeChargeDuration,
      this.lateFeeChargeType,
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
      this.overdueDays,
      this.isOverdue,
      this.isSelected = false,
      this.instrumentNumber,
      this.feeSubCategoryIds,
      this.feeCategoryIds,
      this.discountedAmount,
      this.paymentMode,
      this.isDiscountApplied = false,
      this.couponId,
      this.differenceAmount,
      this.urlKey,
      this.studentFeeId,
      this.feeSubTypeId,
      this.transactionDate});

  GetPendingFeesFeeModel copyWith(
      {dynamic enquiryId,
      dynamic enquiryNo,
      int? feeTypeId,
      int? paymentModeId,
      DateTime? receivedOn,
      String? receiptNumber,
      String? receiptDate,
      String? acknowledgementDate,
      String? acknowledgementNo,
      int? transactionStatus,
      int? transactionId,
      String? eligibleRefund,
      int? id,
      int? studentId,
      dynamic globalUserId,
      int? feeId,
      String? amount,
      String? paid,
      String? pending,
      String? adjustment,
      String? wOff,
      String? discount,
      String? tax1,
      String? tax2,
      String? tax3,
      bool? isDeenrolled,
      dynamic deenrollmentDate,
      dynamic gracePeriod,
      DateTime? dueDate,
      DateTime? actualDueDate,
      int? lateChargeAmount,
      dynamic lateChargeType,
      dynamic lateChargeMaxAmount,
      String? createdOn,
      dynamic updatedOn,
      dynamic lateChargeDuration,
      String? segment1,
      String? segment2,
      String? segment3,
      String? segment4Revenue,
      String? segment4Receivable,
      String? segment4Advance,
      String? segment4Discount,
      String? segment4WOff,
      dynamic segment5,
      String? segment6,
      dynamic segment7,
      dynamic segment8,
      dynamic segment9,
      int? academicYearId,
      int? brandId,
      dynamic isAdvance,
      String? calculateLateFeeCharge,
      String? overdueLabel,
      String? feeType,
      int? feeTypeOrder,
      String? feeSubType,
      int? feeOrder,
      String? feeCategory,
      dynamic feeSubCategory,
      String? periodOfService,
      int? feeAmountForPeriod,
      int? activityStartInDuration,
      String? activityStartType,
      int? dueDateDuration,
      String? dueDateDurationType,
      String? academicYear,
      String? entityName,
      dynamic yearStartDate,
      int? lateFeeCharge,
      dynamic brandCode,
      dynamic brandName,
      String? lateFeeChargeDuration,
      String? lateFeeChargeType,
      int? entitySegmentId,
      int? lobSegmentId,
      int? costCenterSegmentId,
      int? productGroupSegmentId,
      dynamic projectSegmentId,
      int? revenueSegmentId,
      int? receivableSegmentId,
      int? advanceSegmentId,
      int? discountSegmentId,
      int? wOffSegmentId,
      dynamic locationSegmentId,
      dynamic intercompanySegmentId,
      dynamic feeDisplayName,
      dynamic activityStartDate,
      dynamic publishStartDate,
      int? overdueDays,
      int? isOverdue,
      bool? isSelected,
      String? instrumentNumber,
      String? feeSubCategoryIds,
      String? feeCategoryIds,
      String? discountedAmount,
      String? paymentMode,
      bool? isDiscountApplied,
      String? couponId,
      String? differenceAmount}) {
    return GetPendingFeesFeeModel(
        acknowledgementDate: acknowledgementDate ?? this.acknowledgementDate,
        acknowledgementNo: acknowledgementNo ?? this.acknowledgementNo,
        receiptDate: receiptDate ?? this.receiptDate,
        receiptNumber: receiptNumber ?? this.receiptNumber,
        id: id ?? this.id,
        studentId: studentId ?? this.studentId,
        globalUserId: globalUserId ?? this.globalUserId,
        feeId: feeId ?? this.feeId,
        amount: amount ?? this.amount,
        paid: paid ?? this.paid,
        pending: pending ?? this.pending,
        adjustment: adjustment ?? this.adjustment,
        wOff: wOff ?? this.wOff,
        discount: discount ?? this.discount,
        tax1: tax1 ?? this.tax1,
        tax2: tax2 ?? this.tax2,
        tax3: tax3 ?? this.tax3,
        isDeenrolled: isDeenrolled ?? this.isDeenrolled,
        deenrollmentDate: deenrollmentDate ?? this.deenrollmentDate,
        gracePeriod: gracePeriod ?? this.gracePeriod,
        dueDate: dueDate ?? this.dueDate,
        actualDueDate: actualDueDate ?? this.actualDueDate,
        lateChargeAmount: lateChargeAmount ?? this.lateChargeAmount,
        lateChargeType: lateChargeType ?? this.lateChargeType,
        lateChargeMaxAmount: lateChargeMaxAmount ?? this.lateChargeMaxAmount,
        createdOn: createdOn ?? this.createdOn,
        updatedOn: updatedOn ?? this.updatedOn,
        lateChargeDuration: lateChargeDuration ?? this.lateChargeDuration,
        segment1: segment1 ?? this.segment1,
        segment2: segment2 ?? this.segment2,
        segment3: segment3 ?? this.segment3,
        segment4Revenue: segment4Revenue ?? this.segment4Revenue,
        segment4Receivable: segment4Receivable ?? this.segment4Receivable,
        segment4Advance: segment4Advance ?? this.segment4Advance,
        segment4Discount: segment4Discount ?? this.segment4Discount,
        segment4WOff: segment4WOff ?? this.segment4WOff,
        segment5: segment5 ?? this.segment5,
        segment6: segment6 ?? this.segment6,
        segment7: segment7 ?? this.segment7,
        segment8: segment8 ?? this.segment8,
        segment9: segment9 ?? this.segment9,
        academicYearId: academicYearId ?? this.academicYearId,
        brandId: brandId ?? this.brandId,
        isAdvance: isAdvance ?? this.isAdvance,
        calculateLateFeeCharge:
            calculateLateFeeCharge ?? this.calculateLateFeeCharge,
        overdueLabel: overdueLabel ?? this.overdueLabel,
        feeType: feeType ?? this.feeType,
        feeTypeOrder: feeTypeOrder ?? this.feeTypeOrder,
        feeSubType: feeSubType ?? this.feeSubType,
        feeOrder: feeOrder ?? this.feeOrder,
        feeCategory: feeCategory ?? this.feeCategory,
        feeSubCategory: feeSubCategory ?? this.feeSubCategory,
        periodOfService: periodOfService ?? this.periodOfService,
        feeAmountForPeriod: feeAmountForPeriod ?? this.feeAmountForPeriod,
        activityStartInDuration:
            activityStartInDuration ?? this.activityStartInDuration,
        activityStartType: activityStartType ?? this.activityStartType,
        dueDateDuration: dueDateDuration ?? this.dueDateDuration,
        dueDateDurationType: dueDateDurationType ?? this.dueDateDurationType,
        academicYear: academicYear ?? this.academicYear,
        entityName: entityName ?? this.entityName,
        yearStartDate: yearStartDate ?? this.yearStartDate,
        lateFeeCharge: lateFeeCharge ?? this.lateFeeCharge,
        brandCode: brandCode ?? this.brandCode,
        brandName: brandName ?? this.brandName,
        lateFeeChargeDuration:
            lateFeeChargeDuration ?? this.lateFeeChargeDuration,
        lateFeeChargeType: lateFeeChargeType ?? this.lateFeeChargeType,
        entitySegmentId: entitySegmentId ?? this.entitySegmentId,
        lobSegmentId: lobSegmentId ?? this.lobSegmentId,
        costCenterSegmentId: costCenterSegmentId ?? this.costCenterSegmentId,
        productGroupSegmentId:
            productGroupSegmentId ?? this.productGroupSegmentId,
        projectSegmentId: projectSegmentId ?? this.projectSegmentId,
        revenueSegmentId: revenueSegmentId ?? this.revenueSegmentId,
        receivableSegmentId: receivableSegmentId ?? this.receivableSegmentId,
        advanceSegmentId: advanceSegmentId ?? this.advanceSegmentId,
        discountSegmentId: discountSegmentId ?? this.discountSegmentId,
        wOffSegmentId: wOffSegmentId ?? this.wOffSegmentId,
        locationSegmentId: locationSegmentId ?? this.locationSegmentId,
        intercompanySegmentId:
            intercompanySegmentId ?? this.intercompanySegmentId,
        feeDisplayName: feeDisplayName ?? this.feeDisplayName,
        activityStartDate: activityStartDate ?? this.activityStartDate,
        publishStartDate: publishStartDate ?? this.publishStartDate,
        overdueDays: overdueDays ?? this.overdueDays,
        isOverdue: isOverdue ?? this.isOverdue,
        isSelected: isSelected ?? this.isSelected,
        instrumentNumber: instrumentNumber ?? this.instrumentNumber,
        paymentMode: paymentMode ?? this.paymentMode,
        feeCategoryIds: feeCategoryIds ?? this.feeCategoryIds,
        feeSubCategoryIds: feeSubCategoryIds ?? this.feeSubCategoryIds,
        discountedAmount: discountedAmount ?? this.discountedAmount,
        isDiscountApplied: isDiscountApplied ?? this.isDiscountApplied,
        couponId: couponId ?? this.couponId,
        differenceAmount: differenceAmount ?? this.differenceAmount);
  }
}

class GetPendingFeesPaymentModeModel {
  final int? paymentModeId;
  final int? serviceproviderId;
  final String? paymentModeName;
  final String? serviceProvider;
  final int? isTransactionChargeApplicable;
  final String? transactionCharge;
  final dynamic isManual;
  final List<int>? feeIds;

  GetPendingFeesPaymentModeModel(
      {this.paymentModeId,
      this.paymentModeName,
      this.serviceProvider,
      this.isTransactionChargeApplicable,
      this.transactionCharge,
      this.isManual,
      this.feeIds,
      this.serviceproviderId});
}
