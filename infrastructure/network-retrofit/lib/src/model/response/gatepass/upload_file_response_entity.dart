import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'upload_file_response_entity.g.dart';

@JsonSerializable()
class UploadFileResponseEntity
    implements
        BaseLayerDataTransformer<UploadFileResponseEntity,
            UploadFileResponseModel> {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "data")
  UploadResponseDataEntity? data;
  @JsonKey(name: "message")
  String? message;

  UploadFileResponseEntity({this.status, this.data, this.message});

  factory UploadFileResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$UploadFileResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UploadFileResponseEntityToJson(this);

  @override
  UploadFileResponseEntity restore(UploadFileResponseModel data) {
    return UploadFileResponseEntity();
  }

  @override
  UploadFileResponseModel transform() {
    return UploadFileResponseModel(
        status: status, data: data?.transform(), message: message);
  }
}

@JsonSerializable()
class UploadResponseDataEntity
    implements
        BaseLayerDataTransformer<UploadResponseDataEntity,
            UploadFileResponseData> {
  @JsonKey(name: "filePath")
  String? filePath;
  @JsonKey(name: "fileName")
  String? fileName;
  @JsonKey(name: "url")
  String? url;

  UploadResponseDataEntity({this.filePath, this.url, this.fileName});

  factory UploadResponseDataEntity.fromJson(Map<String, dynamic> json) =>
      _$UploadResponseDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UploadResponseDataEntityToJson(this);

  @override
  UploadResponseDataEntity restore(UploadFileResponseData data) {
    return UploadResponseDataEntity(
        filePath: data.filePath, url: data.url, fileName: data.fileName);
  }

  @override
  UploadFileResponseData transform() {
    return UploadFileResponseData(
      filePath: filePath,
      url: url,
      fileName: fileName,
    );
  }
}
