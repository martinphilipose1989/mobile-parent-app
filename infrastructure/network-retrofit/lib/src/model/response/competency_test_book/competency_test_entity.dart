import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'competency_test_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class CompetencyTestEntity extends BaseLayerDataTransformer<CompetencyTestEntity, CompetencyTestDetail> {
  @JsonKey(name: 'competency_test_date')
  String? competencyTestDate;
  @JsonKey(name: 'competency_test_time')
  String? competencyTestTime;
  @JsonKey(name: 'comment')
  String? comment;
  @JsonKey(name: 'test_result')
  String? testResult;
  @JsonKey(name: 'added_by')
  int? addedBy;

    CompetencyTestEntity({
      this.competencyTestDate,
      this.competencyTestTime,
      this.comment,
      this.testResult,
      this.addedBy,
    });

  factory CompetencyTestEntity.fromJson(Map<String, dynamic> json) =>
      _$CompetencyTestEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CompetencyTestEntityToJson(this);

  @override
  CompetencyTestDetail transform() {
    CompetencyTestDetail competencyTestDetail = CompetencyTestDetail();
    competencyTestDetail.competencyTestDate = competencyTestDate;
    competencyTestDetail.competencyTestTime = competencyTestTime;
    competencyTestDetail.comment = comment;
    competencyTestDetail.testResult = testResult;
    competencyTestDetail.addedBy = addedBy;
    return competencyTestDetail;
  }
}