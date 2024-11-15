class CreateCommunicationModel {
  int? status;
  CreateCommunicationData? data;
  String? message;

  CreateCommunicationModel({
    this.status,
    this.data,
    this.message,
  });
}

class CreateCommunicationData {
  String? communicationMasterId;
  String? parentId;
  String? communication;
  String? assignTo;
  String? reviewerId;
  DateTime? date;
  String? time;
  String? priorityId;
  String? tat;
  String? status;
  bool? isPublished;
  String? createdBy;
  String? ticketNumber;
  String? ticketTitle;
  String? attachment;
  String? lobs;
  List<String>? modeIds;
  bool? isResponseRequired;
  String? formSlug;
  dynamic toType;
  String? id;
  DateTime? dataCreatedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? dataId;

  CreateCommunicationData({
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
    this.dataCreatedAt,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.dataId,
  });
}
