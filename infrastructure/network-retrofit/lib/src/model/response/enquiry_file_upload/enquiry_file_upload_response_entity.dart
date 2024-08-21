import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'enquiry_file_upload_response_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class EnquiryFileUploadResponseEntity extends BaseLayerDataTransformer<EnquiryFileUploadResponseEntity,EnquiryFileUploadBase>{
  @JsonKey(name: 'status')
  int? status;
  @JsonKey(name: 'data')
  Map<String,dynamic>? data;
  @JsonKey(name: 'message')
  String? message;

  EnquiryFileUploadResponseEntity({
    this.status,
    this.data,
    this.message
  });

  factory EnquiryFileUploadResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$EnquiryFileUploadResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$EnquiryFileUploadResponseEntityToJson(this);

  @override
  EnquiryFileUploadBase transform() {
    EnquiryFileUploadBase enquiryFileUploadBase = EnquiryFileUploadBase();
    enquiryFileUploadBase.status = status;
    enquiryFileUploadBase.data = data;
    enquiryFileUploadBase.message = message;
    return enquiryFileUploadBase;
  }
}