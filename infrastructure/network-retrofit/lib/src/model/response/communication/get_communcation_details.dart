import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'get_communcation_details.g.dart';

@JsonSerializable()
class GetCommunicationEntity extends BaseLayerDataTransformer<
    GetCommunicationEntity, GetCommunicationDetails> {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "data")
  Data? data;
  @JsonKey(name: "message")
  String? message;

  GetCommunicationEntity({
    this.status,
    this.data,
    this.message,
  });

  factory GetCommunicationEntity.fromJson(Map<String, dynamic> json) =>
      _$GetCommunicationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetCommunicationEntityToJson(this);

  @override
  GetCommunicationDetails transform() {
    // TODO: implement transform
    return GetCommunicationDetails(
        message: message, status: status, data: data?.transform());
  }
}

@JsonSerializable()
class Data extends BaseLayerDataTransformer<Data, GetCommunicationDetailsData> {
  @JsonKey(name: "_id")
  String? id;
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
  String? toType;
  @JsonKey(name: "created_at")
  DateTime? dataCreatedAt;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "__v")
  int? v;
  @JsonKey(name: "communication_logs")
  List<CommunicationLog>? communicationLogs;
  @JsonKey(name: "communication_master")
  List<CommunicationMaster>? communicationMaster;
  @JsonKey(name: "id")
  String? dataId;
  @JsonKey(name: "priority")
  String? priority;

  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  @override
  GetCommunicationDetailsData transform() {
    // TODO: implement transform
    return GetCommunicationDetailsData(
        assignTo: assignTo,
        attachment: attachment,
        communication: communication,
        communicationLogs: communicationLogs
            ?.map(
              (e) => e.transform(),
            )
            .toList(),
        communicationMaster: communicationMaster
            ?.map(
              (e) => e.transform(),
            )
            .toList(),
        communicationMasterId: communicationMasterId,
        createdAt: createdAt,
        createdBy: createdBy,
        dataCreatedAt: dataCreatedAt,
        dataId: dataId,
        date: date,
        id: id,
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
        priority: priority,
        v: v);
  }
}

@JsonSerializable()
class CommunicationLog
    extends BaseLayerDataTransformer<CommunicationLog, CommunicationLogData> {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "communication_id")
  String? communicationId;
  @JsonKey(name: "comment")
  String? comment;
  @JsonKey(name: "attachment_details")
  String? attachmentDetails;
  @JsonKey(name: "user_id")
  String? userId;
  @JsonKey(name: "is_draft")
  bool? isDraft;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "__v")
  int? v;
  @JsonKey(name: "user")
  String? user;

  CommunicationLog(
      {this.id,
      this.communicationId,
      this.comment,
      this.attachmentDetails,
      this.userId,
      this.isDraft,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.user});

  factory CommunicationLog.fromJson(Map<String, dynamic> json) =>
      _$CommunicationLogFromJson(json);

  Map<String, dynamic> toJson() => _$CommunicationLogToJson(this);

  @override
  CommunicationLogData transform() {
    // TODO: implement transform
    return CommunicationLogData(
        user: user,
        attachmentDetails: attachmentDetails,
        comment: comment,
        communicationId: communicationId,
        createdAt: createdAt,
        id: id,
        isDraft: isDraft,
        updatedAt: updatedAt,
        userId: userId,
        v: v);
  }
}

@JsonSerializable()
class CommunicationMaster extends BaseLayerDataTransformer<CommunicationMaster,
    CommunicationMasterData> {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "slug")
  String? slug;
  @JsonKey(name: "category_id")
  int? categoryId;
  @JsonKey(name: "sub_category_id")
  int? subCategoryId;
  @JsonKey(name: "response")
  String? response;
  @JsonKey(name: "priority_id")
  int? priorityId;
  @JsonKey(name: "hris")
  int? hris;
  @JsonKey(name: "group_id")
  List<dynamic>? groupId;
  @JsonKey(name: "type")
  int? type;
  @JsonKey(name: "sub_type_id")
  int? subTypeId;
  @JsonKey(name: "sub_sub_type_id")
  int? subSubTypeId;
  @JsonKey(name: "to_type")
  dynamic toType;
  @JsonKey(name: "from_type")
  String? fromType;
  @JsonKey(name: "subject")
  String? subject;
  @JsonKey(name: "workflow_id")
  int? workflowId;
  @JsonKey(name: "dynamic_form_id")
  String? dynamicFormId;
  @JsonKey(name: "reviewer_hris")
  int? reviewerHris;
  @JsonKey(name: "tat_value")
  int? tatValue;
  @JsonKey(name: "tat_type")
  int? tatType;
  @JsonKey(name: "navigation_instruction")
  String? navigationInstruction;
  @JsonKey(name: "navigation_link")
  String? navigationLink;
  @JsonKey(name: "is_draft")
  bool? isDraft;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;
  @JsonKey(name: "__v")
  int? v;
  @JsonKey(name: "id")
  String? communicationMasterId;
  @JsonKey(name: "category")
  String? category;
  @JsonKey(name: "sub_category")
  String? subCategory;

  CommunicationMaster({
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

  factory CommunicationMaster.fromJson(Map<String, dynamic> json) =>
      _$CommunicationMasterFromJson(json);

  Map<String, dynamic> toJson() => _$CommunicationMasterToJson(this);

  @override
  CommunicationMasterData transform() {
    // TODO: implement transform
    return CommunicationMasterData(
        category: category,
        subCategory: subCategory,
        categoryId: categoryId,
        communicationMasterId: communicationMasterId,
        createdAt: createdAt,
        dynamicFormId: dynamicFormId,
        fromType: fromType,
        groupId: groupId,
        hris: hris,
        id: id,
        isDraft: isDraft,
        navigationInstruction: navigationInstruction,
        navigationLink: navigationLink,
        priorityId: priorityId,
        response: response,
        reviewerHris: reviewerHris,
        slug: slug,
        subCategoryId: subCategoryId,
        subSubTypeId: subSubTypeId,
        subTypeId: subTypeId,
        subject: subject,
        tatType: tatType,
        tatValue: tatValue,
        toType: toType,
        type: type,
        updatedAt: updatedAt,
        v: v,
        workflowId: workflowId);
  }
}
