class MapStudenttoBearerRequest {
  MapStudenttoBearerRequestData? data;

  MapStudenttoBearerRequest({this.data});
}

class MapStudenttoBearerRequestData {
  int? studentId;

  int? guardianId;

  int? guardianRelationshipId;

  MapStudenttoBearerRequestData(
      {this.studentId, this.guardianId, this.guardianRelationshipId});
}
