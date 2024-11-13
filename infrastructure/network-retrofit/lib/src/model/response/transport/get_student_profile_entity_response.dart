import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

import 'bearer_list_response_entity.dart';
import 'guardians_detail_response_entity.dart';
import 'route_stop_mapping_entity.dart';

part 'get_student_profile_entity_response.g.dart';

@JsonSerializable()
class GetStudentProfileResponseEntity
    implements
        BaseLayerDataTransformer<GetStudentProfileResponseEntity,
            GetStudentProfileResponse> {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "data")
  GetStudentProfileDataEntity? data;
  @JsonKey(name: "message")
  String? message;

  GetStudentProfileResponseEntity({this.status, this.data, this.message});

  factory GetStudentProfileResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$GetStudentProfileResponseEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetStudentProfileResponseEntityToJson(this);

  @override
  GetStudentProfileResponseEntity restore(GetStudentProfileResponse data) {
    return GetStudentProfileResponseEntity();
  }

  @override
  GetStudentProfileResponse transform() {
    return GetStudentProfileResponse(
      data: data?.transform(),
      message: message,
      status: status,
    );
  }
}

@JsonSerializable()
class GetStudentProfileDataEntity
    implements
        BaseLayerDataTransformer<GetStudentProfileDataEntity,
            GetStudentProfileData> {
  @JsonKey(name: "student_id")
  int? studentId;
  @JsonKey(name: "first_name")
  String? firstName;
  @JsonKey(name: "middle_name")
  String? middleName;
  @JsonKey(name: "last_name")
  String? lastName;
  @JsonKey(name: "profile_image")
  String? profileImage;
  @JsonKey(name: "crt_enr_on")
  String? crtEnrOn;
  @JsonKey(name: "school_name")
  String? schoolName;
  @JsonKey(name: "grade_name")
  String? gradeName;
  @JsonKey(name: "guardians_details")
  List<GuardiansDetailEntity>? guardiansDetails;
  @JsonKey(name: "transport_details")
  TransportDetailsEntity? transportDetails;
  @JsonKey(name: "bearers_details")
  List<BearerResponseEntity>? bearersDetails;

  GetStudentProfileDataEntity({
    this.studentId,
    this.firstName,
    this.middleName,
    this.lastName,
    this.profileImage,
    this.crtEnrOn,
    this.schoolName,
    this.gradeName,
    this.guardiansDetails,
    this.transportDetails,
    this.bearersDetails,
  });

  factory GetStudentProfileDataEntity.fromJson(Map<String, dynamic> json) =>
      _$GetStudentProfileDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetStudentProfileDataEntityToJson(this);

  @override
  GetStudentProfileDataEntity restore(GetStudentProfileData data) {
    return GetStudentProfileDataEntity();
  }

  @override
  GetStudentProfileData transform() {
    return GetStudentProfileData(
        bearersDetails: bearersDetails?.map((e) => e.transform()).toList(),
        crtEnrOn: crtEnrOn,
        firstName: firstName,
        gradeName: gradeName,
        lastName: lastName,
        middleName: middleName,
        profileImage: profileImage,
        schoolName: schoolName,
        studentId: studentId,
        transportDetails: transportDetails?.transform(),
        guardiansDetails: guardiansDetails?.map((e) => e.transform()).toList());
  }
}

@JsonSerializable()
class TransportDetailsEntity
    implements
        BaseLayerDataTransformer<TransportDetailsEntity, TransportDetails> {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "student_id")
  int? studentId;
  @JsonKey(name: "route")
  RouteEntity? route;

  TransportDetailsEntity({this.id, this.studentId, this.route});

  factory TransportDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$TransportDetailsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TransportDetailsEntityToJson(this);

  @override
  TransportDetailsEntity restore(TransportDetails data) {
    return TransportDetailsEntity();
  }

  @override
  TransportDetails transform() {
    return TransportDetails(
        id: id, route: route?.transform(), studentId: studentId);
  }
}

@JsonSerializable()
class RouteEntity
    implements BaseLayerDataTransformer<RouteEntity, TransportRoute> {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "route_name")
  String? routeName;
  @JsonKey(name: "bus_type")
  String? busType;
  @JsonKey(name: "route_type")
  String? routeType;
  @JsonKey(name: "routeStopMapping")
  List<RouteStopMappingEntity>? routeStopMapping;

  RouteEntity({
    this.id,
    this.routeName,
    this.busType,
    this.routeType,
    this.routeStopMapping,
  });

  factory RouteEntity.fromJson(Map<String, dynamic> json) =>
      _$RouteEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RouteEntityToJson(this);

  @override
  RouteEntity restore(TransportRoute data) {
    return RouteEntity();
  }

  @override
  TransportRoute transform() {
    return TransportRoute(
        id: id,
        busType: busType,
        routeName: routeName,
        routeType: routeType,
        routeStopMapping: routeStopMapping
            ?.map(
              (e) => TransportRouteStopMapping(
                  id: e.id,
                  approxTime: e.approxTime,
                  createdAt: e.createdAt,
                  orderNo: e.orderNo,
                  stop: Stop(
                      stopName: e.stop?.stopName,
                      stopMapName: e.stop?.stopMapName,
                      academicYrsId: e.stop?.academicYrsId,
                      createdAt: e.stop?.createdAt,
                      distanceKm: e.stop?.distanceKm,
                      endDate: e.stop?.endDate,
                      id: e.stop?.id,
                      isDraft: e.stop?.isDraft,
                      lat: e.stop?.lat,
                      long: e.stop?.long,
                      orderBy: e.stop?.orderBy),
                  updatedAt: e.updatedAt),
            )
            .toList());
  }
}
