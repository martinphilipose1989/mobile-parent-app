import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:network_retrofit/src/model/response/finance/get_sibling_list/data_entity.dart';
import 'package:network_retrofit/src/model/response/finance/get_sibling_list/meta_entity.dart';

part 'get_sibling_list_response_entity.g.dart';

@JsonSerializable()
class GetsibglingListResponseEntity extends BaseLayerDataTransformer<
    GetsibglingListResponseEntity, GetsibglingListModel> {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "data")
  final GetSibglingListResponseEntityData? data;
  @JsonKey(name: "meta")
  final GetSibglingListResponseEntityMeta? meta;
  @JsonKey(name: "message")
  final String? message;

  GetsibglingListResponseEntity({
    this.success,
    this.data,
    this.meta,
    this.message,
  });

  factory GetsibglingListResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$GetsibglingListResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetsibglingListResponseEntityToJson(this);

  @override
  GetsibglingListModel transform() {
    return GetsibglingListModel(
      message: message,
      success: success,
      data: data!.transform(),
      meta: meta!.transform(),
    );
  }
}
