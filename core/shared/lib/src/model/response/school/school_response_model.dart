class SchoolListResponse {
  List<SchoolResponseData>? data;

  SchoolMeta? meta;

  SchoolListResponse({this.data, this.meta});
}

class SchoolResponseData {
  int? id;

  SchoolAttributes? attributes;

  SchoolResponseData({this.id, this.attributes});
}

class SchoolAttributes {
  String? name;

  String? shortName;

  String? createdAt;

  String? updatedAt;

  String? code;

  int? clusterId;

  int? cityId;

  int? organizationId;

  int? academicYearId;

  dynamic addressForReceipt;

  dynamic website;

  dynamic helpline;

  int? stateId;

  dynamic latitude;

  dynamic longitude;

  SchoolAttributes({
    this.name,
    this.shortName,
    this.createdAt,
    this.updatedAt,
    this.code,
    this.clusterId,
    this.cityId,
    this.organizationId,
    this.academicYearId,
    this.addressForReceipt,
    this.website,
    this.helpline,
    this.stateId,
    this.latitude,
    this.longitude,
  });
}

class SchoolMeta {
  SchoolPagination? pagination;

  SchoolMeta({this.pagination});
}

class SchoolPagination {
  int? page;

  int? pageSize;

  int? pageCount;

  int? total;

  SchoolPagination({this.page, this.pageSize, this.pageCount, this.total});
}
