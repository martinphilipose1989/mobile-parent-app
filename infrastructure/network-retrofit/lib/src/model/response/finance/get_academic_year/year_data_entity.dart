import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'year_data_entity.g.dart';

@JsonSerializable()
class YearDataEntity
    extends BaseLayerDataTransformer<YearDataEntity, YearData> {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;

  YearDataEntity({
    this.id,
    this.name,
  });

  factory YearDataEntity.fromJson(Map<String, dynamic> json) =>
      _$YearDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$YearDataEntityToJson(this);

  @override
  YearData transform() {
    // TODO: implement transform
    return YearData(id: id, name: name);
  }
}
