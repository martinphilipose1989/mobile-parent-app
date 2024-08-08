

import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/schoo_visit/school_visit_entity.dart';

part 'school_visit_data_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class SchoolVisitDataEntity extends BaseLayerDataTransformer<SchoolVisitDataEntity, SchoolVisitData> {
  @JsonKey(name: 'school_visit')
  List<SchoolVisitEntity>? schoolVisit;

  SchoolVisitDataEntity({
    this.schoolVisit,
  });

  factory SchoolVisitDataEntity.fromJson(Map<String, dynamic> json) =>
      _$SchoolVisitDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SchoolVisitDataEntityToJson(this);

  @override
  SchoolVisitData transform() {
    SchoolVisitData schoolVisitData = SchoolVisitData();
    schoolVisitData.schoolVisit = schoolVisit?.map((visit) => visit.transform()).toList();
    return schoolVisitData;
  }
}