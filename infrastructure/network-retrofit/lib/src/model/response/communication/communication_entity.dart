import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'communication_entity.g.dart';

@JsonSerializable()
class CommunicationEntity extends BaseLayerDataTransformer<CommunicationEntity,
    CommunicationListModel> {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "data")
  CommunicationEntityData? data;
  @JsonKey(name: "message")
  String? message;

  CommunicationEntity({
    this.status,
    this.data,
    this.message,
  });

  factory CommunicationEntity.fromJson(Map<String, dynamic> json) =>
      _$CommunicationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CommunicationEntityToJson(this);

  @override
  CommunicationListModel transform() {
    // TODO: implement transform
    return CommunicationListModel(
        message: message, status: status, data: data?.transform());
  }
}

@JsonSerializable()
class CommunicationEntityData extends BaseLayerDataTransformer<
    CommunicationEntityData, CommunicationListData> {
  @JsonKey(name: "data")
  List<CommunicationEntityDatum>? data;
  @JsonKey(name: "meta")
  CommunicationEntityMeta? meta;

  CommunicationEntityData({
    this.data,
    this.meta,
  });

  factory CommunicationEntityData.fromJson(Map<String, dynamic> json) =>
      _$CommunicationEntityDataFromJson(json);

  Map<String, dynamic> toJson() => _$CommunicationEntityDataToJson(this);

  @override
  CommunicationListData transform() {
    // TODO: implement transform
    return CommunicationListData(
        meta: meta?.transform(),
        data: data
            ?.map(
              (e) => e.transform(),
            )
            .toList());
  }
}

@JsonSerializable()
class CommunicationEntityDatum
    extends BaseLayerDataTransformer<CommunicationEntityDatum, DataValue> {
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
  DateTime? datumCreatedAt;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "__v")
  int? v;
  @JsonKey(name: "communication_master")
  List<CommunicationMaster>? communicationMaster;
  @JsonKey(name: "id")
  String? datumId;

  CommunicationEntityDatum({
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
    this.datumCreatedAt,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.communicationMaster,
    this.datumId,
  });

  factory CommunicationEntityDatum.fromJson(Map<String, dynamic> json) =>
      _$CommunicationEntityDatumFromJson(json);

  Map<String, dynamic> toJson() => _$CommunicationEntityDatumToJson(this);

  @override
  DataValue transform() {
    // TODO: implement transform
    return DataValue(
        assignTo: assignTo,
        attachment: attachment,
        communication: communication,
        communicationMaster: communicationMaster
            ?.map(
              (e) => e.transform(),
            )
            .toList(),
        communicationMasterId: communicationMasterId,
        createdAt: createdAt,
        createdBy: createdBy,
        dataValueCreatedAt: datumCreatedAt,
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
        v: v);
  }
}

@JsonSerializable()
class CommunicationMaster extends BaseLayerDataTransformer<CommunicationMaster,
    CommunicationMasterModel> {
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
  });

  factory CommunicationMaster.fromJson(Map<String, dynamic> json) =>
      _$CommunicationMasterFromJson(json);

  Map<String, dynamic> toJson() => _$CommunicationMasterToJson(this);
  @override
  CommunicationMasterModel transform() {
    // TODO: implement transform
    return CommunicationMasterModel(
        categoryId: categoryId,
        communicationMasterId: communicationMasterId,
        createdAt: createdAt,
        dynamicFormId: dynamicFormId,
        fromType: fromType,
        groupId: groupId,
        hris: hris,
        isDraft: isDraft,
        navigationInstruction: navigationInstruction,
        priorityId: priorityId,
        navigationLink: navigationLink,
        response: response,
        reviewerHris: reviewerHris,
        slug: slug,
        subCategoryId: subCategoryId,
        subSubTypeId: subSubTypeId,
        subTypeId: subTypeId,
        id: id,
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

@JsonSerializable()
class CommunicationEntityMeta
    extends BaseLayerDataTransformer<CommunicationEntityMeta, Extra> {
  @JsonKey(name: "pagination")
  PaginationEntity? pagination;

  CommunicationEntityMeta({
    this.pagination,
  });

  factory CommunicationEntityMeta.fromJson(Map<String, dynamic> json) =>
      _$CommunicationEntityMetaFromJson(json);

  Map<String, dynamic> toJson() => _$CommunicationEntityMetaToJson(this);

  @override
  Extra transform() {
    // TODO: implement transform
    return Extra(pagination: pagination?.transform());
  }
}

@JsonSerializable()
class PaginationEntity
    extends BaseLayerDataTransformer<PaginationEntity, Pagination> {
  @JsonKey(name: "page")
  int? page;
  @JsonKey(name: "pageSize")
  int? pageSize;
  @JsonKey(name: "pageCount")
  int? pageCount;
  @JsonKey(name: "total")
  int? total;

  PaginationEntity({
    this.page,
    this.pageSize,
    this.pageCount,
    this.total,
  });

  factory PaginationEntity.fromJson(Map<String, dynamic> json) =>
      _$PaginationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationEntityToJson(this);

  @override
  Pagination transform() {
    // TODO: implement transform
    return Pagination(
        page: page, pageCount: pageCount, pageSize: pageSize, total: total);
  }
}
