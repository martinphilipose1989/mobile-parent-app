class MsgSubCategoryModel {
  List<MsgSubCategoryDatum> data;
  MsgSubCategoryMeta meta;

  MsgSubCategoryModel({
    required this.data,
    required this.meta,
  });

}

class MsgSubCategoryDatum {
  int id;
  MsgSubModelAttributes attributes;

  MsgSubCategoryDatum({
    required this.id,
    required this.attributes,
  });

}

class MsgSubModelAttributes {
  int categoryId;
  String name;
  String notice;
  String? noticeDetails;
  dynamic workFlowId;
  DateTime createdAt;
  DateTime updatedAt;

  MsgSubModelAttributes({
    required this.categoryId,
    required this.name,
    required this.notice,
    required this.noticeDetails,
    required this.workFlowId,
    required this.createdAt,
    required this.updatedAt,
  });

}

class MsgSubCategoryMeta {
  MsgSubCategoryModelPagination pagination;

  MsgSubCategoryMeta({
    required this.pagination,
  });

}

class MsgSubCategoryModelPagination {
  int page;
  int pageSize;
  int pageCount;
  int total;

  MsgSubCategoryModelPagination({
    required this.page,
    required this.pageSize,
    required this.pageCount,
    required this.total,
  });

}
