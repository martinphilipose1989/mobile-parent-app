class SchoolNamesModel {
  final int? status;
  final SchoolNamesDataModel? data;
  final String? message;

  SchoolNamesModel({
    this.status,
    this.data,
    this.message,
  });
}

class SchoolNamesDataModel {
  final List<BrandCode>? brandCodes;
  final int? totalCount;

  SchoolNamesDataModel({
    this.brandCodes,
    this.totalCount,
  });
}

class BrandCode {
  final String? legalIdentity;
  final int? brandCode;
  final String? displayName;

  BrandCode({
    this.legalIdentity,
    this.brandCode,
    this.displayName,
  });
}
