import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'academic_year_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class AcademicYearEntity extends BaseLayerDataTransformer<AcademicYearEntity,AcademicYear> {
    @JsonKey(name: 'id')
    int? id;
    @JsonKey(name: 'value')
    String? value;

    AcademicYearEntity({this.id,this.value});

  factory AcademicYearEntity.fromJson(Map<String, dynamic> json) =>
      _$AcademicYearEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AcademicYearEntityToJson(this);

  @override
  AcademicYear transform() {
    AcademicYear academicYear = AcademicYear();
    academicYear.id =id;
    academicYear.value = value;
    return academicYear;
  }

  @override
  AcademicYearEntity restore(AcademicYear data) {
    AcademicYearEntity academicYearEntity = AcademicYearEntity(
      value : data.value,
      id : data.id
    );
    return academicYearEntity;
  }
}