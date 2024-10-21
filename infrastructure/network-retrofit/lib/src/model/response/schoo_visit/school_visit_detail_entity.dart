import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'school_visit_detail_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class SchoolVisitDetailEntity extends BaseLayerDataTransformer<SchoolVisitDetailEntity, SchoolVisitDetail> {

  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'enquiry_id')
  String? enquiryId;
  @JsonKey(name: 'date')
  String? schoolVisitDate;
  @JsonKey(name: 'slot')
  String? slot;
  @JsonKey(name: 'slot_id')
  String? slotId;
  @JsonKey(name: 'comment')
  String? comment;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'createdBy')
  String? createdBy;
  @JsonKey(name: 'activities')
  List<dynamic>? activities;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @JsonKey(name: '__v')
  int? v;
  @JsonKey(name: 'cancel_comment')
  String? cancelComment;
  @JsonKey(name: 'cancel_reason')
  String? cancelReason;

    SchoolVisitDetailEntity({
      this.id,
      this.enquiryId,
      this.schoolVisitDate,
      this.slot,
      this.slotId,
      this.comment,
      this.status,
      this.createdBy,
      this.activities,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.cancelComment,
      this.cancelReason
    });

  factory SchoolVisitDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$SchoolVisitDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SchoolVisitDetailEntityToJson(this);

  @override
  SchoolVisitDetail transform() {
    SchoolVisitDetail schoolVisit = SchoolVisitDetail();
    schoolVisit.id = id;
    schoolVisit.enquiryId = enquiryId;
    schoolVisit.schoolVisitDate = schoolVisitDate;
    schoolVisit.slot = slot;
    schoolVisit.slotId = slotId;
    schoolVisit.comment = comment;
    schoolVisit.status = status;
    schoolVisit.createdBy = createdBy;
    schoolVisit.activities = activities;
    schoolVisit.createdAt = createdAt;
    schoolVisit.updatedAt = updatedAt;
    schoolVisit.v = v;
    schoolVisit.cancelComment = cancelComment;
    schoolVisit.cancelReason = cancelReason;
    return schoolVisit;
  }
}