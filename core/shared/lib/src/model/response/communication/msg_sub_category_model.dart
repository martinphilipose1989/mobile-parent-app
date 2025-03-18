class MsgSubCategoryModel {
  List<MsgSubCategoryDatumModel> data;
  MsgSubCategoryMetaModel meta;

  MsgSubCategoryModel({
    required this.data,
    required this.meta,
  });
}

class MsgSubCategoryDatumModel {
  int id;
  MsgSubModelAttributesModel attributes;

  MsgSubCategoryDatumModel({
    required this.id,
    required this.attributes,
  });
}

class MsgSubModelAttributesModel {
  int? categoryId;
  String? name;
  String? notice;
  String? noticeDetails;
  dynamic workFlowId;
  DateTime? createdAt;
  DateTime? updatedAt;

  MsgSubModelAttributesModel({
    required this.categoryId,
    required this.name,
    required this.notice,
    required this.noticeDetails,
    required this.workFlowId,
    required this.createdAt,
    required this.updatedAt,
  });
}

class MsgSubCategoryMetaModel {
  MsgSubCategoryModelPaginationModel pagination;

  MsgSubCategoryMetaModel({
    required this.pagination,
  });
}

class MsgSubCategoryModelPaginationModel {
  int page;
  int pageSize;
  int pageCount;
  int total;

  MsgSubCategoryModelPaginationModel({
    required this.page,
    required this.pageSize,
    required this.pageCount,
    required this.total,
  });
}
