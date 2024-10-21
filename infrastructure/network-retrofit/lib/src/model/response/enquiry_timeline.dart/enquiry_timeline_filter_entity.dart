
import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'enquiry_timeline_filter_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class TimeLineFiltersEntity extends BaseLayerDataTransformer<TimeLineFiltersEntity,TimeLineFilters>{
    @JsonKey(name: 'eventType')
    List<String>? eventType;
    @JsonKey(name: 'eventSubType')
    List<String>? eventSubType;

    TimeLineFiltersEntity({
        this.eventType,
        this.eventSubType,
    });

  factory TimeLineFiltersEntity.fromJson(Map<String, dynamic> json) =>
      _$TimeLineFiltersEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TimeLineFiltersEntityToJson(this);

  @override
  TimeLineFilters transform() {
    TimeLineFilters timeLineFilters = TimeLineFilters();
    timeLineFilters.eventType = eventType;
    timeLineFilters.eventSubType = eventSubType;
    return timeLineFilters;
  }
}