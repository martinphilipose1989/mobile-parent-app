import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subject_detail_element_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class SubjectDetailElementEntity extends BaseLayerDataTransformer<SubjectDetailElementEntity,SubjectDetailElement>{
  @JsonKey(name:'id')
  int? id;
  @JsonKey(name:'school_id')
  int? schoolId;
  @JsonKey(name:'school_brand_id')
  dynamic schoolBrandId;
  @JsonKey(name:'subject_id')
  int? subjectId;
  @JsonKey(name:'is_compulsory')
  dynamic isCompulsory;
  @JsonKey(name:'is_optional_compulsory')
  dynamic isOptionalCompulsory;
  @JsonKey(name:'order_no')
  dynamic orderNo;
  @JsonKey(name:'academic_year_id')
  int? academicYearId;
  @JsonKey(name:'status_id')
  dynamic statusId;
  @JsonKey(name: 'school_name')
  String? schoolName;
  @JsonKey(name: 'subject_name')
  dynamic subjectName;
  @JsonKey(name: 'ac_year')
  String? acYear;

  SubjectDetailElementEntity({
    this.id,
    this.schoolId,
    this.schoolBrandId,
    this.subjectId,
    this.isCompulsory,
    this.isOptionalCompulsory,
    this.orderNo,
    this.academicYearId,
    this.statusId,
    this.schoolName,
    this.subjectName,
    this.acYear,
  });

  factory SubjectDetailElementEntity.fromJson(Map<String, dynamic> json) =>
      _$SubjectDetailElementEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectDetailElementEntityToJson(this);

  @override
    SubjectDetailElement transform() {
    SubjectDetailElement subjectDetailElement = SubjectDetailElement();
    subjectDetailElement.id = id;
    subjectDetailElement.schoolId = schoolId;
    subjectDetailElement.schoolBrandId = schoolBrandId;
    subjectDetailElement.subjectId = subjectId;
    subjectDetailElement.isCompulsory = isCompulsory;
    subjectDetailElement.isOptionalCompulsory = isOptionalCompulsory;
    subjectDetailElement.orderNo = orderNo;
    subjectDetailElement.academicYearId = academicYearId;
    subjectDetailElement.statusId = statusId;
    subjectDetailElement.schoolName = schoolName;
    subjectDetailElement.subjectName = subjectName;
    subjectDetailElement.acYear = acYear;
    return subjectDetailElement;
  }
}