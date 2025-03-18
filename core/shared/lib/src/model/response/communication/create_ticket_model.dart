class CreateTicketModel {
  int? status;
  CreateTicketData? data;
  String? message;

  CreateTicketModel({
    this.status,
    this.data,
    this.message,
  });
}

class CreateTicketData {
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
  List<dynamic>? modeIds;
  bool? isResponseRequired;
  dynamic toType;
  String? id;
  DateTime? dataCreatedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? dataId;

  CreateTicketData({
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
}
