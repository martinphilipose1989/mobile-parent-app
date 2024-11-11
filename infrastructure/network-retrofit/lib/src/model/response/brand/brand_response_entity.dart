import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'brand_response_entity.g.dart';

@JsonSerializable()
class BrandResponseEntity
    implements BaseLayerDataTransformer<BrandResponseEntity, BrandResponse> {
  @JsonKey(name: "data")
  List<BrandDataEntity> data;
  @JsonKey(name: "meta")
  BrandMetaEntity meta;

  BrandResponseEntity({required this.data, required this.meta});

  factory BrandResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$BrandResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BrandResponseEntityToJson(this);

  @override
  BrandResponseEntity restore(BrandResponse data) {
    throw UnimplementedError();
  }

  @override
  BrandResponse transform() {
    return BrandResponse(
        data: data.map((e) => e.transform()).toList(), meta: meta.transform());
  }
}

@JsonSerializable()
class BrandDataEntity
    implements BaseLayerDataTransformer<BrandDataEntity, BrandData> {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "attributes")
  BrandAttributesEntity attributes;

  BrandDataEntity({required this.id, required this.attributes});

  factory BrandDataEntity.fromJson(Map<String, dynamic> json) =>
      _$BrandDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BrandDataEntityToJson(this);

  @override
  BrandDataEntity restore(BrandData data) {
    throw UnimplementedError();
  }

  @override
  BrandData transform() {
    return BrandData(id: id, attributes: attributes.transform());
  }
}

@JsonSerializable()
class BrandAttributesEntity
    implements
        BaseLayerDataTransformer<BrandAttributesEntity, BrandAttributes> {
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "brand_code")
  String brandCode;
  @JsonKey(name: "createdAt")
  String? createdAt;
  @JsonKey(name: "updatedAt")
  String updatedAt;

  BrandAttributesEntity(
      {required this.name,
      required this.brandCode,
      required this.createdAt,
      required this.updatedAt});

  factory BrandAttributesEntity.fromJson(Map<String, dynamic> json) =>
      _$BrandAttributesEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BrandAttributesEntityToJson(this);

  @override
  BrandAttributesEntity restore(BrandAttributes data) {
    throw UnimplementedError();
  }

  @override
  BrandAttributes transform() {
    return BrandAttributes(
        name: name,
        brandCode: brandCode,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }
}

@JsonSerializable()
class BrandMetaEntity
    implements BaseLayerDataTransformer<BrandMetaEntity, BrandMeta> {
  @JsonKey(name: "pagination")
  BrandPaginationEntity pagination;

  BrandMetaEntity({required this.pagination});

  factory BrandMetaEntity.fromJson(Map<String, dynamic> json) =>
      _$BrandMetaEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BrandMetaEntityToJson(this);

  @override
  BrandMetaEntity restore(BrandMeta data) {
    throw UnimplementedError();
  }

  @override
  BrandMeta transform() {
    return BrandMeta(pagination: pagination.transform());
  }
}

@JsonSerializable()
class BrandPaginationEntity
    implements
        BaseLayerDataTransformer<BrandPaginationEntity, BrandPagination> {
  @JsonKey(name: "page")
  int page;
  @JsonKey(name: "pageSize")
  int pageSize;
  @JsonKey(name: "pageCount")
  int pageCount;
  @JsonKey(name: "total")
  int total;

  BrandPaginationEntity(
      {required this.page,
      required this.pageSize,
      required this.pageCount,
      required this.total});

  factory BrandPaginationEntity.fromJson(Map<String, dynamic> json) =>
      _$BrandPaginationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BrandPaginationEntityToJson(this);

  @override
  BrandPaginationEntity restore(BrandPagination data) {
    throw UnimplementedError();
  }

  @override
  BrandPagination transform() {
    return BrandPagination(
        page: page, pageSize: pageSize, pageCount: pageCount, total: total);
  }
}
