import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
part 'msg_sub_category_entity.g.dart';

@JsonSerializable()
class MsgSubCategoryEntity extends BaseLayerDataTransformer<MsgSubCategoryEntity, MsgSubCategoryModel>{
  @JsonKey(name: "data")
  List<MsgSubCategoryModelDatum> data;
  @JsonKey(name: "meta")
  Meta meta;

  MsgSubCategoryEntity({
    required this.data,
    required this.meta,
  });

  factory MsgSubCategoryEntity.fromJson(Map<String, dynamic> json) => _$MsgSubCategoryEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MsgSubCategoryEntityToJson(this);
  @override
  MsgSubCategoryModel transform() {
    // TODO: implement transform
    return MsgSubCategoryModel(
        data: data!.map(
              (e) => e.transform(),
        )
            .toList(),
        meta: meta!.transform());
  }
}

@JsonSerializable()
class MsgSubCategoryModelDatum {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "attributes")
  Attributes attributes;

  MsgSubCategoryModelDatum({
    required this.id,
    required this.attributes,
  });

  factory MsgSubCategoryModelDatum.fromJson(Map<String, dynamic> json) => _$MsgSubCategoryModelDatumFromJson(json);

  Map<String, dynamic> toJson() => _$MsgSubCategoryModelDatumToJson(this);
  @override
  MsgSubCategoryDatum transform() {
    // TODO: implement transform
    return MsgSubCategoryDatum(attributes: attributes!.transform(), id: id);
  }
}

@JsonSerializable()
class Attributes {
  @JsonKey(name: "category_id")
  int categoryId;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "notice")
  String notice;
  @JsonKey(name: "notice_details")
  String? noticeDetails;
  @JsonKey(name: "work_flow_id")
  dynamic workFlowId;
  @JsonKey(name: "createdAt")
  DateTime createdAt;
  @JsonKey(name: "updatedAt")
  DateTime updatedAt;

  Attributes({
    required this.categoryId,
    required this.name,
    required this.notice,
    required this.noticeDetails,
    required this.workFlowId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) => _$AttributesFromJson(json);

  Map<String, dynamic> toJson() => _$AttributesToJson(this);
  @override
  MsgSubModelAttributes transform() {
    // TODO: implement transform
    return MsgSubModelAttributes(
        createdAt: createdAt,
        name: name,
        updatedAt: updatedAt,
        categoryId: categoryId,
        notice: notice,
        noticeDetails: noticeDetails,
        workFlowId: workFlowId);
  }
}

@JsonSerializable()
class Meta {
  @JsonKey(name: "pagination")
  MsgSubCategoryPagination pagination;

  Meta({
    required this.pagination,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
  @override
  MsgSubCategoryMeta transform() {
    // TODO: implement transform
    return MsgSubCategoryMeta(pagination: pagination!.transform());
  }
}

@JsonSerializable()
class MsgSubCategoryPagination {
  @JsonKey(name: "page")
  int page;
  @JsonKey(name: "pageSize")
  int pageSize;
  @JsonKey(name: "pageCount")
  int pageCount;
  @JsonKey(name: "total")
  int total;

  MsgSubCategoryPagination({
    required this.page,
    required this.pageSize,
    required this.pageCount,
    required this.total,
  });

  factory MsgSubCategoryPagination.fromJson(Map<String, dynamic> json) => _$MsgSubCategoryPaginationFromJson(json);

  Map<String, dynamic> toJson() => _$MsgSubCategoryPaginationToJson(this);
  @override
  MsgSubCategoryModelPagination transform() {
    // TODO: implement transform
    return MsgSubCategoryModelPagination(
        page: page, pageCount: pageCount, pageSize: pageSize, total: total);
  }
}
