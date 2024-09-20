import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'cafeteria_enrollment_detail_entity.dart';

part 'cafeteria_enrollment_response_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class CafeteriaEnrollmentResponseEntity extends BaseLayerDataTransformer<CafeteriaEnrollmentResponseEntity,CafeteriaEnrollmentResponseModel>{
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'data')
  CafeteriaEnrollmentDetailEntity? data;

  CafeteriaEnrollmentResponseEntity({
    this.status,
    this.message,
    this.data,
  });

  factory CafeteriaEnrollmentResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$CafeteriaEnrollmentResponseEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CafeteriaEnrollmentResponseEntityToJson(this);

  @override
  CafeteriaEnrollmentResponseModel transform() {
    return CafeteriaEnrollmentResponseModel(
      status: status,
      message: message,
      data: data?.transform(),
    );
  }
}
