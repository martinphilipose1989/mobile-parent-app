class GetCommunicationDetails {
  int? status;
  GetCommunicationDetailsData? data;
  String? message;

  GetCommunicationDetails({
    this.status,
    this.data,
    this.message,
  });
}

class GetCommunicationDetailsData {
  String? id;
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
  String? toType;
  DateTime? dataCreatedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  List<CommunicationLogData>? communicationLogs;
  List<CommunicationMasterData>? communicationMaster;
  String? dataId;
  String? priority;

  GetCommunicationDetailsData({
    this.id,
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
    this.dataCreatedAt,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.communicationLogs,
    this.communicationMaster,
    this.dataId,
    this.priority,
  });
}

class CommunicationLogData {
  String? id;
  String? communicationId;
  String? comment;
  String? attachmentDetails;
  String? userId;
  bool? isDraft;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? user;

  CommunicationLogData({
    this.id,
    this.communicationId,
    this.comment,
    this.attachmentDetails,
    this.userId,
    this.isDraft,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.user,
  });
}

class CommunicationMasterData {
  String? id;
  String? slug;
  int? categoryId;
  int? subCategoryId;
  String? response;
  int? priorityId;
  int? hris;
  List<dynamic>? groupId;
  int? type;
  int? subTypeId;
  int? subSubTypeId;
  dynamic toType;
  String? fromType;
  String? subject;
  int? workflowId;
  String? dynamicFormId;
  int? reviewerHris;
  int? tatValue;
  int? tatType;
  String? navigationInstruction;
  String? navigationLink;
  bool? isDraft;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? communicationMasterId;
  String? category;
  String? subCategory;

  CommunicationMasterData({
    this.id,
    this.slug,
    this.categoryId,
    this.subCategoryId,
    this.response,
    this.priorityId,
    this.hris,
    this.groupId,
    this.type,
    this.subTypeId,
    this.subSubTypeId,
    this.toType,
    this.fromType,
    this.subject,
    this.workflowId,
    this.dynamicFormId,
    this.reviewerHris,
    this.tatValue,
    this.tatType,
    this.navigationInstruction,
    this.navigationLink,
    this.isDraft,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.communicationMasterId,
    this.category,
    this.subCategory,
  });
}
