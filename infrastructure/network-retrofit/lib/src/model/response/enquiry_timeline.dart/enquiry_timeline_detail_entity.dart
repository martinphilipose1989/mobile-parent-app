import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'enquiry_timeline_detail_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class EnquiryTimelineDetailEntity extends BaseLayerDataTransformer<EnquiryTimelineDetailEntity,EnquiryTimelineDetail>{
    @JsonKey(name: '_id')
    String? id;
    @JsonKey(name: 'enquiry_id')
    String? enquiryId;
    @JsonKey(name: 'event_type')
    String? eventType;
    @JsonKey(name: 'event_sub_type')
    String? eventSubType;
    @JsonKey(name: 'event')
    String? event;
    @JsonKey(name: 'created_at')
    String? createdAt;

    EnquiryTimelineDetailEntity({
        this.id,
        this.enquiryId,
        this.eventType,
        this.eventSubType,
        this.event,
        this.createdAt,
    });

  factory EnquiryTimelineDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$EnquiryTimelineDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => _$EnquiryTimelineDetailEntityToJson(this);

  @override
  EnquiryTimelineDetail transform() {
    EnquiryTimelineDetail enquiryTimelineDetail = EnquiryTimelineDetail();
    enquiryTimelineDetail.id = id;
    enquiryTimelineDetail.enquiryId = enquiryId;
    enquiryTimelineDetail.eventType = eventType;
    enquiryTimelineDetail.eventSubType = eventSubType;
    enquiryTimelineDetail.event = event;
    enquiryTimelineDetail.createdAt = createdAt;
    return enquiryTimelineDetail;
  }
}