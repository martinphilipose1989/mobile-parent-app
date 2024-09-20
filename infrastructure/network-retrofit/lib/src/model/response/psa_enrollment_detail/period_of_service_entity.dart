import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'period_of_service_entity.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class PeriodOfServiceEntity extends BaseLayerDataTransformer<PeriodOfServiceEntity, PeriodOfServiceModel>{
  int? feeSubTypeId;
  String? feeSubType;
  int? feeCategoryId;
  String? feeCategory;
  int? feeSubcategoryId;
  String? feeSubcategory;
  int? periodOfServiceId;
  String? periodOfService;

  PeriodOfServiceEntity({
    this.feeSubTypeId,
    this.feeSubType,
    this.feeCategoryId,
    this.feeCategory,
    this.feeSubcategoryId,
    this.feeSubcategory,
    this.periodOfServiceId,
    this.periodOfService,
  });

  factory PeriodOfServiceEntity.fromJson(Map<String, dynamic> json) =>
      _$PeriodOfServiceEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PeriodOfServiceEntityToJson(this);

  @override
  PeriodOfServiceModel transform() {
    PeriodOfServiceModel periodOfServiceModel = PeriodOfServiceModel();
    periodOfServiceModel.feeSubTypeId = feeSubTypeId;
    periodOfServiceModel.feeSubType = feeSubType;
    periodOfServiceModel.feeCategoryId = feeCategoryId;
    periodOfServiceModel.feeCategory = feeCategory;
    periodOfServiceModel.feeSubcategoryId = feeSubcategoryId;
    periodOfServiceModel.feeSubcategory = feeSubcategory;
    periodOfServiceModel.periodOfServiceId = periodOfServiceId;
    periodOfServiceModel.periodOfService = periodOfService;
    return periodOfServiceModel;
  } 
}