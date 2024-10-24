import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'send_communication_entity.g.dart';

@JsonSerializable()
class SendCommunicationEntity extends BaseLayerDataTransformer<
    SendCommunicationEntity, SendCommunicationModel> {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "data")
  Data? data;
  @JsonKey(name: "message")
  String? message;

  SendCommunicationEntity({
    this.status,
    this.data,
    this.message,
  });

  factory SendCommunicationEntity.fromJson(Map<String, dynamic> json) =>
      _$SendCommunicationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SendCommunicationEntityToJson(this);

  @override
  SendCommunicationModel transform() {
    // TODO: implement transform
    return SendCommunicationModel(
        message: message, data: data?.transform(), status: status);
  }
}

@JsonSerializable()
class Data extends BaseLayerDataTransformer<Data, SendCommunicationData> {
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
  SendCommunicationData transform() {
    // TODO: implement transform
    return SendCommunicationData(
        attachmentDetails: attachmentDetails,
        comment: comment,
        communicationId: communicationId,
        createdAt: createdAt,
        id: id,
        isDraft: isDraft,
        rating: rating,
        status: status,
        updatedAt: updatedAt,
        userId: userId,
        v: v);
  }
}
