import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'batch_entity.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class BatchEntity extends BaseLayerDataTransformer<BatchEntity,BatchModel>{
  int? feeSubTypeId;
  String? feeSubType;
  int? feeCategoryId;
  String? feeCategory;
  int? feeSubcategoryId;
  String? feeSubcategory;
  int? periodOfServiceId;
  String? periodOfService;
  int? batchId;
  String? batchName;

  BatchEntity({
    this.feeSubTypeId,
    this.feeSubType,
    this.feeCategoryId,
    this.feeCategory,
    this.feeSubcategoryId,
    this.feeSubcategory,
    this.periodOfServiceId,
    this.periodOfService,
    this.batchId,
    this.batchName,
  });

  factory BatchEntity.fromJson(Map<String, dynamic> json) =>
      _$BatchEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BatchEntityToJson(this);

  @override
  BatchModel transform() {
    BatchModel batchModel = BatchModel();
    batchModel.feeSubTypeId = feeSubTypeId;
    batchModel.feeSubType = feeSubType;
    batchModel.feeCategoryId = feeCategoryId;
    batchModel.feeCategory = feeCategory;
    batchModel.feeSubcategoryId = feeSubcategoryId;
    batchModel.feeSubcategory = feeSubcategory;
    batchModel.periodOfServiceId = periodOfServiceId;
    batchModel.periodOfService = periodOfService;
    batchModel.batchId = batchId;
    batchModel.batchName = batchName;
    return batchModel;
  }
}