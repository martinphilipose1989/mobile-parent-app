class CommunicationListModel {
  int? status;
  CommunicationListData? data;
  String? message;

  CommunicationListModel({
    this.status,
    this.data,
    this.message,
  });
}

class CommunicationListData {
  List<DataValue>? data;
  Extra? meta;

  CommunicationListData({
    this.data,
    this.meta,
  });
}

class DataValue {
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
  DateTime? dataValueCreatedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  List<CommunicationMasterModel>? communicationMaster;
  String? dataValueId;
  String? formattedDateAndTime;
  int? communicationLogsCount;
  bool isReOpenedClicked;
  bool isMarkAsClosedCliked;

  DataValue(
      {this.id,
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
      this.dataValueCreatedAt,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.communicationMaster,
      this.isReOpenedClicked = false,
      this.isMarkAsClosedCliked = false,
      this.dataValueId,
      this.communicationLogsCount,
      this.formattedDateAndTime});
}

class CommunicationMasterModel {
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

  CommunicationMasterModel({
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
  });
}

class Extra {
  Pagination? pagination;

  Extra({
    this.pagination,
  });
}

class Pagination {
  int? page;
  int? pageSize;
  int? pageCount;
  int? total;

  Pagination({
    this.page,
    this.pageSize,
    this.pageCount,
    this.total,
  });
}
