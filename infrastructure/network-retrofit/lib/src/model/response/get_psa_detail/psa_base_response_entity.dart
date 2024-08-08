import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/get_psa_detail/psa_detail_response_entity.dart';

part 'psa_base_response_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class PsaBaseResponseEntity extends BaseLayerDataTransformer<PsaBaseResponseEntity,PsaResponse>{
    @JsonKey(name: 'status')
    int? status;
    @JsonKey(name: 'data')
    PsaDetailResponseEntity? data;
    @JsonKey(name: 'message')
    String? message;

    PsaBaseResponseEntity({this.status,this.data,this.message});

    factory PsaBaseResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$PsaBaseResponseEntityFromJson(json);

    Map<String, dynamic> toJson() => _$PsaBaseResponseEntityToJson(this);

    @override
  PsaResponse transform() {
    PsaResponse psaResponse = PsaResponse();
    psaResponse.status = status;
    psaResponse.data = data?.transform();
    psaResponse.message = message;
    return psaResponse;
  }
}