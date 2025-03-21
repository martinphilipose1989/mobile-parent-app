import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admission_journey_detail_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class AdmissionJourneyDetailEntity extends BaseLayerDataTransformer<AdmissionJourneyDetailEntity,AdmissionJourneyDetail>{
    @JsonKey(name: 'stage')
    String? stage;
    @JsonKey(name: 'status')
    String? status;
    @JsonKey(name: 'comment')
    String? comment;

    AdmissionJourneyDetailEntity({
        this.stage,
        this.status,
        this.comment
    });

  factory AdmissionJourneyDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$AdmissionJourneyDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AdmissionJourneyDetailEntityToJson(this);

  @override
  AdmissionJourneyDetail transform() {
    AdmissionJourneyDetail admissionJourneyDetail = AdmissionJourneyDetail();
    admissionJourneyDetail.stage = stage;
    admissionJourneyDetail.status = status;
    admissionJourneyDetail.comment = comment;
    return admissionJourneyDetail;
  }
}