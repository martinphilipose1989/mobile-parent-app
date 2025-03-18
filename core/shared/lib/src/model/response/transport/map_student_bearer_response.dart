class MapStudenttoBearerResponse {
  MapStudenttoBearerResponseData? data;

  MapStudenttoBearerResponse({this.data});
}

class MapStudenttoBearerResponseData {
  int? id;

  MapStudenttoBearerResponseAttributes? attributes;

  MapStudenttoBearerResponseData({this.id, this.attributes});
}

class MapStudenttoBearerResponseAttributes {
  int? studentId;

  int? guardianId;

  int? guardianRelationshipId;

  String? createdAt;

  String? updatedAt;

  dynamic preferredMobileNo;

  dynamic preferredEmailNo;

  MapStudenttoBearerResponseAttributes({
    this.studentId,
    this.guardianId,
    this.guardianRelationshipId,
    this.createdAt,
    this.updatedAt,
    this.preferredMobileNo,
    this.preferredEmailNo,
  });
}
