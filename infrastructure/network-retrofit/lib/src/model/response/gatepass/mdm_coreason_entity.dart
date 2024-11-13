import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mdm_coreason_entity.g.dart';

@JsonSerializable()
class MdmCoReasonEntity
    implements
        BaseLayerDataTransformer<MdmCoReasonEntity, MdmCoReasonResponseModel> {
  @JsonKey(name: "data")
  List<MdmCoReasonDataEntity>? data;
  @JsonKey(name: "meta")
  MetaEntity? meta;

  MdmCoReasonEntity({this.data, this.meta});

  factory MdmCoReasonEntity.fromJson(Map<String, dynamic> json) =>
      _$MdmCoReasonEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MdmCoReasonEntityToJson(this);

  @override
  MdmCoReasonEntity restore(MdmCoReasonResponseModel data) {
    return MdmCoReasonEntity();
  }

  @override
  MdmCoReasonResponseModel transform() {
    return MdmCoReasonResponseModel(
        data: data?.map((e) => e.transform()).toList(),
        meta: meta?.transform());
  }
}

@JsonSerializable()
class MdmCoReasonDataEntity
    implements
        BaseLayerDataTransformer<MdmCoReasonDataEntity, MdmCoReasonDataModel> {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "attributes")
  MdmAttributesEntity? attributes;

  MdmCoReasonDataEntity({this.id, this.attributes});

  factory MdmCoReasonDataEntity.fromJson(Map<String, dynamic> json) =>
      _$MdmCoReasonDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MdmCoReasonDataEntityToJson(this);

  @override
  MdmCoReasonDataEntity restore(MdmCoReasonDataModel data) {
    return MdmCoReasonDataEntity();
  }

  @override
  MdmCoReasonDataModel transform() {
    return MdmCoReasonDataModel(attributes: attributes?.transform(), id: id);
  }
}

@JsonSerializable()
class MdmAttributesEntity
    implements BaseLayerDataTransformer<MdmAttributesEntity, MdmAttributesModel> {
  @JsonKey(name: "name")
  String? name;

  MdmAttributesEntity({this.name});

  factory MdmAttributesEntity.fromJson(Map<String, dynamic> json) =>
      _$MdmAttributesEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MdmAttributesEntityToJson(this);

  @override
  MdmAttributesEntity restore(MdmAttributesModel data) {
    return MdmAttributesEntity();
  }

  @override
  MdmAttributesModel transform() {
    return MdmAttributesModel(name: name);
  }
}

@JsonSerializable()
class MetaEntity implements BaseLayerDataTransformer<MetaEntity, MetaModel> {
  @JsonKey(name: "pagination")
  PaginationEntity? pagination;

  MetaEntity({this.pagination});

  factory MetaEntity.fromJson(Map<String, dynamic> json) =>
      _$MetaEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MetaEntityToJson(this);

  @override
  MetaEntity restore(MetaModel data) {
    return MetaEntity();
  }

  @override
  MetaModel transform() {
    return MetaModel(pagination: pagination?.transform());
  }
}

@JsonSerializable()
class PaginationEntity
    implements BaseLayerDataTransformer<PaginationEntity, PaginationModel> {
  @JsonKey(name: "page")
  int? page;
  @JsonKey(name: "pageSize")
  int? pageSize;
  @JsonKey(name: "pageCount")
  int? pageCount;
  @JsonKey(name: "total")
  int? total;

  PaginationEntity({this.page, this.pageSize, this.pageCount, this.total});

  factory PaginationEntity.fromJson(Map<String, dynamic> json) =>
      _$PaginationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationEntityToJson(this);

  @override
  PaginationEntity restore(PaginationModel data) {
    return PaginationEntity();
  }

  @override
  PaginationModel transform() {
    return PaginationModel(
        page: page, pageCount: pageCount, pageSize: pageSize, total: total);
  }
}
