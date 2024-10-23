import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'find_by_category_sub_category_entity.g.dart';

@JsonSerializable()
class FindByCategorySubCategoryEntity extends BaseLayerDataTransformer<
    FindByCategorySubCategoryEntity, FindByCategorySubCategoryModel> {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "data")
  List<FindByCategorySubCategoryDatum>? data;
  @JsonKey(name: "message")
  String? message;

  FindByCategorySubCategoryEntity({
    this.status,
    this.data,
    this.message,
  });

  factory FindByCategorySubCategoryEntity.fromJson(Map<String, dynamic> json) =>
      _$FindByCategorySubCategoryEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$FindByCategorySubCategoryEntityToJson(this);

  @override
  FindByCategorySubCategoryModel transform() {
    // TODO: implement transform
    return FindByCategorySubCategoryModel(
        message: message,
        status: status,
        data: data
            ?.map(
              (e) => e.transform(),
            )
            .toList());
  }
}

@JsonSerializable()
class FindByCategorySubCategoryDatum
    extends BaseLayerDataTransformer<FindByCategorySubCategoryDatum, Datum> {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "slug")
  String? slug;
  @JsonKey(name: "category_id")
  int? categoryId;
  @JsonKey(name: "sub_category_id")
  int? subCategoryId;
  @JsonKey(name: "response")
  String? response;
  @JsonKey(name: "priority_id")
  int? priorityId;
  @JsonKey(name: "hris")
  int? hris;
  @JsonKey(name: "group_id")
  List<dynamic>? groupId;
  @JsonKey(name: "type")
  int? type;
  @JsonKey(name: "sub_type_id")
  int? subTypeId;
  @JsonKey(name: "sub_sub_type_id")
  int? subSubTypeId;
  @JsonKey(name: "to_type")
  dynamic toType;
  @JsonKey(name: "from_type")
  String? fromType;
  @JsonKey(name: "subject")
  String? subject;
  @JsonKey(name: "workflow_id")
  int? workflowId;
  @JsonKey(name: "dynamic_form_id")
  String? dynamicFormId;
  @JsonKey(name: "reviewer_hris")
  int? reviewerHris;
  @JsonKey(name: "tat_value")
  int? tatValue;
  @JsonKey(name: "tat_type")
  int? tatType;
  @JsonKey(name: "navigation_instruction")
  String? navigationInstruction;
  @JsonKey(name: "navigation_link")
  String? navigationLink;
  @JsonKey(name: "is_draft")
  bool? isDraft;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;
  @JsonKey(name: "__v")
  int? v;
  @JsonKey(name: "id")
  String? datumId;

  FindByCategorySubCategoryDatum({
    this.id,
    this.slug,
    this.categoryId,
    this.subCategoryId,
    this.response,
    this.priorityId,
    this.hris,
    this.groupId,
    this.type,
    this.subTypeId,
    this.subSubTypeId,
    this.toType,
    this.fromType,
    this.subject,
    this.workflowId,
    this.dynamicFormId,
    this.reviewerHris,
    this.tatValue,
    this.tatType,
    this.navigationInstruction,
    this.navigationLink,
    this.isDraft,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.datumId,
  });

  factory FindByCategorySubCategoryDatum.fromJson(Map<String, dynamic> json) =>
      _$FindByCategorySubCategoryDatumFromJson(json);

  Map<String, dynamic> toJson() => _$FindByCategorySubCategoryDatumToJson(this);

  @override
  Datum transform() {
    return Datum(
      id: id,
      slug: slug,
      categoryId: categoryId,
      subCategoryId: subCategoryId,
      response: response,
      priorityId: priorityId,
      hris: hris,
      groupId: groupId,
      type: type,
      subTypeId: subTypeId,
      subSubTypeId: subSubTypeId,
      toType: toType,
      fromType: fromType,
      subject: subject,
      workflowId: workflowId,
      dynamicFormId: dynamicFormId,
      reviewerHris: reviewerHris,
      tatValue: tatValue,
      tatType: tatType,
      navigationInstruction: navigationInstruction,
      navigationLink: navigationLink,
      isDraft: isDraft,
      createdAt: createdAt,
      updatedAt: updatedAt,
      v: v,
      datumId: datumId,
    );
  }
}
