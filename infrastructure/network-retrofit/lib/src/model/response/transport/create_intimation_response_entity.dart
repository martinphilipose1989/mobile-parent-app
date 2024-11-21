
import 'package:data/data.dart';

import '../../../../network_retrofit.dart';

part 'create_intimation_response_entity.g.dart';


@JsonSerializable()
class CreateIntimationResponseEntity implements BaseLayerDataTransformer<CreateIntimationResponseEntity ,CreateIntimationResponseModel> {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "data")
  IntimationEntity? data;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "success")
  bool? success;

  CreateIntimationResponseEntity({
    this.status,
    this.data,
    this.message,
    this.success,
  });

  factory CreateIntimationResponseEntity.fromJson(Map<String, dynamic> json) => _$CreateIntimationResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CreateIntimationResponseEntityToJson(this);

  @override
  CreateIntimationResponseEntity restore(CreateIntimationResponseModel data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  CreateIntimationResponseModel transform() {
 return CreateIntimationResponseModel(status: status,data: data?.transform(),message: message,success: success);
  }
}

@JsonSerializable()
class IntimationEntity implements BaseLayerDataTransformer<IntimationEntity,Intimation>{
  @JsonKey(name: "global_user_id")
  int? globalUserId;
  @JsonKey(name: "global_student_id")
  int? globalStudentId;
  @JsonKey(name: "from_date")
  DateTime? fromDate;
  @JsonKey(name: "to_date")
  DateTime? toDate;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "initimation_type")
  int? initimationType;
  @JsonKey(name: "note")
  String? note;
  @JsonKey(name: "file_upload_path")
  String? fileUploadPath;
  @JsonKey(name: "approval_flag")
  String? approvalFlag;
  @JsonKey(name: "approved_by_id")
  int? approvedById;
  @JsonKey(name: "created_by")
  String? createdBy;
  @JsonKey(name: "updated_by")
  String? updatedBy;
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;

  IntimationEntity({
    this.globalUserId,
    this.globalStudentId,
    this.fromDate,
    this.toDate,
    this.status,
    this.initimationType,
    this.note,
    this.fileUploadPath,
    this.approvalFlag,
    this.approvedById,
    this.createdBy,
    this.updatedBy,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  factory  IntimationEntity.fromJson(Map<String, dynamic> json) => _$IntimationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$IntimationEntityToJson(this);

  @override
  IntimationEntity restore(Intimation data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  Intimation transform() {
  return Intimation(globalStudentId: globalStudentId,globalUserId: globalUserId,fromDate: fromDate,toDate: toDate,status: status,initimationType: initimationType,id: id,note: note,fileUploadPath: fileUploadPath,approvalFlag: "1",approvedById: approvedById,createdBy: createdBy,createdAt: createdAt,updatedAt: updatedAt,updatedBy: updatedBy);
  }
}
