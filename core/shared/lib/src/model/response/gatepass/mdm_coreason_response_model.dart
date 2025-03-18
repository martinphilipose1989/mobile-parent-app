class MdmCoReasonResponseModel {
  List<MdmCoReasonDataModel>? data;
  MetaModel? meta;

  MdmCoReasonResponseModel({
    this.data,
    this.meta,
  });
}

class MdmCoReasonDataModel {
  int? id;
  MdmAttributesModel? attributes;

  MdmCoReasonDataModel({
    this.id,
    this.attributes,
  });
}

class MdmAttributesModel {
  String? name;

  MdmAttributesModel({this.name});
}

class MetaModel {
  PaginationModel? pagination;

  MetaModel({this.pagination});
}

class PaginationModel {
  int? page;
  int? pageSize;
  int? pageCount;
  int? total;

  PaginationModel({this.page, this.pageSize, this.pageCount, this.total});
}
