import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/get_admission_journey/admission_journey_detail_entity.dart';

part 'admission_journey_base_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class AdmissionJourneyBaseEntity extends BaseLayerDataTransformer<AdmissionJourneyBaseEntity,AdmissionJourneyBase>{
    @JsonKey(name: 'status')
    int? status;
    @JsonKey(name: 'data')
    List<AdmissionJourneyDetailEntity> data;
    @JsonKey(name: 'message')
    String? message;

    AdmissionJourneyBaseEntity({
        required this.status,
        required this.data,
        required this.message,
    });

    factory AdmissionJourneyBaseEntity.fromJson(Map<String, dynamic> json) =>
      _$AdmissionJourneyBaseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AdmissionJourneyBaseEntityToJson(this);

  @override
  AdmissionJourneyBase transform() {
    AdmissionJourneyBase admissionJourneyBase = AdmissionJourneyBase();
    admissionJourneyBase.data = data.map((element)=> element.transform()).toList();
    admissionJourneyBase.status = status;
    admissionJourneyBase.message = message;
    return admissionJourneyBase;
  }
}