import 'package:network_retrofit/network_retrofit.dart';

part 'find_by_category_subcategory_request.g.dart';

@JsonSerializable()
class FindByCategorySubCategoryRequest {
  @JsonKey(name: "category_id")
  int? categoryId;
  @JsonKey(name: "sub_category_id")
  int? subCategoryId;

  FindByCategorySubCategoryRequest({
    this.categoryId,
    this.subCategoryId,
  });

  factory FindByCategorySubCategoryRequest.fromJson(
          Map<String, dynamic> json) =>
      _$FindByCategorySubCategoryRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$FindByCategorySubCategoryRequestToJson(this);
}
