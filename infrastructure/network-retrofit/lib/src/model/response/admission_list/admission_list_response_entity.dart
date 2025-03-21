import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/admission_list/admissionlist_base_response_entity.dart';

part 'admission_list_response_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class AdmissionListResponseEntity extends BaseLayerDataTransformer<
    AdmissionListResponseEntity, AdmissionListBaseModel> {
  @JsonKey(name: 'status')
  int? status;
  @JsonKey(name: 'data')
  AdmissionListBaseResponseEntity? data;
  @JsonKey(name: 'message')
  String? message;

  AdmissionListResponseEntity({
    this.status,
    this.data,
    this.message,
  });

  factory AdmissionListResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$AdmissionListResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AdmissionListResponseEntityToJson(this);

  @override
  AdmissionListBaseModel transform() {
    AdmissionListBaseModel admissionListBaseModel = AdmissionListBaseModel();
    admissionListBaseModel.status = status;
    admissionListBaseModel.data = data?.transform();
    admissionListBaseModel.message = message;
    return admissionListBaseModel;
  }
}
