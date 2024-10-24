class FindByCategorySubCategoryModel {
  int? status;
  List<FindByCategorySubCategoryDatumModel>? data;
  String? message;

  FindByCategorySubCategoryModel({
    this.status,
    this.data,
    this.message,
  });
}

class FindByCategorySubCategoryDatumModel {
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
  String? datumId;

  FindByCategorySubCategoryDatumModel({
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
    this.datumId,
  });
}
