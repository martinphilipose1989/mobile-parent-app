

import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/competency_test_book/competency_test_entity.dart';

part 'competency_test_data_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class CompetencyTestDataEntity extends BaseLayerDataTransformer<CompetencyTestDataEntity, CompetencyTestData> {
  @JsonKey(name: 'competency_test')
  List<CompetencyTestEntity>? competencyTestEntity;

  CompetencyTestDataEntity({
    this.competencyTestEntity,
  });

  factory CompetencyTestDataEntity.fromJson(Map<String, dynamic> json) =>
      _$CompetencyTestDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CompetencyTestDataEntityToJson(this);

  @override
  CompetencyTestData transform() {
    CompetencyTestData competencyTestData = CompetencyTestData();
    competencyTestData.competencyTestDetail = competencyTestEntity?.map((visit) => visit.transform()).toList();
    return competencyTestData;
  }
}