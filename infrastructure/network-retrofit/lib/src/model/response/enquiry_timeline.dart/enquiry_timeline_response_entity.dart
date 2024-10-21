import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/enquiry_timeline.dart/enquiry_timeline_data_entity.dart';

part 'enquiry_timeline_response_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class EnquiryTimeLineResponseEntity extends BaseLayerDataTransformer<EnquiryTimeLineResponseEntity,EnquiryTimeLineBase>{
    @JsonKey(name: 'status')
    int? status;
    @JsonKey(name: 'data')
    EnquiryTimelineDataEntity? data;
    @JsonKey(name: 'message')
    String? message;

    EnquiryTimeLineResponseEntity({
        this.status,
        this.data,
        this.message,
    });

  factory EnquiryTimeLineResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$EnquiryTimeLineResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$EnquiryTimeLineResponseEntityToJson(this);

  @override
  EnquiryTimeLineBase transform() {
    EnquiryTimeLineBase enquiryTimeLineBase = EnquiryTimeLineBase();
    enquiryTimeLineBase.status = status;
    enquiryTimeLineBase.data = data?.transform();
    enquiryTimeLineBase.message = message;
    return enquiryTimeLineBase;
  }
}