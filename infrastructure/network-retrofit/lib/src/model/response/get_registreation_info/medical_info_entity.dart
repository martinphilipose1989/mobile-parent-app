import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/get_registreation_info/medical_details_entity.dart';

part 'medical_info_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class MedicalInfoEntity  extends BaseLayerDataTransformer<MedicalInfoEntity,MedicalInfo>{
    @JsonKey(name: 'status')
    int? status;
    @JsonKey(name: 'data')
    MedicalDetailsEntity? data;
    @JsonKey(name: 'message')
    String? message;

    MedicalInfoEntity({
        this.status,
        this.data,
        this.message,
    });

    factory MedicalInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$MedicalInfoEntityFromJson(json);

    Map<String, dynamic> toJson() => _$MedicalInfoEntityToJson(this);

  @override
  MedicalInfo transform() {
    MedicalInfo medicalInfo =MedicalInfo();
    medicalInfo.status =status;
    medicalInfo.data = data?.transform();
    medicalInfo.message = message;
    return medicalInfo;
    
  }

}