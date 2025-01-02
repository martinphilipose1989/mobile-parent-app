import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'new_enrolment_response.g.dart';

@JsonSerializable()
class NewEnrolmentResponseEntity
    implements
        BaseLayerDataTransformer<NewEnrolmentResponseEntity,
            NewEnrolmentResponse> {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "data")
  NewEnrolmentResponseDataEntity? data;
  @JsonKey(name: "message")
  String? message;

  NewEnrolmentResponseEntity({
    this.status,
    this.data,
    this.message,
  });

  factory NewEnrolmentResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$NewEnrolmentResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NewEnrolmentResponseEntityToJson(this);

  @override
  NewEnrolmentResponseEntity restore(NewEnrolmentResponse data) {
    return NewEnrolmentResponseEntity(
        status: data.status,
        data: NewEnrolmentResponseDataEntity().restore(data.data!),
        message: data.message);
  }

  @override
  NewEnrolmentResponse transform() {
    return NewEnrolmentResponse(
        status: status, data: data?.transform(), message: message);
  }
}

@JsonSerializable()
class NewEnrolmentResponseDataEntity
    implements
        BaseLayerDataTransformer<NewEnrolmentResponseDataEntity,
            NewEnrolmentResponseData> {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  List<StudentFeeResponseEntity>? data;

  NewEnrolmentResponseDataEntity({this.message, this.data});

  factory NewEnrolmentResponseDataEntity.fromJson(Map<String, dynamic> json) =>
      _$NewEnrolmentResponseDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NewEnrolmentResponseDataEntityToJson(this);

  @override
  NewEnrolmentResponseDataEntity restore(NewEnrolmentResponseData data) {
    return NewEnrolmentResponseDataEntity(
        message: data.message,
        data: data.data
            ?.map((e) => StudentFeeResponseEntity().restore(e))
            .toList());
  }

  @override
  NewEnrolmentResponseData transform() {
    return NewEnrolmentResponseData(
        message: message, data: data?.map((e) => e.transform()).toList());
  }
}

@JsonSerializable()
class StudentFeeResponseEntity
    implements
        BaseLayerDataTransformer<StudentFeeResponseEntity, StudentFeeResponse> {
  @JsonKey(name: "student_id")
  int? studentId;
  @JsonKey(name: "global_user_id")
  int? globalUserId;
  @JsonKey(name: "fee_id")
  int? feeId;
  @JsonKey(name: "amount")
  int? amount;
  @JsonKey(name: "paid")
  int? paid;
  @JsonKey(name: "pending")
  int? pending;
  @JsonKey(name: "adjustment")
  int? adjustment;
  @JsonKey(name: "w_off")
  int? wOff;
  @JsonKey(name: "discount")
  int? discount;
  @JsonKey(name: "tax_1")
  int? tax1;
  @JsonKey(name: "tax_2")
  int? tax2;
  @JsonKey(name: "tax_3")
  int? tax3;
  @JsonKey(name: "is_deenrolled")
  bool? isDeenrolled;
  @JsonKey(name: "deenrollment_date")
  dynamic deenrollmentDate;
  @JsonKey(name: "grace_period")
  dynamic gracePeriod;
  @JsonKey(name: "due_date")
  dynamic dueDate;
  @JsonKey(name: "actual_due_date")
  dynamic actualDueDate;
  @JsonKey(name: "late_charge_amount")
  int? lateChargeAmount;
  @JsonKey(name: "late_charge_type")
  String? lateChargeType;
  @JsonKey(name: "late_charge_duration")
  String? lateChargeDuration;
  @JsonKey(name: "late_charge_max_amount")
  dynamic lateChargeMaxAmount;
  @JsonKey(name: "created_on")
  DateTime? createdOn;
  @JsonKey(name: "updated_on")
  DateTime? updatedOn;
  @JsonKey(name: "segment_1")
  int? segment1;
  @JsonKey(name: "segment_2")
  int? segment2;
  @JsonKey(name: "segment_3")
  int? segment3;
  @JsonKey(name: "segment_4_revenue")
  int? segment4Revenue;
  @JsonKey(name: "segment_4_receivable")
  int? segment4Receivable;
  @JsonKey(name: "segment_4_advance")
  int? segment4Advance;
  @JsonKey(name: "segment_4_discount")
  int? segment4Discount;
  @JsonKey(name: "segment_4_w_off")
  int? segment4WOff;
  @JsonKey(name: "segment_5")
  int? segment5;
  @JsonKey(name: "segment_6")
  int? segment6;
  @JsonKey(name: "segment_7")
  int? segment7;
  @JsonKey(name: "segment_8")
  int? segment8;
  @JsonKey(name: "segment_9")
  dynamic segment9;
  @JsonKey(name: "academic_year_id")
  int? academicYearId;
  @JsonKey(name: "brand_id")
  dynamic brandId;
  @JsonKey(name: "enquiry_id")
  dynamic enquiryId;
  @JsonKey(name: "enquiry_no")
  dynamic enquiryNo;
  @JsonKey(name: "fee_type_id")
  int? feeTypeId;
  @JsonKey(name: "url_key")
  String? urlKey;
  @JsonKey(name: "parent_id")
  dynamic parentId;
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "stop_late_fee_calculation")
  bool? stopLateFeeCalculation;

  StudentFeeResponseEntity({
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

  factory StudentFeeResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$StudentFeeResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$StudentFeeResponseEntityToJson(this);

  @override
  StudentFeeResponseEntity restore(StudentFeeResponse data) {
    return StudentFeeResponseEntity(
        academicYearId: data.academicYearId,
        amount: data.amount,
        createdOn: data.createdOn,
        deenrollmentDate: data.deenrollmentDate,
        discount: data.discount,
        dueDate: data.dueDate,
        feeId: data.feeId,
        adjustment: data.adjustment,
        globalUserId: data.globalUserId,
        actualDueDate: data.actualDueDate,
        brandId: data.brandId,
        enquiryId: data.enquiryId,
        enquiryNo: data.enquiryNo,
        feeTypeId: data.feeTypeId,
        parentId: data.parentId,
        id: data.id,
        stopLateFeeCalculation: data.stopLateFeeCalculation,
        segment1: data.segment1,
        segment2: data.segment2,
        segment3: data.segment3,
        segment4Advance: data.segment4Advance,
        segment4Discount: data.segment4Discount,
        segment4Receivable: data.segment4Receivable,
        segment4Revenue: data.segment4Revenue,
        segment4WOff: data.segment4WOff,
        segment5: data.segment5,
        segment6: data.segment6,
        segment7: data.segment7,
        segment8: data.segment8,
        segment9: data.segment9,
        tax1: data.tax1,
        tax2: data.tax2,
        tax3: data.tax3,
        updatedOn: data.updatedOn,
        wOff: data.wOff,
        isDeenrolled: data.isDeenrolled,
        gracePeriod: data.gracePeriod,
        lateChargeAmount: data.lateChargeAmount,
        lateChargeDuration: data.lateChargeDuration,
        lateChargeMaxAmount: data.lateChargeMaxAmount,
        lateChargeType: data.lateChargeType,
        paid: data.paid,
        pending: data.pending,
        studentId: data.studentId,
        urlKey: data.urlKey);
  }

  @override
  StudentFeeResponse transform() {
    return StudentFeeResponse(
        academicYearId: academicYearId,
        amount: amount,
        createdOn: createdOn,
        deenrollmentDate: deenrollmentDate,
        discount: discount,
        dueDate: dueDate,
        feeId: feeId,
        adjustment: adjustment,
        globalUserId: globalUserId,
        actualDueDate: actualDueDate,
        brandId: brandId,
        enquiryId: enquiryId,
        enquiryNo: enquiryNo,
        feeTypeId: feeTypeId,
        parentId: parentId,
        id: id,
        stopLateFeeCalculation: stopLateFeeCalculation,
        segment1: segment1,
        segment2: segment2,
        segment3: segment3,
        segment4Advance: segment4Advance,
        segment4Discount: segment4Discount,
        segment4Receivable: segment4Receivable,
        segment4Revenue: segment4Revenue,
        gracePeriod: gracePeriod,
        isDeenrolled: isDeenrolled,
        lateChargeAmount: lateChargeAmount,
        lateChargeDuration: lateChargeDuration,
        lateChargeMaxAmount: lateChargeMaxAmount,
        lateChargeType: lateChargeType,
        paid: paid,
        pending: pending,
        studentId: studentId,
        tax1: tax1,
        tax2: tax2,
        tax3: tax3,
        updatedOn: updatedOn,
        wOff: wOff,
        segment4WOff: segment4WOff,
        segment5: segment5,
        segment6: segment6,
        segment7: segment7,
        segment8: segment8,
        segment9: segment9,
        urlKey: urlKey);
  }
}
