import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fee_sub_type_entity.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class FeeSubTypeEntity extends BaseLayerDataTransformer<FeeSubTypeEntity, FeeSubTypeModel> {
  int? feeSubTypeId;
  String? feeSubType;

  FeeSubTypeEntity({
    this.feeSubTypeId,
    this.feeSubType,
  });

  factory FeeSubTypeEntity.fromJson(Map<String, dynamic> json) =>
      _$FeeSubTypeEntityFromJson(json);

  Map<String, dynamic> toJson() => _$FeeSubTypeEntityToJson(this);

  @override
  FeeSubTypeModel transform() {
    FeeSubTypeModel feeSubTypeModel = FeeSubTypeModel();
    feeSubTypeModel.feeSubTypeId = feeSubTypeId;
    feeSubTypeModel.feeSubType = feeSubType;
    return feeSubTypeModel;
  } 

}
