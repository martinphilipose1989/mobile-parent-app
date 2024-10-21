import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vas_option_response_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class VasOptionResponseEntity extends BaseLayerDataTransformer<
    VasOptionResponseEntity, VasOptionResponse> {
  @JsonKey(name: 'status')
  int? status;
  @JsonKey(name: 'data')
  Map<String, dynamic>? data;
  @JsonKey(name: 'message')
  String? message;

  VasOptionResponseEntity({
    this.status,
    this.data,
    this.message,
  });
  factory VasOptionResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$VasOptionResponseEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$VasOptionResponseEntityToJson(this);

  @override
  VasOptionResponse transform() {
    VasOptionResponse deleteEnquiryFileBase = VasOptionResponse();
    deleteEnquiryFileBase.status = status;
    deleteEnquiryFileBase.data = data;
    deleteEnquiryFileBase.message = message;
    return deleteEnquiryFileBase;
  }
}
