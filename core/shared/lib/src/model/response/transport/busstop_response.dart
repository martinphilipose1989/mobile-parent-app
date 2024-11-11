class BusStopResponseModel {
  int? status;

  BusStopResultModel? data;

  String? message;

  BusStopResponseModel({this.status, this.data, this.message});
}

class BusStopDataModel {
  BusStopResultModel? results;

  int? total;

  String? page;

  String? limit;

  BusStopDataModel({
    this.results,
    this.total,
    this.page,
    this.limit,
  });
}

class BusStopResultModel {
  String? id;
  int? shiftId;
  int? workingSaturdayId;
  String? routeName;
  String? busType;
  int? busCapacity;
  String? routeType;
  bool? isPermanentRoute;
  DateTime? startDate;
  DateTime? endDate;
  String? schoolCode;
  int? schoolId;
  String? routeCode;
  int? academicYrsId;
  bool? isDraft;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<RouteStopMappingModel>? routeStopMapping;

  BusStopResultModel({
    this.id,
    this.shiftId,
    this.workingSaturdayId,
    this.routeName,
    this.busType,
    this.busCapacity,
    this.routeType,
    this.isPermanentRoute,
    this.startDate,
    this.endDate,
    this.schoolCode,
    this.schoolId,
    this.routeCode,
    this.academicYrsId,
    this.isDraft,
    this.createdAt,
    this.updatedAt,
    this.routeStopMapping,
  });
}

class RouteStopMappingModel {
  String? id;
  int? orderNo;
  String? approxTime;
  DateTime? createdAt;
  DateTime? updatedAt;
  StopModel? stop;
  int? totalStudents;
  bool stopComplete;

  RouteStopMappingModel(
      {this.id,
      this.orderNo,
      this.approxTime,
      this.createdAt,
      this.updatedAt,
      this.stop,
      this.stopComplete = false,
      this.totalStudents});
}

class StopModel {
  int? id;
  String? stopName;
  String? stopMapName;
  String? lat;
  String? long;
  int? relatedStopId;
  DateTime? startDate;
  DateTime? endDate;
  int? orderBy;
  int? distanceKm;
  dynamic zoneName;
  int? schoolId;
  int? academicYrsId;
  bool? isDraft;
  DateTime? createdAt;
  DateTime? updatedAt;

  StopModel({
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
