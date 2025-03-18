import 'package:data/data.dart';
import 'package:network_retrofit/src/model/response/psa_enrollment_detail/psa_enrollment_detail_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'psa_enrollment_detail_response_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class PsaEnrollmentDetailResponseEntity extends BaseLayerDataTransformer<PsaEnrollmentDetailEntity,PsaEnrollmentDetailResponseModel> {
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'data')
  PsaEnrollmentDetailEntity? data;

  PsaEnrollmentDetailResponseEntity({
    this.status,
    this.message,
    this.data,
  });

  factory PsaEnrollmentDetailResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$PsaEnrollmentDetailResponseEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PsaEnrollmentDetailResponseEntityToJson(this);

  @override
  PsaEnrollmentDetailResponseModel transform() {
    PsaEnrollmentDetailResponseModel psaEnrollmentDetailResponseModel = PsaEnrollmentDetailResponseModel();
    psaEnrollmentDetailResponseModel.status = status;
    psaEnrollmentDetailResponseModel.message = message;
    psaEnrollmentDetailResponseModel.data = data?.transform();
    return psaEnrollmentDetailResponseModel;
  }
}