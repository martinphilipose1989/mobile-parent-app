import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'students_stop_mapping_response_entity.g.dart';

@JsonSerializable()
class StudentsStopMappingResponseEntity extends BaseLayerDataTransformer<
    StudentsStopMappingResponseEntity, StudentStopsMapping> {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "student_id")
  int? studentId;
  @JsonKey(name: "stop_id")
  int? stopId;
  @JsonKey(name: "route_id")
  int? routeId;
  @JsonKey(name: "start_date")
  DateTime? startDate;
  @JsonKey(name: "end_date")
  DateTime? endDate;
  @JsonKey(name: "fees_id")
  dynamic feesId;
  @JsonKey(name: "fees_status")
  dynamic feesStatus;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;

  StudentsStopMappingResponseEntity({
    this.id,
    this.studentId,
    this.stopId,
    this.routeId,
    this.startDate,
    this.endDate,
    this.feesId,
    this.feesStatus,
    this.createdAt,
    this.updatedAt,
  });

  factory StudentsStopMappingResponseEntity.fromJson(
          Map<String, dynamic> json) =>
      _$StudentsStopMappingResponseEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$StudentsStopMappingResponseEntityToJson(this);

  @override
  StudentsStopMappingResponseEntity restore(StudentStopsMapping data) {
    // TODO: implement restore
    return StudentsStopMappingResponseEntity(
        createdAt: data.createdAt,
        endDate: data.endDate,
        feesId: data.feesId,
        feesStatus: data.feesStatus,
        id: data.id,
        routeId: data.routeId,
        startDate: data.startDate,
        stopId: data.stopId,
        studentId: data.studentId,
        updatedAt: data.updatedAt);
  }

  @override
  StudentStopsMapping transform() {
    // TODO: implement transform
    return StudentStopsMapping(
        createdAt: createdAt,
        endDate: endDate,
        feesId: feesId,
        feesStatus: feesStatus,
        id: id,
        routeId: routeId,
        startDate: startDate,
        stopId: stopId,
        studentId: studentId,
        updatedAt: updatedAt);
  }
}
