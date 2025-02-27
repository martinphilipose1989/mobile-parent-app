import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'map_student_bearer_response_entity.g.dart';

@JsonSerializable()
class MapStudenttoBearerResponseEntity
    implements
        BaseLayerDataTransformer<MapStudenttoBearerResponseEntity,
            MapStudenttoBearerResponse> {
  @JsonKey(name: "data")
  MapStudenttoBearerResponseDataEntity? data;

  MapStudenttoBearerResponseEntity({this.data});

  factory MapStudenttoBearerResponseEntity.fromJson(
          Map<String, dynamic> json) =>
      _$MapStudenttoBearerResponseEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MapStudenttoBearerResponseEntityToJson(this);

  @override
  MapStudenttoBearerResponseEntity restore(MapStudenttoBearerResponse data) {
    return MapStudenttoBearerResponseEntity();
  }

  @override
  MapStudenttoBearerResponse transform() {
    return MapStudenttoBearerResponse(data: data?.transform());
  }
}

@JsonSerializable()
class MapStudenttoBearerResponseDataEntity
    implements
        BaseLayerDataTransformer<MapStudenttoBearerResponseDataEntity,
            MapStudenttoBearerResponseData> {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "attributes")
  MapStudenttoBearerResponseAttributesEntity? attributes;

  MapStudenttoBearerResponseDataEntity({this.id, this.attributes});

  factory MapStudenttoBearerResponseDataEntity.fromJson(
          Map<String, dynamic> json) =>
      _$MapStudenttoBearerResponseDataEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MapStudenttoBearerResponseDataEntityToJson(this);

  @override
  MapStudenttoBearerResponseDataEntity restore(
      MapStudenttoBearerResponseData data) {
    return MapStudenttoBearerResponseDataEntity();
  }

  @override
  MapStudenttoBearerResponseData transform() {
    return MapStudenttoBearerResponseData(
        attributes: attributes?.transform(), id: id);
  }
}

@JsonSerializable()
class MapStudenttoBearerResponseAttributesEntity
    implements
        BaseLayerDataTransformer<MapStudenttoBearerResponseAttributesEntity,
            MapStudenttoBearerResponseAttributes> {
  @JsonKey(name: "student_id")
  int? studentId;
  @JsonKey(name: "guardian_id")
  int? guardianId;
  @JsonKey(name: "guardian_relationship_id")
  int? guardianRelationshipId;
  @JsonKey(name: "createdAt")
  String? createdAt;
  @JsonKey(name: "updatedAt")
  String? updatedAt;
  @JsonKey(name: "preferred_mobile_no")
  dynamic preferredMobileNo;
  @JsonKey(name: "preferred_email_no")
  dynamic preferredEmailNo;

  MapStudenttoBearerResponseAttributesEntity({
    this.studentId,
    this.guardianId,
    this.guardianRelationshipId,
    this.createdAt,
    this.updatedAt,
    this.preferredMobileNo,
    this.preferredEmailNo,
  });

  factory MapStudenttoBearerResponseAttributesEntity.fromJson(
          Map<String, dynamic> json) =>
      _$MapStudenttoBearerResponseAttributesEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MapStudenttoBearerResponseAttributesEntityToJson(this);

  @override
  MapStudenttoBearerResponseAttributesEntity restore(
      MapStudenttoBearerResponseAttributes data) {
    return MapStudenttoBearerResponseAttributesEntity();
  }

  @override
  MapStudenttoBearerResponseAttributes transform() {
    return MapStudenttoBearerResponseAttributes(
        createdAt: createdAt,
        guardianId: guardianId,
        guardianRelationshipId: guardianRelationshipId,
        preferredEmailNo: preferredEmailNo,
        preferredMobileNo: preferredMobileNo,
        studentId: studentId,
        updatedAt: updatedAt);
  }
}
