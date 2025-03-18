import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/enquiry_timeline.dart/enquiry_timeline_detail_entity.dart';
import 'package:network_retrofit/src/model/response/enquiry_timeline.dart/enquiry_timeline_filter_entity.dart';

part 'enquiry_timeline_data_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class EnquiryTimelineDataEntity extends BaseLayerDataTransformer<EnquiryTimelineDataEntity,EnquiryTimelineData>{
    @JsonKey(name: 'filters')
    TimeLineFiltersEntity? filters;
    @JsonKey(name: 'timeline')
    List<EnquiryTimelineDetailEntity>? timeline;

    EnquiryTimelineDataEntity({
        this.filters,
        this.timeline,
    });

  factory EnquiryTimelineDataEntity.fromJson(Map<String, dynamic> json) =>
      _$EnquiryTimelineDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$EnquiryTimelineDataEntityToJson(this);

  @override
  EnquiryTimelineData transform() {
    EnquiryTimelineData enquiryTimelineData = EnquiryTimelineData();
    enquiryTimelineData.filters = filters?.transform();
    enquiryTimelineData.timeline = timeline?.map((element)=> element.transform()).toList();
    return enquiryTimelineData;
  }

}