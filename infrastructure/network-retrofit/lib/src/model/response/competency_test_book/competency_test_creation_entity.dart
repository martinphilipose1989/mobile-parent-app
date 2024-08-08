import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/competency_test_book/competency_test_data_entity.dart';

part 'competency_test_creation_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class CompetencyTestCreationEntity extends BaseLayerDataTransformer<CompetencyTestCreationEntity, CompetencyTestCreation> {
  @JsonKey(name: 'data')
  CompetencyTestDataEntity? data;

  CompetencyTestCreationEntity({
    this.data,
  });

  factory CompetencyTestCreationEntity.fromJson(Map<String, dynamic> json) =>
      _$CompetencyTestCreationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CompetencyTestCreationEntityToJson(this);

  @override
  CompetencyTestCreation transform() {
    CompetencyTestCreation competencyTestCreation = CompetencyTestCreation();
    competencyTestCreation.data = data?.transform();
    return competencyTestCreation;
  }
}
