import 'package:data/data.dart';

import '../../../../network_retrofit.dart';
part 'upload_intimation_file_response_entity.g.dart';
@JsonSerializable()
class UploadIntimationFileResponseEntity  implements BaseLayerDataTransformer<UploadIntimationFileResponseEntity,UploadIntimationFileResponseModel>{
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "data")
 IntimationFileEntity? data;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "success")
  bool? success;

  UploadIntimationFileResponseEntity({
    this.status,
    this.data,
    this.message,
    this.success,
  });

  factory UploadIntimationFileResponseEntity.fromJson(Map<String, dynamic> json) => _$UploadIntimationFileResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UploadIntimationFileResponseEntityToJson(this);

  @override
  UploadIntimationFileResponseEntity restore(UploadIntimationFileResponseModel data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  UploadIntimationFileResponseModel transform() {
return UploadIntimationFileResponseModel(status: status,data: data?.transform(),message: message,success: success);
  }
}

@JsonSerializable()
class IntimationFileEntity implements BaseLayerDataTransformer<IntimationFileEntity,IntimationFile> {
  @JsonKey(name: "file_attachment")
  String? fileAttachment;

  IntimationFileEntity({
    this.fileAttachment,
  });

  factory  IntimationFileEntity.fromJson(Map<String, dynamic> json) => _$IntimationFileEntityFromJson(json);

  Map<String, dynamic> toJson() => _$IntimationFileEntityToJson(this);

  @override
  IntimationFileEntity restore(IntimationFile data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  IntimationFile transform() {
  return IntimationFile(fileAttachment: fileAttachment);
  }
}
