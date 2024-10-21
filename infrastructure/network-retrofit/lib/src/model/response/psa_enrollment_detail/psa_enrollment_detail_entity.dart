import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/psa_enrollment_detail/batch_entity.dart';
import 'package:network_retrofit/src/model/response/psa_enrollment_detail/fee_category_entity.dart';
import 'package:network_retrofit/src/model/response/psa_enrollment_detail/fee_sub_category_entity.dart';
import 'package:network_retrofit/src/model/response/psa_enrollment_detail/fee_sub_type_entity.dart';
import 'package:network_retrofit/src/model/response/psa_enrollment_detail/period_of_service_entity.dart';

part 'psa_enrollment_detail_entity.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class PsaEnrollmentDetailEntity extends BaseLayerDataTransformer<PsaEnrollmentDetailEntity, PsaEnrollmentDetailModel>{
  @JsonKey(name: 'feeSubType')
  List<FeeSubTypeEntity>? feeSubType;
  @JsonKey(name: 'feeCategory')
  List<FeeCategoryEntity>? feeCategory;
  @JsonKey(name: 'feeSubCategory')
  List<FeeSubCategoryEntity>? feeSubCategory;
  @JsonKey(name: 'batches')
  List<BatchEntity>? batches;
  @JsonKey(name: 'periodOfService')
  List<PeriodOfServiceEntity>? periodOfService;

  PsaEnrollmentDetailEntity({
    this.feeSubType,
    this.feeCategory,
    this.feeSubCategory,
    this.batches,
    this.periodOfService,
  });

  factory PsaEnrollmentDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$PsaEnrollmentDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PsaEnrollmentDetailEntityToJson(this);

  @override
  PsaEnrollmentDetailModel transform() {
    PsaEnrollmentDetailModel psaEnrollmentDetailModel = PsaEnrollmentDetailModel();
    psaEnrollmentDetailModel.feeSubType = feeSubType?.map((e) => e.transform()).toList();
    psaEnrollmentDetailModel.feeCategory = feeCategory?.map((e) => e.transform()).toList();
    psaEnrollmentDetailModel.feeSubCategory = feeSubCategory?.map((e) => e.transform()).toList();
    psaEnrollmentDetailModel.batches = batches?.map((e) => e.transform()).toList();
    psaEnrollmentDetailModel.periodOfService = periodOfService?.map((e) => e.transform()).toList();
    return psaEnrollmentDetailModel;
  }
}