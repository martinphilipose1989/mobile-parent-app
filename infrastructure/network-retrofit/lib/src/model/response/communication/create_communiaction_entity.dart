import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'create_communiaction_entity.g.dart';

@JsonSerializable()
class CreateTicketEntity
    extends BaseLayerDataTransformer<CreateTicketEntity, CreateTicketModel> {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "data")
  CreateTicketDataEntity? data;
  @JsonKey(name: "message")
  String? message;

  CreateTicketEntity({
    this.status,
    this.data,
    this.message,
  });

  factory CreateTicketEntity.fromJson(Map<String, dynamic> json) =>
      _$CreateTicketEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CreateTicketEntityToJson(this);

  @override
  CreateTicketModel transform() {
    // TODO: implement transform
    return CreateTicketModel(
        data: data?.transform(), message: message, status: status);
  }
}

@JsonSerializable()
class CreateTicketDataEntity
    extends BaseLayerDataTransformer<CreateTicketDataEntity, CreateTicketData> {
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
  List<dynamic>? modeIds;
  @JsonKey(name: "is_response_required")
  bool? isResponseRequired;
  @JsonKey(name: "to_type")
  dynamic toType;
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "created_at")
  DateTime? dataCreatedAt;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "__v")
  int? v;
  @JsonKey(name: "id")
  String? dataId;

  CreateTicketDataEntity({
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
    this.toType,
    this.id,
    this.dataCreatedAt,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.dataId,
  });

  factory CreateTicketDataEntity.fromJson(Map<String, dynamic> json) =>
      _$CreateTicketDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CreateTicketDataEntityToJson(this);

  @override
  CreateTicketData transform() {
    return CreateTicketData(
      communicationMasterId: communicationMasterId,
      parentId: parentId,
      communication: communication,
      assignTo: assignTo,
      reviewerId: reviewerId,
      date: date,
      time: time,
      priorityId: priorityId,
      tat: tat,
      status: status,
      isPublished: isPublished,
      createdBy: createdBy,
      ticketNumber: ticketNumber,
      ticketTitle: ticketTitle,
      attachment: attachment,
      lobs: lobs,
      modeIds: modeIds,
      isResponseRequired: isResponseRequired,
      toType: toType,
      id: id,
      dataCreatedAt: dataCreatedAt,
      createdAt: createdAt,
      updatedAt: updatedAt,
      v: v,
      dataId: dataId,
    );
  }
}
