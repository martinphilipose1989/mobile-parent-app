import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'school_response_entity.g.dart';

@JsonSerializable()
class SchoolResponseEntity
    implements
        BaseLayerDataTransformer<SchoolResponseEntity, SchoolListResponse> {
  @JsonKey(name: "data")
  List<SchoolResponseDataEntity>? data;
  @JsonKey(name: "meta")
  SchoolMetaEntity? meta;

  SchoolResponseEntity({this.data, this.meta});

  factory SchoolResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$SchoolResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SchoolResponseEntityToJson(this);

  @override
  SchoolResponseEntity restore(SchoolListResponse data) {
    throw UnimplementedError();
  }

  @override
  SchoolListResponse transform() {
    return SchoolListResponse(
        data: data?.map((e) => e.transform()).toList(),
        meta: meta?.transform());
  }
}

@JsonSerializable()
class SchoolResponseDataEntity
    implements
        BaseLayerDataTransformer<SchoolResponseDataEntity, SchoolResponseData> {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "attributes")
  SchoolAttributesEntity? attributes;

  SchoolResponseDataEntity({this.id, this.attributes});

  factory SchoolResponseDataEntity.fromJson(Map<String, dynamic> json) =>
      _$SchoolResponseDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SchoolResponseDataEntityToJson(this);

  @override
  SchoolResponseDataEntity restore(SchoolResponseData data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  SchoolResponseData transform() {
    return SchoolResponseData(id: id, attributes: attributes?.transform());
  }
}

@JsonSerializable()
class SchoolAttributesEntity
    implements
        BaseLayerDataTransformer<SchoolAttributesEntity, SchoolAttributes> {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "short_name")
  String? shortName;
  @JsonKey(name: "createdAt")
  String? createdAt;
  @JsonKey(name: "updatedAt")
  String? updatedAt;
  @JsonKey(name: "code")
  String? code;
  @JsonKey(name: "cluster_id")
  int? clusterId;
  @JsonKey(name: "city_id")
  int? cityId;
  @JsonKey(name: "organization_id")
  int? organizationId;
  @JsonKey(name: "academic_year_id")
  int? academicYearId;
  @JsonKey(name: "address_for_receipt")
  dynamic addressForReceipt;
  @JsonKey(name: "website")
  dynamic website;
  @JsonKey(name: "helpline")
  dynamic helpline;
  @JsonKey(name: "state_id")
  int? stateId;
  @JsonKey(name: "latitude")
  dynamic latitude;
  @JsonKey(name: "longitude")
  dynamic longitude;

  SchoolAttributesEntity({
    this.name,
    this.shortName,
    this.createdAt,
    this.updatedAt,
    this.code,
    this.clusterId,
    this.cityId,
    this.organizationId,
    this.academicYearId,
    this.addressForReceipt,
    this.website,
    this.helpline,
    this.stateId,
    this.latitude,
    this.longitude,
  });

  factory SchoolAttributesEntity.fromJson(Map<String, dynamic> json) =>
      _$SchoolAttributesEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SchoolAttributesEntityToJson(this);

  @override
  SchoolAttributesEntity restore(SchoolAttributes data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  SchoolAttributes transform() {
    return SchoolAttributes(
      academicYearId: academicYearId,
      addressForReceipt: addressForReceipt,
      cityId: cityId,
      clusterId: clusterId,
      code: code,
      createdAt: createdAt,
      helpline: helpline,
      latitude: latitude,
      longitude: longitude,
      name: name,
      organizationId: organizationId,
      shortName: shortName,
      stateId: stateId,
      updatedAt: updatedAt,
      website: website,
    );
  }
}

@JsonSerializable()
class SchoolMetaEntity
    implements BaseLayerDataTransformer<SchoolMetaEntity, SchoolMeta> {
  @JsonKey(name: "pagination")
  SchoolPaginationEntity? pagination;

  SchoolMetaEntity({this.pagination});

  factory SchoolMetaEntity.fromJson(Map<String, dynamic> json) =>
      _$SchoolMetaEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SchoolMetaEntityToJson(this);

  @override
  SchoolMetaEntity restore(SchoolMeta data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  SchoolMeta transform() {
    return SchoolMeta(pagination: pagination?.transform());
  }
}

@JsonSerializable()
class SchoolPaginationEntity
    implements
        BaseLayerDataTransformer<SchoolPaginationEntity, SchoolPagination> {
  @JsonKey(name: "page")
  int? page;
  @JsonKey(name: "pageSize")
  int? pageSize;
  @JsonKey(name: "pageCount")
  int? pageCount;
  @JsonKey(name: "total")
  int? total;

  SchoolPaginationEntity(
      {this.page, this.pageSize, this.pageCount, this.total});

  factory SchoolPaginationEntity.fromJson(Map<String, dynamic> json) =>
      _$SchoolPaginationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SchoolPaginationEntityToJson(this);

  @override
  SchoolPaginationEntity restore(SchoolPagination data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  SchoolPagination transform() {
    return SchoolPagination(
        page: page, pageCount: pageCount, pageSize: pageSize, total: total);
  }
}
