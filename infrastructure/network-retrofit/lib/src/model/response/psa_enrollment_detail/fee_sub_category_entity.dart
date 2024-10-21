import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fee_sub_category_entity.g.dart';

@JsonSerializable(explicitToJson: true,fieldRename: FieldRename.snake)
class FeeSubCategoryEntity extends BaseLayerDataTransformer<FeeSubCategoryEntity,FeeSubCategoryModel>{
  int? feeSubTypeId;
  String? feeSubType;
  int? feeCategoryId;
  String? feeCategory;
  int? feeSubcategoryId;
  String? feeSubcategory;

  FeeSubCategoryEntity({
    this.feeSubTypeId,
    this.feeSubType,
    this.feeCategoryId,
    this.feeCategory,
    this.feeSubcategoryId,
    this.feeSubcategory,
  });

  factory FeeSubCategoryEntity.fromJson(Map<String, dynamic> json) =>
      _$FeeSubCategoryEntityFromJson(json);

  Map<String, dynamic> toJson() => _$FeeSubCategoryEntityToJson(this);

  @override
  FeeSubCategoryModel transform() {
    FeeSubCategoryModel feeSubCategoryModel = FeeSubCategoryModel();
    feeSubCategoryModel.feeSubTypeId = feeSubTypeId;
    feeSubCategoryModel.feeSubType = feeSubType;
    feeSubCategoryModel.feeCategoryId = feeCategoryId;
    feeSubCategoryModel.feeCategory = feeCategory;
    feeSubCategoryModel.feeSubcategoryId = feeSubcategoryId;
    feeSubCategoryModel.feeSubcategory = feeSubcategory;
    return feeSubCategoryModel; 
  }
  
}
