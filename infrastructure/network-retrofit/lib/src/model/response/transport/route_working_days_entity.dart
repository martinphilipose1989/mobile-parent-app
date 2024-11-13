import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'route_working_days_entity.g.dart';

@JsonSerializable()
class RouteWorkingDaysEntity
    extends BaseLayerDataTransformer<RouteWorkingDaysEntity, RouteWorkingDays> {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "day_id")
  int? dayId;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;

  RouteWorkingDaysEntity({
    this.id,
    this.dayId,
    this.createdAt,
    this.updatedAt,
  });

  factory RouteWorkingDaysEntity.fromJson(Map<String, dynamic> json) =>
      _$RouteWorkingDaysEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RouteWorkingDaysEntityToJson(this);

  @override
  RouteWorkingDays transform() {
    // TODO: implement transform
    return RouteWorkingDays(
        createdAt: createdAt, dayId: dayId, id: id, updatedAt: updatedAt);
  }

  @override
  RouteWorkingDaysEntity restore(RouteWorkingDays data) {
    // TODO: implement restore
    return RouteWorkingDaysEntity(
        createdAt: data.createdAt,
        dayId: data.dayId,
        id: data.id,
        updatedAt: data.updatedAt);
  }
}
