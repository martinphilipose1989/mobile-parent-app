import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/transport/route_stop_mapping_entity.dart';
import 'package:network_retrofit/src/model/response/transport/route_working_days_entity.dart';
import 'package:network_retrofit/src/model/response/transport/stop_entity.dart';
import 'package:network_retrofit/src/model/response/transport/students_stop_mapping_response_entity.dart';

part 'trip_response_entity.g.dart';

@JsonSerializable()
class TripResponseEntity
    implements BaseLayerDataTransformer<TripResponseEntity, TripResponse> {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "data")
  TripDataEntity? data;
  @JsonKey(name: "message")
  String? message;

  TripResponseEntity({this.status, this.data, this.message});

  factory TripResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$TripResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TripResponseEntityToJson(this);

  @override
  TripResponseEntity restore(TripResponse data) {
    return TripResponseEntity(
        data: TripDataEntity(
            limit: data.data?.limit,
            page: data.data?.page,
            total: data.data?.total,
            tripResult:
                data.data?.tripResult?.map((e) => TripResultEntity()).toList()),
        message: data.message,
        status: data.status);
  }

  @override
  TripResponse transform() {
    return TripResponse(
        data: data?.transform(), message: message, status: status);
  }
}

@JsonSerializable()
class TripDataEntity
    implements BaseLayerDataTransformer<TripDataEntity, TripData> {
  @JsonKey(name: "tripData")
  List<TripResultEntity>? tripResult;
  @JsonKey(name: "total")
  int? total;
  @JsonKey(name: "page")
  String? page;
  @JsonKey(name: "limit")
  String? limit;

  TripDataEntity({this.tripResult, this.total, this.page, this.limit});

  factory TripDataEntity.fromJson(Map<String, dynamic> json) =>
      _$TripDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TripDataEntityToJson(this);

  @override
  TripDataEntity restore(TripData data) {
    return TripDataEntity(
      limit: data.limit,
      page: data.page,
      total: data.total,
      // tripResult: data.tripResult.ma
    );
  }

  @override
  TripData transform() {
    return TripData(
        limit: limit,
        page: page,
        total: total,
        tripResult: tripResult?.map((trip) => trip.transform()).toList());
  }
}

@JsonSerializable()
class TripResultEntity
    implements BaseLayerDataTransformer<TripResultEntity, TripResult> {
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
  String? startDate;
  @JsonKey(name: "end_date")
  String? endDate;
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
  @JsonKey(name: "is_completed_trip")
  bool? isCompletedTrip;
  @JsonKey(name: "createdAt")
  String? createdAt;
  @JsonKey(name: "updatedAt")
  String? updatedAt;
  @JsonKey(name: "routeWorkingDays")
  RouteWorkingDaysEntity? routeWorkingDays;
  @JsonKey(name: "shift_name")
  String? shiftName;
  @JsonKey(name: "school_name")
  String? schoolName;
  @JsonKey(name: "routeBusUserMapping")
  List<RouteBusUserMappingEntity>? routeBusUserMappingEntity;
  @JsonKey(name: "routeStopMapping")
  List<RouteStopMappingEntity>? routeStopMapping;
  @JsonKey(name: "studentStopsMappings")
  List<StudentsStopMappingResponseEntity>? studentStopsMappings;

  TripResultEntity(
      {this.id,
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
      this.routeWorkingDays,
      this.routeBusUserMappingEntity,
      this.routeStopMapping,
      this.studentStopsMappings,
      this.isCompletedTrip,
      this.schoolName,
      this.shiftName});

  factory TripResultEntity.fromJson(Map<String, dynamic> json) =>
      _$TripResultEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TripResultEntityToJson(this);

  @override
  TripResultEntity restore(TripResult data) {
    return TripResultEntity(
        academicYrsId: data.academicYrsId,
        busCapacity: data.busCapacity,
        busType: data.busType,
        createdAt: data.createdAt,
        endDate: data.endDate,
        id: data.id,
        isDraft: data.isDraft,
        isCompletedTrip: isCompletedTrip,
        isPermanentRoute: data.isPermanentRoute,
        routeCode: data.routeCode,
        routeName: data.routeName,
        routeType: data.routeType,
        schoolCode: data.schoolCode,
        schoolName: data.schoolName,
        shiftName: data.shiftName,
        studentStopsMappings: data.studentStopsMappings
            ?.map((e) => StudentsStopMappingResponseEntity(
                createdAt: e.createdAt,
                endDate: e.endDate,
                feesId: e.feesId,
                feesStatus: e.feesStatus,
                id: e.id,
                routeId: e.routeId,
                startDate: e.startDate,
                stopId: e.stopId,
                studentId: e.studentId,
                updatedAt: e.updatedAt))
            .toList(),
        routeWorkingDays: RouteWorkingDaysEntity(
            createdAt: data.routeWorkingDays?.createdAt,
            dayId: data.routeWorkingDays?.dayId,
            id: data.routeWorkingDays?.id,
            updatedAt: data.routeWorkingDays?.updatedAt),
        schoolId: data.schoolId,
        shiftId: data.shiftId,
        startDate: data.startDate,
        updatedAt: data.updatedAt,
        workingSaturdayId: data.workingSaturdayId,
        routeBusUserMappingEntity: data.routeBusUserMapping
            ?.map((e) => RouteBusUserMappingEntity(
                bus: BusEntity(
                    busMaxCapacity: e.bus?.busMaxCapacity,
                    busNumber: e.bus?.busNumber,
                    busType: e.bus?.busType,
                    createdAt: e.bus?.createdAt,
                    id: e.bus?.id,
                    manualCode: e.bus?.manualCode,
                    updatedAt: e.bus?.updatedAt,
                    wifiIdentification: e.bus?.wifiIdentification,
                    wifiName: e.bus?.wifiName),
                createdAt: e.createdAt,
                endDate: e.endDate,
                id: e.id,
                startDate: e.startDate,
                updatedAt: e.updatedAt,
                userId: e.userId,
                userType: e.userType))
            .toList(),
        routeStopMapping: data.routeStopMapping
            ?.map(
              (e) => RouteStopMappingEntity(
                approxTime: e.approxTime,
                createdAt: e.createdAt,
                id: e.id,
                orderNo: e.orderNo,
                stop: StopEntity(),
                //  updatedAt:
              ),
            )
            .toList());
  }

  @override
  TripResult transform() {
    return TripResult(
        academicYrsId: academicYrsId,
        busCapacity: busCapacity,
        busType: busType,
        createdAt: createdAt,
        endDate: endDate,
        id: id,
        isDraft: isDraft,
        isPermanentRoute: isPermanentRoute,
        routeBusUserMapping:
            routeBusUserMappingEntity?.map((e) => e.transform()).toList(),
        routeStopMapping: routeStopMapping?.map((e) => e.transform()).toList(),
        routeCode: routeCode,
        routeName: routeName,
        routeType: routeType,
        isCompletedTrip: isCompletedTrip,
        routeWorkingDays: routeWorkingDays?.transform(),
        schoolCode: schoolCode,
        schoolId: schoolId,
        schoolName: schoolName,
        shiftName: shiftName,
        shiftId: shiftId,
        startDate: startDate,
        updatedAt: updatedAt,
        studentStopsMappings:
            studentStopsMappings?.map((e) => e.transform()).toList(),
        workingSaturdayId: workingSaturdayId);
  }
}

@JsonSerializable()
class RouteBusUserMappingEntity
    implements
        BaseLayerDataTransformer<RouteBusUserMappingEntity,
            RouteBusUserMapping> {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "user_type")
  dynamic userType;
  @JsonKey(name: "start_date")
  String? startDate;
  @JsonKey(name: "end_date")
  String? endDate;
  @JsonKey(name: "user_id")
  int? userId;
  @JsonKey(name: "createdAt")
  String? createdAt;
  @JsonKey(name: "updatedAt")
  String? updatedAt;
  @JsonKey(name: "bus")
  BusEntity? bus;

  RouteBusUserMappingEntity(
      {this.id,
      this.userType,
      this.startDate,
      this.endDate,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.bus});

  factory RouteBusUserMappingEntity.fromJson(Map<String, dynamic> json) =>
      _$RouteBusUserMappingEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RouteBusUserMappingEntityToJson(this);

  @override
  RouteBusUserMappingEntity restore(RouteBusUserMapping data) {
    final bus = data.bus;
    return RouteBusUserMappingEntity(
      createdAt: data.createdAt,
      endDate: data.endDate,
      id: data.id,
      startDate: data.startDate,
      userType: data.userType,
      updatedAt: data.updatedAt,
      userId: data.userId,
      bus: BusEntity(
        id: bus?.id,
        busMaxCapacity: bus?.busMaxCapacity,
        busNumber: bus?.busNumber,
        busType: bus?.busType,
        createdAt: bus?.createdAt,
        manualCode: bus?.manualCode,
        updatedAt: bus?.updatedAt,
        wifiIdentification: bus?.wifiIdentification,
        wifiName: bus?.wifiName,
      ),
    );
  }

  @override
  RouteBusUserMapping transform() {
    return RouteBusUserMapping(
        bus: bus?.transform(),
        createdAt: createdAt,
        endDate: endDate,
        id: id,
        startDate: startDate,
        updatedAt: updatedAt,
        userId: userId,
        userType: userType);
  }
}

@JsonSerializable()
class BusEntity implements BaseLayerDataTransformer<BusEntity, Bus> {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "bus_number")
  String? busNumber;
  @JsonKey(name: "wifi_name")
  String? wifiName;
  @JsonKey(name: "wifi_identification")
  String? wifiIdentification;
  @JsonKey(name: "manual_code")
  String? manualCode;
  @JsonKey(name: "bus_type")
  int? busType;
  @JsonKey(name: "bus_max_capacity")
  int? busMaxCapacity;
  @JsonKey(name: "createdAt")
  String? createdAt;
  @JsonKey(name: "updatedAt")
  String? updatedAt;

  BusEntity(
      {this.id,
      this.busNumber,
      this.wifiName,
      this.wifiIdentification,
      this.manualCode,
      this.busType,
      this.busMaxCapacity,
      this.createdAt,
      this.updatedAt});

  factory BusEntity.fromJson(Map<String, dynamic> json) =>
      _$BusEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BusEntityToJson(this);

  @override
  BusEntity restore(Bus data) {
    return BusEntity(
        id: data.id,
        busMaxCapacity: data.busMaxCapacity,
        busNumber: data.busNumber,
        busType: data.busType,
        createdAt: data.createdAt,
        manualCode: data.manualCode,
        updatedAt: data.updatedAt,
        wifiIdentification: data.wifiIdentification,
        wifiName: data.wifiName);
  }

  @override
  Bus transform() {
    return Bus(
        busMaxCapacity: busMaxCapacity,
        busNumber: busNumber,
        busType: busType,
        createdAt: createdAt,
        id: id,
        manualCode: manualCode,
        updatedAt: updatedAt,
        wifiIdentification: wifiIdentification,
        wifiName: wifiName);
  }
}
