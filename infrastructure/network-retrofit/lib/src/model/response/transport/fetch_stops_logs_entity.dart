import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fetch_stops_logs_entity.g.dart';

@JsonSerializable()
class FetchStopLogsEntity
    extends BaseLayerDataTransformer<FetchStopLogsEntity, FetchStopLogsModel> {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "data")
  List<FetchStopLogsDataEntity>? data;
  @JsonKey(name: "message")
  String? message;

  FetchStopLogsEntity({
    this.status,
    this.data,
    this.message,
  });

  factory FetchStopLogsEntity.fromJson(Map<String, dynamic> json) =>
      _$FetchStopLogsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$FetchStopLogsEntityToJson(this);

  @override
  FetchStopLogsModel transform() {
    // TODO: implement transform
    return FetchStopLogsModel(
        data: data
            ?.map(
              (e) => e.transform(),
            )
            .toList(),
        message: message,
        status: status);
  }
}

@JsonSerializable()
class FetchStopLogsDataEntity extends BaseLayerDataTransformer<
    FetchStopLogsDataEntity, FetchStopLogsData> {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "route_id")
  int? routeId;
  @JsonKey(name: "stop_id")
  int? stopId;
  @JsonKey(name: "stop_status")
  String? stopStatus;
  @JsonKey(name: "time")
  String? time;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;

  FetchStopLogsDataEntity({
    this.id,
    this.routeId,
    this.stopId,
    this.stopStatus,
    this.time,
    this.createdAt,
    this.updatedAt,
  });

  factory FetchStopLogsDataEntity.fromJson(Map<String, dynamic> json) =>
      _$FetchStopLogsDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$FetchStopLogsDataEntityToJson(this);

  @override
  FetchStopLogsData transform() {
    // TODO: implement transform
    return FetchStopLogsData(
        createdAt: createdAt,
        id: id,
        routeId: routeId,
        stopId: stopId,
        stopStatus: stopStatus,
        time: time,
        updatedAt: updatedAt);
  }
}
