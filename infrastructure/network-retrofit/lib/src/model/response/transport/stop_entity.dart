import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stop_entity.g.dart';

@JsonSerializable()
class StopEntity implements BaseLayerDataTransformer<StopEntity, TripStop> {
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
  dynamic relatedStopId;
  @JsonKey(name: "start_date")
  String? startDate;
  @JsonKey(name: "end_date")
  String? endDate;
  @JsonKey(name: "order_by")
  int? orderBy;
  @JsonKey(name: "distance_km")
  int? distanceKm;
  @JsonKey(name: "zone_name")
  String? zoneName;
  @JsonKey(name: "school_id")
  int? schoolId;
  @JsonKey(name: "academic_yrs_id")
  dynamic academicYrsId;
  @JsonKey(name: "isDraft")
  bool? isDraft;
  @JsonKey(name: "createdAt")
  String? createdAt;
  @JsonKey(name: "updatedAt")
  String? updatedAt;

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
  StopEntity restore(TripStop data) {
    return StopEntity(
        id: data.id,
        distanceKm: data.distanceKm,
        academicYrsId: data.academicYrsId,
        isDraft: data.isDraft,
        createdAt: data.createdAt,
        endDate: data.endDate,
        lat: data.lat,
        long: data.long,
        orderBy: data.orderBy,
        relatedStopId: data.relatedStopId,
        schoolId: data.schoolId,
        startDate: data.startDate,
        stopMapName: data.stopMapName,
        stopName: data.stopName,
        updatedAt: data.updatedAt,
        zoneName: data.zoneName);
  }

  @override
  TripStop transform() {
    return TripStop(
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
