import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'common_data_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class CommonDataEntity extends BaseLayerDataTransformer<CommonDataEntity,CommonDataClass>{
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'value')
  String? value;

  CommonDataEntity({this.id,this.value});

  factory CommonDataEntity.fromJson(Map<String, dynamic> json) =>
      _$CommonDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CommonDataEntityToJson(this);

  @override
  CommonDataClass transform() {
    CommonDataClass commonDataClass = CommonDataClass();
    commonDataClass.id = id;
    commonDataClass.value = value;
    return commonDataClass;
  }
}