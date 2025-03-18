import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/psa_enrollment_detail/fee_category_entity.dart';
import 'package:network_retrofit/src/model/response/psa_enrollment_detail/period_of_service_entity.dart';

part 'cafeteria_enrollment_detail_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class CafeteriaEnrollmentDetailEntity extends BaseLayerDataTransformer<
    CafeteriaEnrollmentDetailEntity, CafeteriaEnrollmentDetailModel> {
  @JsonKey(name: 'feeCategory')
  List<FeeCategoryEntity>? feeCategory;
  @JsonKey(name: 'feeSubType')
  List<FeeCategoryEntity>? feeSubType;
  @JsonKey(name: 'periodOfService')
  List<PeriodOfServiceEntity>? periodOfService;

  CafeteriaEnrollmentDetailEntity(
      {this.feeCategory, this.periodOfService, this.feeSubType});

  factory CafeteriaEnrollmentDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$CafeteriaEnrollmentDetailEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CafeteriaEnrollmentDetailEntityToJson(this);

  @override
  CafeteriaEnrollmentDetailModel transform() {
    CafeteriaEnrollmentDetailModel cafeteriaEnrollmentDetailModel =
        CafeteriaEnrollmentDetailModel();
    cafeteriaEnrollmentDetailModel.feeSubType =
        feeSubType?.map((e) => e.transform()).toList();
    cafeteriaEnrollmentDetailModel.feeCategory =
        feeCategory?.map((e) => e.transform()).toList();
    cafeteriaEnrollmentDetailModel.periodOfService =
        periodOfService?.map((e) => e.transform()).toList();
    return cafeteriaEnrollmentDetailModel;
  }
}
