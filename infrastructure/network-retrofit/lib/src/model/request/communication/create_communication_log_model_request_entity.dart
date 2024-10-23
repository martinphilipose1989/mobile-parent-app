import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'create_communication_log_model_request_entity.g.dart';

@JsonSerializable()
class CreateCommunicationLogRequestEntity extends BaseLayerDataTransformer<
    CreateCommunicationLogRequestEntity, CreateCommunicationLogRequest> {
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
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;
  @JsonKey(name: "is_draft")
  bool? isDraft;

  CreateCommunicationLogRequestEntity({
    this.communicationId,
    this.comment,
    this.attachmentDetails,
    this.userId,
    this.status,
    this.rating,
    this.createdAt,
    this.updatedAt,
    this.isDraft,
  });

  factory CreateCommunicationLogRequestEntity.fromJson(
          Map<String, dynamic> json) =>
      _$CreateCommunicationLogRequestEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CreateCommunicationLogRequestEntityToJson(this);

  @override
  CreateCommunicationLogRequestEntity restore(
      CreateCommunicationLogRequest data) {
    // TODO: implement restore
    return CreateCommunicationLogRequestEntity(
        attachmentDetails: data.attachmentDetails,
        comment: data.comment,
        communicationId: data.communicationId,
        createdAt: data.createdAt,
        isDraft: data.isDraft,
        rating: data.rating,
        status: data.status,
        updatedAt: updatedAt,
        userId: data.userId);
  }
}
