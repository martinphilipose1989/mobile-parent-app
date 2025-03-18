import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'create_commincation_entity.g.dart';

@JsonSerializable()
class CreateCommunicationEntity extends BaseLayerDataTransformer<
    CreateCommunicationEntity, CreateCommunicationModel> {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "CreateCommunicationDataEntity")
  CreateCommunicationDataEntity? createCommunicationDataEntity;
  @JsonKey(name: "message")
  String? message;

  CreateCommunicationEntity({
    this.status,
    this.createCommunicationDataEntity,
    this.message,
  });

  factory CreateCommunicationEntity.fromJson(Map<String, dynamic> json) =>
      _$CreateCommunicationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCommunicationEntityToJson(this);

  @override
  CreateCommunicationModel transform() {
    // TODO: implement transform
    return CreateCommunicationModel(
        data: createCommunicationDataEntity?.transform(),
        message: message,
        status: status);
  }
}

@JsonSerializable()
class CreateCommunicationDataEntity extends BaseLayerDataTransformer<
    CreateCommunicationDataEntity, CreateCommunicationData> {
  @JsonKey(name: "communication_master_id")
  String? communicationMasterId;
  @JsonKey(name: "parent_id")
  String? parentId;
  @JsonKey(name: "communication")
  String? communication;
  @JsonKey(name: "assign_to")
  String? assignTo;
  @JsonKey(name: "reviewer_id")
  String? reviewerId;
  @JsonKey(name: "date")
  DateTime? date;
  @JsonKey(name: "time")
  String? time;
  @JsonKey(name: "priority_id")
  String? priorityId;
  @JsonKey(name: "tat")
  String? tat;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "is_published")
  bool? isPublished;
  @JsonKey(name: "created_by")
  String? createdBy;
  @JsonKey(name: "ticket_number")
  String? ticketNumber;
  @JsonKey(name: "ticket_title")
  String? ticketTitle;
  @JsonKey(name: "attachment")
  String? attachment;
  @JsonKey(name: "lobs")
  String? lobs;
  @JsonKey(name: "mode_ids")
  List<String>? modeIds;
  @JsonKey(name: "is_response_required")
  bool? isResponseRequired;
  @JsonKey(name: "form_slug")
  String? formSlug;
  @JsonKey(name: "to_type")
  dynamic toType;
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "created_at")
  DateTime? createCommunicationDataEntityCreatedAt;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "__v")
  int? v;
  @JsonKey(name: "id")
  String? createCommunicationDataEntityId;

  CreateCommunicationDataEntity({
    this.communicationMasterId,
    this.parentId,
    this.communication,
    this.assignTo,
    this.reviewerId,
    this.date,
    this.time,
    this.priorityId,
    this.tat,
    this.status,
    this.isPublished,
    this.createdBy,
    this.ticketNumber,
    this.ticketTitle,
    this.attachment,
    this.lobs,
    this.modeIds,
    this.isResponseRequired,
    this.formSlug,
    this.toType,
    this.id,
    this.createCommunicationDataEntityCreatedAt,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.createCommunicationDataEntityId,
  });

  factory CreateCommunicationDataEntity.fromJson(Map<String, dynamic> json) =>
      _$CreateCommunicationDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCommunicationDataEntityToJson(this);

  @override
  CreateCommunicationData transform() {
    // TODO: implement transform
    return CreateCommunicationData(
        assignTo: assignTo,
        attachment: attachment,
        communication: communication,
        communicationMasterId: communicationMasterId,
        createdAt: createdAt,
        createdBy: createdBy,
        dataCreatedAt: createdAt,
        id: id,
        date: date,
        formSlug: formSlug,
        isPublished: isPublished,
        isResponseRequired: isResponseRequired,
        lobs: lobs,
        modeIds: modeIds,
        parentId: parentId,
        priorityId: priorityId,
        reviewerId: reviewerId,
        status: status,
        tat: tat,
        ticketNumber: ticketNumber,
        ticketTitle: ticketTitle,
        time: time,
        toType: toType,
        updatedAt: updatedAt,
        dataId: createCommunicationDataEntityId,
        v: v);
  }
}
