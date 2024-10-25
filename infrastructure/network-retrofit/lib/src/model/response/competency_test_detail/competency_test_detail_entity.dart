import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'competency_test_detail_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class CompetencyTestDetailEntity extends BaseLayerDataTransformer<CompetencyTestDetailEntity,CompetencyTestDetails>{
    @JsonKey(name: '_id')
    String? id;
    @JsonKey(name: 'enquiryId')
    String? enquiryId;
    @JsonKey(name: 'competencyTestDate')
    String? competencyTestDate;
    @JsonKey(name: 'slot')
    String? slot;
    @JsonKey(name: 'slot_id')
    String? slotId;
    @JsonKey(name: 'mode')
    String? mode;
    @JsonKey(name: 'status')
    String? status;
    @JsonKey(name: 'test_result')
    String? testResult;
    @JsonKey(name: 'createdBy')
    String? createdBy;
    @JsonKey(name: 'createdAt')
    DateTime? createdAt;
    @JsonKey(name: 'updatedAt')
    DateTime? updatedAt;
    @JsonKey(name: '__v')
    int? v;
    @JsonKey(name: 'cancel_comment')
    String? cancelComment;
    @JsonKey(name: 'cancel_reason')
    String? cancelReason;

    CompetencyTestDetailEntity({
        this.id,
        this.enquiryId,
        this.competencyTestDate,
        this.slot,
        this.slotId,
        this.mode,
        this.status,
        this.testResult,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.cancelComment,
        this.cancelReason
    });

  factory CompetencyTestDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$CompetencyTestDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CompetencyTestDetailEntityToJson(this);
  
  @override
  CompetencyTestDetails transform() {
    CompetencyTestDetails competencyTestDetails = CompetencyTestDetails();
    competencyTestDetails.id = id;
    competencyTestDetails.enquiryId = enquiryId;
    competencyTestDetails.competencyTestDate = competencyTestDate;
    competencyTestDetails.slot = slot;
    competencyTestDetails.slotID = slotId;
    competencyTestDetails.mode = mode;
    competencyTestDetails.status = status;
    competencyTestDetails.testResult = testResult;
    competencyTestDetails.createdBy = createdBy;
    competencyTestDetails.createdAt = createdAt;
    competencyTestDetails.updatedAt = updatedAt;
    competencyTestDetails.v= v;
    competencyTestDetails.cancelComment = cancelComment;
    competencyTestDetails.cancelReason = cancelReason;
    return competencyTestDetails;
  }

}