class StopDetail {
  int? id;
  String? stopName;
  String? zoneName;
  int? schoolId;

  dynamic routeId;
  int? shiftId;

  StopDetail(
      {this.id,
      this.stopName,
      this.zoneName,
      this.schoolId,
      this.routeId,
      this.shiftId});
}
