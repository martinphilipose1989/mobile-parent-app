import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:network_retrofit/src/model/response/finance/get_school_names/school_names_data_entity.dart';

part 'get_school_names_response.g.dart';

@JsonSerializable()
class SchoolNamesEntity
    extends BaseLayerDataTransformer<SchoolNamesEntity, SchoolNamesModel> {
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final SchoolnamesDataEntity? data;
  @JsonKey(name: "message")
  final String? message;

  SchoolNamesEntity({
    this.status,
    this.data,
    this.message,
  });

  factory SchoolNamesEntity.fromJson(Map<String, dynamic> json) =>
      _$SchoolNamesEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SchoolNamesEntityToJson(this);

  @override
  SchoolNamesModel transform() {
    // TODO: implement transform
    return SchoolNamesModel(
        data: data!.transform(), message: message, status: status);
  }
}
