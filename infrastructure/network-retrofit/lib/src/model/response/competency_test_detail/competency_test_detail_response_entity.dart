import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/competency_test_detail/competency_test_detail_entity.dart';

part 'competency_test_detail_response_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class CompetencyTestDetailResponseEntity extends BaseLayerDataTransformer<CompetencyTestDetailResponseEntity,CompetencyTestDetailBase>{
    @JsonKey(name: 'status')
    int? status;
    @JsonKey(name: 'data')
    CompetencyTestDetailEntity? data;
    @JsonKey(name: 'message')
    String? message;

    CompetencyTestDetailResponseEntity({
      this.status,
      this.data,
      this.message,
    });

  factory CompetencyTestDetailResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$CompetencyTestDetailResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CompetencyTestDetailResponseEntityToJson(this);

  @override
  CompetencyTestDetailBase transform() {
    CompetencyTestDetailBase competencyTestDetailBase = CompetencyTestDetailBase();
    competencyTestDetailBase.status = status;
    competencyTestDetailBase.data = data?.transform();
    competencyTestDetailBase.message = message;
    return competencyTestDetailBase;
  }
}