import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'fee_details_entity.g.dart';

@JsonSerializable()
class FeeDetailsEntity
    extends BaseLayerDataTransformer<FeeDetailsEntity, FeeDetailsModel> {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "is_advance")
  final bool? isAdvance;
  @JsonKey(name: "fee_type")
  final String? feeType;
  @JsonKey(name: "fee_type_order")
  final int? feeTypeOrder;
  @JsonKey(name: "fee_sub_type")
  final String? feeSubType;
  @JsonKey(name: "fee_order")
  final int? feeOrder;
  @JsonKey(name: "fee_category")
  final dynamic feeCategory;
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
  @JsonKey(name: "academic_year_id")
  final int? academicYearId;
  @JsonKey(name: "entity_name")
  final String? entityName;
  @JsonKey(name: "year_start_date")
  final DateTime? yearStartDate;
  @JsonKey(name: "brand_code")
  final String? brandCode;
  @JsonKey(name: "brand_name")
  final String? brandName;
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
  final DateTime? activityStartDate;
  @JsonKey(name: "publish_start_date")
  final DateTime? publishStartDate;

  FeeDetailsEntity({
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

  factory FeeDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$FeeDetailsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$FeeDetailsEntityToJson(this);

  @override
  FeeDetailsModel transform() {
    return FeeDetailsModel(
      id: id,
      isAdvance: isAdvance,
      feeType: feeType,
      feeTypeOrder: feeTypeOrder,
      feeSubType: feeSubType,
      feeOrder: feeOrder,
      feeCategory: feeCategory,
      feeSubCategory: feeSubCategory,
      periodOfService: periodOfService,
      feeAmountForPeriod: feeAmountForPeriod,
      activityStartInDuration: activityStartInDuration,
      activityStartType: activityStartType,
      dueDateDuration: dueDateDuration,
      dueDateDurationType: dueDateDurationType,
      academicYear: academicYear,
      academicYearId: academicYearId,
      entityName: entityName,
      yearStartDate: yearStartDate,
      brandCode: brandCode,
      brandName: brandName,
      entitySegmentId: entitySegmentId,
      lobSegmentId: lobSegmentId,
      costCenterSegmentId: costCenterSegmentId,
      productGroupSegmentId: productGroupSegmentId,
      projectSegmentId: projectSegmentId,
      revenueSegmentId: revenueSegmentId,
      receivableSegmentId: receivableSegmentId,
      advanceSegmentId: advanceSegmentId,
      discountSegmentId: discountSegmentId,
      wOffSegmentId: wOffSegmentId,
      locationSegmentId: locationSegmentId,
      intercompanySegmentId: intercompanySegmentId,
      feeDisplayName: feeDisplayName,
      activityStartDate: activityStartDate,
      publishStartDate: publishStartDate,
    );
  }
}
