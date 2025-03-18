import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:network_retrofit/src/model/response/finance/get_school_names/brand_code_entity.dart';

part 'school_names_data_entity.g.dart';

@JsonSerializable()
class SchoolnamesDataEntity extends BaseLayerDataTransformer<
    SchoolnamesDataEntity, SchoolNamesDataModel> {
  @JsonKey(name: "brandCodes")
  final List<BrandCodEntity>? brandCodes;
  @JsonKey(name: "totalCount")
  final int? totalCount;

  SchoolnamesDataEntity({
    this.brandCodes,
    this.totalCount,
  });

  factory SchoolnamesDataEntity.fromJson(Map<String, dynamic> json) =>
      _$SchoolnamesDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SchoolnamesDataEntityToJson(this);

  @override
  SchoolNamesDataModel transform() {
    // TODO: implement transform
    return SchoolNamesDataModel(
        totalCount: totalCount,
        brandCodes: brandCodes!.map((e) => e.transform()).toList());
  }
}
