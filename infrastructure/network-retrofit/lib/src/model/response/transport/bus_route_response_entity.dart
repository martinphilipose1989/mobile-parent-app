import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bus_route_response_entity.g.dart';

@JsonSerializable()
class BusStopResponseEntity extends BaseLayerDataTransformer<
    BusStopResponseEntity, BusStopResponseModel> {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "data")
  BusStopResultEntity? data;
  @JsonKey(name: "message")
  String? message;

  BusStopResponseEntity({this.status, this.data, this.message});

  factory BusStopResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$BusStopResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BusStopResponseEntityToJson(this);
  @override
  BusStopResponseModel transform() {
    // TODO: implement transform
    return BusStopResponseModel(
        data: data?.transform(), message: message, status: status);
  }
}

@JsonSerializable()
class BusStopDataEntity
    extends BaseLayerDataTransformer<BusStopResponseEntity, BusStopDataModel> {
  @JsonKey(name: "results")
  BusStopResultEntity? results;
  @JsonKey(name: "total")
  int? total;
  @JsonKey(name: "page")
  String? page;
  @JsonKey(name: "limit")
  String? limit;

  BusStopDataEntity({
    this.results,
    this.total,
    this.page,
    this.limit,
  });

  factory BusStopDataEntity.fromJson(Map<String, dynamic> json) =>
      _$BusStopDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BusStopDataEntityToJson(this);

  @override
  BusStopDataModel transform() {
    // TODO: implement transform
    return BusStopDataModel(
        limit: limit, page: page, results: results?.transform(), total: total);
  }
}

@JsonSerializable()
class BusStopResultEntity
    extends BaseLayerDataTransformer<BusStopResultEntity, BusStopResultModel> {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "shift_id")
  int? shiftId;
  @JsonKey(name: "working_saturday_id")
  int? workingSaturdayId;
  @JsonKey(name: "route_name")
  String? routeName;
  @JsonKey(name: "bus_type")
  String? busType;
  @JsonKey(name: "bus_capacity")
  int? busCapacity;
  @JsonKey(name: "route_type")
  String? routeType;
  @JsonKey(name: "is_permanent_route")
  bool? isPermanentRoute;
  @JsonKey(name: "start_date")
  DateTime? startDate;
  @JsonKey(name: "end_date")
  DateTime? endDate;
  @JsonKey(name: "school_code")
  String? schoolCode;
  @JsonKey(name: "school_id")
  int? schoolId;
  @JsonKey(name: "route_code")
  String? routeCode;
  @JsonKey(name: "academic_yrs_id")
  int? academicYrsId;
  @JsonKey(name: "isDraft")
  bool? isDraft;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "routeStopMapping")
  List<RouteStopMappingEntity>? routeStopMapping;

  BusStopResultEntity({
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

  factory BusStopResultEntity.fromJson(Map<String, dynamic> json) =>
      _$BusStopResultEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BusStopResultEntityToJson(this);

  @override
  BusStopResultModel transform() {
    // TODO: implement transform
    return BusStopResultModel(
        academicYrsId: academicYrsId,
        busCapacity: busCapacity,
        busType: busType,
        createdAt: createdAt,
        endDate: endDate,
        id: id,
        isDraft: isDraft,
        isPermanentRoute: isPermanentRoute,
        routeCode: routeCode,
        routeName: routeName,
        routeStopMapping: routeStopMapping
            ?.map(
              (e) => e.transform(),
            )
            .toList(),
        routeType: routeType,
        schoolCode: schoolCode,
        schoolId: schoolId,
        shiftId: shiftId,
        startDate: startDate,
        updatedAt: updatedAt,
        workingSaturdayId: workingSaturdayId);
  }
}

@JsonSerializable()
class RouteStopMappingEntity extends BaseLayerDataTransformer<
    RouteStopMappingEntity, RouteStopMappingModel> {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "order_no")
  int? orderNo;
  @JsonKey(name: "approx_time")
  String? approxTime;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "stop")
  StopEntity? stop;
  @JsonKey(name: "totalStudents")
  int? totalStudents;

  RouteStopMappingEntity(
      {this.id,
      this.orderNo,
      this.approxTime,
      this.createdAt,
      this.updatedAt,
      this.stop,
      this.totalStudents});

  factory RouteStopMappingEntity.fromJson(Map<String, dynamic> json) =>
      _$RouteStopMappingEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RouteStopMappingEntityToJson(this);

  @override
  RouteStopMappingModel transform() {
    // TODO: implement transform
    return RouteStopMappingModel(
        approxTime: approxTime,
        createdAt: createdAt,
        id: id,
        orderNo: orderNo,
        totalStudents: totalStudents,
        stop: stop?.transform(),
        updatedAt: updatedAt);
  }
}

@JsonSerializable()
class StopEntity extends BaseLayerDataTransformer<StopEntity, StopModel> {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "stop_name")
  String? stopName;
  @JsonKey(name: "stop_map_name")
  String? stopMapName;
  @JsonKey(name: "lat")
  String? lat;
  @JsonKey(name: "long")
  String? long;
  @JsonKey(name: "related_stop_id")
  int? relatedStopId;
  @JsonKey(name: "start_date")
  DateTime? startDate;
  @JsonKey(name: "end_date")
  DateTime? endDate;
  @JsonKey(name: "order_by")
  int? orderBy;
  @JsonKey(name: "distance_km")
  int? distanceKm;
  @JsonKey(name: "zone_name")
  dynamic zoneName;
  @JsonKey(name: "school_id")
  int? schoolId;
  @JsonKey(name: "academic_yrs_id")
  int? academicYrsId;
  @JsonKey(name: "isDraft")
  bool? isDraft;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;

  StopEntity({
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

  factory StopEntity.fromJson(Map<String, dynamic> json) =>
      _$StopEntityFromJson(json);

  Map<String, dynamic> toJson() => _$StopEntityToJson(this);

  @override
  StopModel transform() {
    // TODO: implement transform
    return StopModel(
        academicYrsId: academicYrsId,
        createdAt: createdAt,
        distanceKm: distanceKm,
        endDate: endDate,
        id: id,
        isDraft: isDraft,
        lat: lat,
        long: long,
        orderBy: orderBy,
        relatedStopId: relatedStopId,
        schoolId: schoolId,
        startDate: startDate,
        stopMapName: stopMapName,
        stopName: stopName,
        updatedAt: updatedAt,
        zoneName: zoneName);
  }
}
