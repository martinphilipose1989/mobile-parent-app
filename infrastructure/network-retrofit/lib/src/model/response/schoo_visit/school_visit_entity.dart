import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'school_visit_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class SchoolVisitEntity extends BaseLayerDataTransformer<SchoolVisitEntity, SchoolVisitDetail> {
  @JsonKey(name: 'school_visit_date')
  String? schoolVisitDate;
  @JsonKey(name: 'school_visit_time')
  String? schoolVisitTime;
  @JsonKey(name: 'comment')
  String? comment;
  @JsonKey(name: 'added_by')
  int? addedBy;

  SchoolVisitEntity({
    this.schoolVisitDate,
    this.schoolVisitTime,
    this.comment,
    this.addedBy,
  });

  factory SchoolVisitEntity.fromJson(Map<String, dynamic> json) =>
      _$SchoolVisitEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SchoolVisitEntityToJson(this);

  @override
  SchoolVisitDetail transform() {
    SchoolVisitDetail schoolVisit = SchoolVisitDetail();
    schoolVisit.schoolVisitDate = schoolVisitDate;
    schoolVisit.schoolVisitTime = schoolVisitTime;
    schoolVisit.comment = comment;
    schoolVisit.addedBy = addedBy;
    return schoolVisit;
  }
}