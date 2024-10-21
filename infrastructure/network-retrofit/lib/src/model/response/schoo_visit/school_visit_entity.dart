import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/schoo_visit/school_visit_detail_entity.dart';

part 'school_visit_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class SchoolVisitEntity extends BaseLayerDataTransformer<SchoolVisitEntity, SchoolVisitDetailBase> {
  @JsonKey(name: 'status')
  int? status;
  @JsonKey(name: 'data')
  SchoolVisitDetailEntity? data;
  @JsonKey(name: 'message')
  String? message;

  SchoolVisitEntity({
    this.data,
  });

  factory SchoolVisitEntity.fromJson(Map<String, dynamic> json) =>
      _$SchoolVisitEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SchoolVisitEntityToJson(this);

  @override
  SchoolVisitDetailBase transform() {
    SchoolVisitDetailBase schoolVisitDetailBase = SchoolVisitDetailBase();
    schoolVisitDetailBase.status =status;
    schoolVisitDetailBase.data = data?.transform();
    schoolVisitDetailBase.message = message;
    return schoolVisitDetailBase;
  }
}
