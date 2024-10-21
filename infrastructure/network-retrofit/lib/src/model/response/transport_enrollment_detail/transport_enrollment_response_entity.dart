import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/transport_enrollment_detail/transport_enrollment_detail_entity.dart';

part 'transport_enrollment_response_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class TransportEnrollmentResponseEntity extends BaseLayerDataTransformer<TransportEnrollmentResponseEntity,TransportEnrollmentResponseModel>{
    @JsonKey(name: 'status')
    String? status;
    @JsonKey(name: 'message')
    String? message;
    @JsonKey(name: 'data')
    TransportEnrollmentDetailEntity? data;

    TransportEnrollmentResponseEntity({
        this.status,
        this.message,
        this.data,
    });

    factory TransportEnrollmentResponseEntity.fromJson(Map<String, dynamic> json) => _$TransportEnrollmentResponseEntityFromJson(json);

    Map<String, dynamic> toJson() => _$TransportEnrollmentResponseEntityToJson(this);

  @override
  TransportEnrollmentResponseModel transform() {
    return TransportEnrollmentResponseModel(
      status: status,
      message: message,
      data: data?.transform(),
    );
  }
}