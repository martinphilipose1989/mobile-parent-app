import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/transport/stop_entity.dart';

part 'route_stop_mapping_entity.g.dart';

@JsonSerializable()
class RouteStopMappingEntity
    implements
        BaseLayerDataTransformer<RouteStopMappingEntity, TripRouteStopMapping> {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "order_no")
  int? orderNo;
  @JsonKey(name: "approx_time")
  String? approxTime;
  @JsonKey(name: "createdAt")
  String? createdAt;
  @JsonKey(name: "updatedAt")
  String? updatedAt;
  @JsonKey(name: "stop")
  StopEntity? stop;

  RouteStopMappingEntity(
      {this.id,
      this.orderNo,
      this.approxTime,
      this.createdAt,
      this.updatedAt,
      this.stop});

  factory RouteStopMappingEntity.fromJson(Map<String, dynamic> json) =>
      _$RouteStopMappingEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RouteStopMappingEntityToJson(this);

  @override
  RouteStopMappingEntity restore(TripRouteStopMapping data) {
    final stop = data.stop;
    return RouteStopMappingEntity(
      approxTime: data.approxTime,
      createdAt: data.createdAt,
      id: data.id,
      orderNo: data.orderNo,
      stop: StopEntity(
        academicYrsId: stop?.academicYrsId,
        createdAt: stop?.createdAt,
        distanceKm: stop?.distanceKm,
        endDate: stop?.endDate,
        id: stop?.id,
        isDraft: stop?.isDraft,
        lat: stop?.lat,
        long: stop?.long,
        orderBy: stop?.orderBy,
        relatedStopId: stop?.relatedStopId,
        schoolId: stop?.schoolId,
        startDate: stop?.startDate,
        stopMapName: stop?.stopMapName,
        stopName: stop?.stopName,
        updatedAt: stop?.updatedAt,
        zoneName: stop?.zoneName,
      ),
      updatedAt: data.updatedAt,
    );
  }

  @override
  TripRouteStopMapping transform() {
    return TripRouteStopMapping(
        id: id,
        approxTime: approxTime,
        createdAt: createdAt,
        orderNo: orderNo,
        stop: stop?.transform(),
        updatedAt: updatedAt);
  }
}
