import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fee_category_entity.g.dart';

@JsonSerializable(explicitToJson: true,fieldRename: FieldRename.snake)
class FeeCategoryEntity extends BaseLayerDataTransformer<FeeCategoryEntity,FeeCategoryModel>{
  int? feeSubTypeId;
  String? feeSubType;
  int? feeCategoryId;
  String? feeCategory;

  FeeCategoryEntity({
    this.feeSubTypeId,
    this.feeSubType,
    this.feeCategoryId,
    this.feeCategory,
  });

  factory FeeCategoryEntity.fromJson(Map<String, dynamic> json) =>
      _$FeeCategoryEntityFromJson(json);

  Map<String, dynamic> toJson() => _$FeeCategoryEntityToJson(this);

  @override
  FeeCategoryModel transform() {
    FeeCategoryModel feeCategoryModel = FeeCategoryModel();
    feeCategoryModel.feeSubTypeId = feeSubTypeId;
    feeCategoryModel.feeSubType = feeSubType;
    feeCategoryModel.feeCategoryId = feeCategoryId;
    feeCategoryModel.feeCategory = feeCategory;
    return feeCategoryModel;
  }
}