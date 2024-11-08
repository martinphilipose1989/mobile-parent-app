class BrandResponse {
  List<BrandData> data;

  BrandMeta meta;

  BrandResponse({required this.data, required this.meta});
}

class BrandData {
  int id;

  BrandAttributes attributes;

  BrandData({required this.id, required this.attributes});
}

class BrandAttributes {
  String name;

  String brandCode;

  String? createdAt;

  String? updatedAt;

  BrandAttributes(
      {required this.name,
      required this.brandCode,
      required this.createdAt,
      required this.updatedAt});
}

class BrandMeta {
  BrandPagination pagination;

  BrandMeta({required this.pagination});
}

class BrandPagination {
  int page;

  int pageSize;

  int pageCount;

  int total;

  BrandPagination(
      {required this.page,
      required this.pageSize,
      required this.pageCount,
      required this.total});
}
