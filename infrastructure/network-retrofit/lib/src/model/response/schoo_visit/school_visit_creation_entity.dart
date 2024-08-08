import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/schoo_visit/school_visit_data_entity.dart';

part 'school_visit_creation_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class SchoolVisitCreationEntity extends BaseLayerDataTransformer<SchoolVisitCreationEntity, SchoolVisitCreation> {
  @JsonKey(name: 'data')
  SchoolVisitDataEntity? data;

  SchoolVisitCreationEntity({
    this.data,
  });

  factory SchoolVisitCreationEntity.fromJson(Map<String, dynamic> json) =>
      _$SchoolVisitCreationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SchoolVisitCreationEntityToJson(this);

  @override
  SchoolVisitCreation transform() {
    SchoolVisitCreation schoolVisitCreation = SchoolVisitCreation();
    schoolVisitCreation.data = data?.transform();
    return schoolVisitCreation;
  }
}
