import 'package:data/data.dart';

import '../../../../network_retrofit.dart';

part 'co_reasons_list_response_entity.g.dart';

@JsonSerializable()
class CoReasonsListResponseEntity implements BaseLayerDataTransformer<CoReasonsListResponseEntity,CoReasonsListResponseModel>{
  @JsonKey(name: "data")
  List<DatumEntity> data;


  CoReasonsListResponseEntity({
    required this.data,

  });

  factory CoReasonsListResponseEntity.fromJson(Map<String, dynamic> json) => _$CoReasonsListResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CoReasonsListResponseEntityToJson(this);

  @override
  CoReasonsListResponseEntity restore(CoReasonsListResponseModel data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  CoReasonsListResponseModel transform() {
  return CoReasonsListResponseModel(data:data.map((e)=>e.transform()).toList() );
  }
}

@JsonSerializable()
class DatumEntity implements BaseLayerDataTransformer<DatumEntity,Datum>{
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "attributes")
  AttributesEntity attributes;

  DatumEntity({
    required this.id,
    required this.attributes,
  });

  factory DatumEntity.fromJson(Map<String, dynamic> json) => _$DatumEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DatumEntityToJson(this);

  @override
  DatumEntity restore(Datum data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  Datum transform() {
 return Datum(id: id, attributes: attributes.transform());
  }
}

@JsonSerializable()
class AttributesEntity implements BaseLayerDataTransformer<AttributesEntity ,Attributes> {
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "slug")
  String slug;
  @JsonKey(name: "description")
  String description;
  @JsonKey(name: "parent_id")
  dynamic parentId;
  @JsonKey(name: "status_id")
  dynamic statusId;
  @JsonKey(name: "order")
  int order;
  @JsonKey(name: "is_active")
  int isActive;
  @JsonKey(name: "createdAt")
  dynamic createdAt;
  @JsonKey(name: "updatedAt")
  dynamic updatedAt;

  AttributesEntity({
    required this.name,
    required this.slug,
    required this.description,
    required this.parentId,
    required this.statusId,
    required this.order,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AttributesEntity.fromJson(Map<String, dynamic> json) => _$AttributesEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AttributesEntityToJson(this);

  @override
  AttributesEntity restore(Attributes data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  Attributes transform() {

    return Attributes(name: name, slug: slug, description: description, parentId: parentId, statusId: statusId, order: order, isActive: isActive, createdAt: createdAt, updatedAt: updatedAt);
  }
  
  
}

