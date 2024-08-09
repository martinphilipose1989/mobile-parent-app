import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'download_enquiry_file_response_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class DownloadEnquiryFileResponseEntity extends BaseLayerDataTransformer<DownloadEnquiryFileResponseEntity,DownloadEnquiryFileBase>{
  @JsonKey(name: 'status')
  int? status;
  @JsonKey(name: 'data')
  dynamic data;
  @JsonKey(name: 'message')
  String? message;

  DownloadEnquiryFileResponseEntity({
    this.status,
    this.data,
    this.message
  });

  factory DownloadEnquiryFileResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$DownloadEnquiryFileResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DownloadEnquiryFileResponseEntityToJson(this);

  @override
  DownloadEnquiryFileBase transform() {
    DownloadEnquiryFileBase downloadEnquiryFileBase = DownloadEnquiryFileBase();
    downloadEnquiryFileBase.status = status;
    downloadEnquiryFileBase.data = data;
    downloadEnquiryFileBase.message = message;
    return downloadEnquiryFileBase;
  }
}