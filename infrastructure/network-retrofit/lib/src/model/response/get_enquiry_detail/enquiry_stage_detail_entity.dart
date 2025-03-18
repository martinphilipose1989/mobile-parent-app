import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'enquiry_stage_detail_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class EnquiryStageDetailEntity extends BaseLayerDataTransformer<EnquiryStageDetailEntity,EnquiryStage>{
    @JsonKey(name: 'stage_id')
    String? stageId;
    @JsonKey(name: 'stage_name')
    String? stageName;
    @JsonKey(name: 'status')
    String? status;

    EnquiryStageDetailEntity({
        this.stageId,
        this.stageName,
        this.status,
    });

  factory EnquiryStageDetailEntity.fromJson(Map<String, dynamic> json) =>
    _$EnquiryStageDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => _$EnquiryStageDetailEntityToJson(this);

  @override
  EnquiryStage transform() {
    EnquiryStage enquiryStage = EnquiryStage();
    enquiryStage.stageId = stageId;
    enquiryStage.stageName = stageName;
    enquiryStage.status = status;
    return enquiryStage;
  }
}