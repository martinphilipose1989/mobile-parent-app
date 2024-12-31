import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'get_pending_fees_data_fee_entity.g.dart';

@JsonSerializable()
class GetPendingFeesDataFeeEntity extends BaseLayerDataTransformer<
    GetPendingFeesDataFeeEntity, GetPendingFeesFeeModel> {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "student_id")
  final int? studentId;
  @JsonKey(name: "global_user_id")
  final dynamic globalUserId;
  @JsonKey(name: "fee_id")
  final int? feeId;
  @JsonKey(name: "amount")
  final String? amount;
  @JsonKey(name: "paid")
  final String? paid;
  @JsonKey(name: "pending")
  final String? pending;
  @JsonKey(name: "adjustment")
  final String? adjustment;
  @JsonKey(name: "w_off")
  final String? wOff;
  @JsonKey(name: "discount")
  final String? discount;
  @JsonKey(name: "tax_1")
  final String? tax1;
  @JsonKey(name: "tax_2")
  final String? tax2;
  @JsonKey(name: "tax_3")
  final String? tax3;
  @JsonKey(name: "is_deenrolled")
  final bool? isDeenrolled;
  @JsonKey(name: "deenrollment_date")
  final dynamic deenrollmentDate;
  @JsonKey(name: "grace_period")
  final dynamic gracePeriod;
  @JsonKey(name: "due_date")
  final DateTime? dueDate;
  @JsonKey(name: "actual_due_date")
  final DateTime? actualDueDate;
  // @JsonKey(name: "late_charge_amount")
  // var lateChargeAmount;
  @JsonKey(name: "late_charge_type")
  final dynamic lateChargeType;
  @JsonKey(name: "late_charge_max_amount")
  final dynamic lateChargeMaxAmount;
  @JsonKey(name: "created_on")
  final String? createdOn;
  @JsonKey(name: "updated_on")
  final dynamic updatedOn;
  @JsonKey(name: "late_charge_duration")
  final dynamic lateChargeDuration;
  @JsonKey(name: "segment_1")
  final String? segment1;
  @JsonKey(name: "segment_2")
  final String? segment2;
  @JsonKey(name: "segment_3")
  final String? segment3;
  @JsonKey(name: "segment_4_revenue")
  final String? segment4Revenue;
  @JsonKey(name: "segment_4_receivable")
  final String? segment4Receivable;
  @JsonKey(name: "segment_4_advance")
  final String? segment4Advance;
  @JsonKey(name: "segment_4_discount")
  final String? segment4Discount;
  @JsonKey(name: "segment_4_w_off")
  final String? segment4WOff;
  @JsonKey(name: "segment_5")
  final dynamic segment5;
  @JsonKey(name: "segment_6")
  final String? segment6;
  @JsonKey(name: "segment_7")
  final dynamic segment7;
  @JsonKey(name: "segment_8")
  final dynamic segment8;
  @JsonKey(name: "segment_9")
  final dynamic segment9;
  @JsonKey(name: "academic_year_id")
  final int? academicYearId;
  @JsonKey(name: "brand_id")
  final int? brandId;
  @JsonKey(name: "is_advance")
  final dynamic isAdvance;
  @JsonKey(name: "calculate_late_fee_charge")
  final String? calculateLateFeeCharge;
  @JsonKey(name: "overdue_label")
  final String? overdueLabel;
  @JsonKey(name: "fee_type")
  final String? feeType;
  @JsonKey(name: "fee_type_order")
  final int? feeTypeOrder;
  @JsonKey(name: "fee_sub_type")
  final String? feeSubType;
  @JsonKey(name: "fee_order")
  final int? feeOrder;
  @JsonKey(name: "fee_category")
  final String? feeCategory;
  @JsonKey(name: "fee_sub_category")
  final dynamic feeSubCategory;
  @JsonKey(name: "period_of_service")
  final String? periodOfService;
  @JsonKey(name: "fee_amount_for_period")
  final int? feeAmountForPeriod;
  @JsonKey(name: "activity_start_in_duration")
  final int? activityStartInDuration;
  @JsonKey(name: "activity_start_type")
  final String? activityStartType;
  @JsonKey(name: "due_date_duration")
  final int? dueDateDuration;
  @JsonKey(name: "due_date_duration_type")
  final String? dueDateDurationType;
  @JsonKey(name: "academic_year")
  final String? academicYear;
  @JsonKey(name: "entity_name")
  final String? entityName;
  @JsonKey(name: "year_start_date")
  final dynamic yearStartDate;
  @JsonKey(name: "late_fee_charge")
  final int? lateFeeCharge;
  @JsonKey(name: "brand_code")
  final dynamic brandCode;
  @JsonKey(name: "brand_name")
  final dynamic brandName;
  @JsonKey(name: "late_fee_charge_duration")
  final String? lateFeeChargeDuration;
  @JsonKey(name: "late_fee_charge_type")
  final String? lateFeeChargeType;
  @JsonKey(name: "entity_segment_id")
  final int? entitySegmentId;
  @JsonKey(name: "lob_segment_id")
  final int? lobSegmentId;
  @JsonKey(name: "cost_center_segment_id")
  final int? costCenterSegmentId;
  @JsonKey(name: "product_group_segment_id")
  final int? productGroupSegmentId;
  @JsonKey(name: "project_segment_id")
  final dynamic projectSegmentId;
  @JsonKey(name: "revenue_segment_id")
  final int? revenueSegmentId;
  @JsonKey(name: "receivable_segment_id")
  final int? receivableSegmentId;
  @JsonKey(name: "advance_segment_id")
  final int? advanceSegmentId;
  @JsonKey(name: "discount_segment_id")
  final int? discountSegmentId;
  @JsonKey(name: "w_off_segment_id")
  final int? wOffSegmentId;
  @JsonKey(name: "location_segment_id")
  final dynamic locationSegmentId;
  @JsonKey(name: "intercompany_segment_id")
  final dynamic intercompanySegmentId;
  @JsonKey(name: "fee_display_name")
  final dynamic feeDisplayName;
  @JsonKey(name: "activity_start_date")
  final dynamic activityStartDate;
  @JsonKey(name: "publish_start_date")
  final dynamic publishStartDate;
  @JsonKey(name: "overdue_days")
  final int? overdueDays;
  @JsonKey(name: "is_overdue")
  final int? isOverdue;
  @JsonKey(name: "payment_mode")
  final String? paymentMode;
  @JsonKey(name: "receipt_number")
  final String? receiptNumber;
  @JsonKey(name: "receipt_date")
  final String? receiptDate;
  @JsonKey(name: "acknowledgement_date")
  final String? acknowledgementDate;
  @JsonKey(name: "acknowledgement_no")
  final String? acknowledgementNo;
  @JsonKey(name: "instrument_number")
  final String? instrumentNumber;
  @JsonKey(name: "fee_type_id")
  final int? feeTypeId;
  @JsonKey(name: "fee_category_id")
  final int? feeCategoryId;
  @JsonKey(name: "fee_subcategory_id")
  final int? feeSubCategoryIds;
  @JsonKey(name: "enquiry_id")
  String? enquiryId;
  @JsonKey(name: "url_key")
  String? urlKey;
  @JsonKey(name: "student_fee_id")
  int? studentFeeId;
  @JsonKey(name: "transaction_id")
  int? transactionId;
  @JsonKey(name: "transaction_status")
  int? transactionStatus;
  @JsonKey(name: "fee_category_ids")
  String? feeCategoryIds;
  @JsonKey(name: "fee_sub_type_id")
  int? feeSubTypeId;
  @JsonKey(name: "transaction_date")
  String? transactionDate;

  GetPendingFeesDataFeeEntity(
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
      //this.lateChargeAmount,
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
      this.paymentMode,
      this.acknowledgementDate,
      this.acknowledgementNo,
      this.receiptDate,
      this.instrumentNumber,
      this.receiptNumber,
      this.feeCategoryId,
      this.feeSubCategoryIds,
      this.feeTypeId,
      this.urlKey,
      this.studentFeeId,
      this.transactionId,
      this.transactionStatus,
      this.feeSubTypeId,
      this.transactionDate});

  factory GetPendingFeesDataFeeEntity.fromJson(Map<String, dynamic> json) =>
      _$GetPendingFeesDataFeeEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetPendingFeesDataFeeEntityToJson(this);

  @override
  GetPendingFeesFeeModel transform() {
    // TODO: implement transform
    return GetPendingFeesFeeModel(
        enquiryId: enquiryId,
        paymentMode: paymentMode,
        academicYear: academicYear,
        academicYearId: academicYearId,
        activityStartDate: activityStartDate,
        activityStartInDuration: activityStartInDuration,
        activityStartType: activityStartType,
        actualDueDate: actualDueDate,
        adjustment: adjustment,
        advanceSegmentId: advanceSegmentId,
        amount: amount,
        brandCode: brandCode,
        brandId: brandId,
        brandName: brandName,
        calculateLateFeeCharge: calculateLateFeeCharge,
        costCenterSegmentId: costCenterSegmentId,
        createdOn: createdOn,
        deenrollmentDate: deenrollmentDate,
        discount: discount,
        discountSegmentId: discountSegmentId,
        dueDate: dueDate,
        dueDateDuration: dueDateDuration,
        dueDateDurationType: dueDateDurationType,
        entityName: entityName,
        entitySegmentId: entitySegmentId,
        feeAmountForPeriod: feeAmountForPeriod,
        feeCategory: feeCategory,
        feeDisplayName: feeDisplayName,
        feeId: feeId,
        feeOrder: feeOrder,
        feeSubCategory: feeSubCategory,
        feeSubType: feeSubType,
        feeType: feeType,
        feeTypeOrder: feeTypeOrder,
        globalUserId: globalUserId,
        gracePeriod: gracePeriod,
        id: id,
        intercompanySegmentId: intercompanySegmentId,
        isAdvance: isAdvance,
        isDeenrolled: isDeenrolled,
        isOverdue: isOverdue,
        //lateChargeAmount: lateChargeAmount,
        lateChargeDuration: lateChargeDuration,
        lateChargeMaxAmount: lateChargeMaxAmount,
        lateChargeType: lateChargeType,
        lateFeeCharge: lateFeeCharge,
        lateFeeChargeDuration: lateFeeChargeDuration,
        lateFeeChargeType: lateFeeChargeType,
        lobSegmentId: lobSegmentId,
        locationSegmentId: locationSegmentId,
        overdueDays: overdueDays,
        overdueLabel: overdueLabel,
        paid: paid,
        pending: pending,
        periodOfService: periodOfService,
        productGroupSegmentId: productGroupSegmentId,
        projectSegmentId: projectSegmentId,
        publishStartDate: publishStartDate,
        receivableSegmentId: receivableSegmentId,
        revenueSegmentId: revenueSegmentId,
        segment1: segment1,
        segment2: segment2,
        segment3: segment3,
        segment4Advance: segment4Advance,
        segment4Discount: segment4Discount,
        segment4Receivable: segment4Receivable,
        segment4Revenue: segment4Revenue,
        segment4WOff: segment4WOff,
        segment5: segment5,
        segment6: segment6,
        segment7: segment7,
        segment8: segment8,
        segment9: segment9,
        studentId: studentId,
        tax1: tax1,
        tax2: tax2,
        tax3: tax3,
        updatedOn: updatedOn,
        wOff: wOff,
        feeCategoryIds: feeCategoryId.toString(),
        feeSubCategoryIds: feeSubCategoryIds.toString(),
        wOffSegmentId: wOffSegmentId,
        yearStartDate: yearStartDate,
        acknowledgementDate: acknowledgementDate,
        acknowledgementNo: acknowledgementNo,
        receiptDate: receiptDate,
        instrumentNumber: instrumentNumber,
        receiptNumber: receiptNumber,
        feeTypeId: feeTypeId,
        urlKey: urlKey,
        studentFeeId: studentFeeId,
        transactionId: transactionId,
        transactionStatus: transactionStatus,
        feeSubTypeId: feeSubTypeId,
        transactionDate: transactionDate);
  }
}
