import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:network_retrofit/src/model/response/finance/get_academic_year/year_data_entity.dart';

part 'get_academic_year_response_entity.g.dart';

@JsonSerializable()
class GetAcademicYearResponseEntity extends BaseLayerDataTransformer<
    GetAcademicYearResponseEntity, GetAcademicYearModel> {
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final List<YearDataEntity>? data;
  @JsonKey(name: "message")
  final String? message;

  GetAcademicYearResponseEntity({
    this.status,
    this.data,
    this.message,
  });

  factory GetAcademicYearResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$GetAcademicYearResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetAcademicYearResponseEntityToJson(this);

  @override
  GetAcademicYearModel transform() {
    return GetAcademicYearModel(
        data: data!.map((e) => YearData(id: e.id, name: e.name)).toList(),
        message: message,
        status: status);
  }
}
