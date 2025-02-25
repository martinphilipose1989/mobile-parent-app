import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'map_student_bearer_entity_request.g.dart';

@JsonSerializable()
class MapStudenttoBearerRequestEntity
    implements
        BaseLayerDataTransformer<MapStudenttoBearerRequestEntity,
            MapStudenttoBearerRequest> {
  @JsonKey(name: "data")
  MapStudenttoBearerRequestDataEntity? data;

  MapStudenttoBearerRequestEntity({this.data});

  factory MapStudenttoBearerRequestEntity.fromJson(Map<String, dynamic> json) =>
      _$MapStudenttoBearerRequestEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MapStudenttoBearerRequestEntityToJson(this);

  @override
  MapStudenttoBearerRequestEntity restore(MapStudenttoBearerRequest data) {
    throw UnimplementedError();
  }

  @override
  MapStudenttoBearerRequest transform() {
    return MapStudenttoBearerRequest(data: data?.transform());
  }
}

@JsonSerializable()
class MapStudenttoBearerRequestDataEntity
    implements
        BaseLayerDataTransformer<MapStudenttoBearerRequestDataEntity,
            MapStudenttoBearerRequestData> {
  @JsonKey(name: "student_id")
  int? studentId;
  @JsonKey(name: "guardian_id")
  int? guardianId;
  @JsonKey(name: "guardian_relationship_id")
  int? guardianRelationshipId;

  MapStudenttoBearerRequestDataEntity(
      {this.studentId, this.guardianId, this.guardianRelationshipId});

  factory MapStudenttoBearerRequestDataEntity.fromJson(
          Map<String, dynamic> json) =>
      _$MapStudenttoBearerRequestDataEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MapStudenttoBearerRequestDataEntityToJson(this);

  @override
  MapStudenttoBearerRequestDataEntity restore(
      MapStudenttoBearerRequestData data) {
    return MapStudenttoBearerRequestDataEntity();
  }

  @override
  MapStudenttoBearerRequestData transform() {
    return MapStudenttoBearerRequestData(
        guardianId: guardianId,
        guardianRelationshipId: guardianRelationshipId,
        studentId: studentId);
  }
}
