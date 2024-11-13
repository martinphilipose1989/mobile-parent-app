class Stop {
  int? id;

  String? stopName;

  String? stopMapName;

  String? lat;

  String? long;

  dynamic relatedStopId;

  String? startDate;

  String? endDate;

  int? orderBy;

  int? distanceKm;

  String? zoneName;

  int? schoolId;

  int? academicYrsId;

  bool? isDraft;

  String? createdAt;

  String? updatedAt;

  Stop({
    this.id,
    this.stopName,
    this.stopMapName,
    this.lat,
    this.long,
    this.relatedStopId,
    this.startDate,
    this.endDate,
    this.orderBy,
    this.distanceKm,
    this.zoneName,
    this.schoolId,
    this.academicYrsId,
    this.isDraft,
    this.createdAt,
    this.updatedAt,
  });
}
