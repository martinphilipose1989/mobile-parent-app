import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'create_communication_log_entity.g.dart';

@JsonSerializable()
class CreateCommunicationLogEntity extends BaseLayerDataTransformer<
    CreateCommunicationLogEntity, CreateCommunicationLogModel> {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "data")
  Data? data;
  @JsonKey(name: "message")
  String? message;

  CreateCommunicationLogEntity({
    this.status,
    this.data,
    this.message,
  });

  factory CreateCommunicationLogEntity.fromJson(Map<String, dynamic> json) =>
      _$CreateCommunicationLogEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCommunicationLogEntityToJson(this);

  @override
  CreateCommunicationLogModel transform() {
    // TODO: implement transform
    return CreateCommunicationLogModel(
        data: data?.transform(), status: status, message: message);
  }
}

@JsonSerializable()
class Data
    extends BaseLayerDataTransformer<Data, CreateCommunicationDataModel> {
  @JsonKey(name: "communication_id")
  String? communicationId;
  @JsonKey(name: "comment")
  String? comment;
  @JsonKey(name: "attachment_details")
  String? attachmentDetails;
  @JsonKey(name: "user_id")
  String? userId;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "rating")
  int? rating;
  @JsonKey(name: "is_draft")
  bool? isDraft;
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "__v")
  int? v;

  Data({
    this.communicationId,
    this.comment,
    this.attachmentDetails,
    this.userId,
    this.status,
    this.rating,
    this.isDraft,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  @override
  CreateCommunicationDataModel transform() {
    return CreateCommunicationDataModel(
      communicationId: communicationId,
      comment: comment,
      attachmentDetails: attachmentDetails,
      userId: userId,
      status: status,
      rating: rating,
      isDraft: isDraft,
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      v: v,
    );
  }
}
