import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'academic_year_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class AcademicYearEntity extends BaseLayerDataTransformer<AcademicYearEntity,AcademicYear> {
    int? id;
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
}