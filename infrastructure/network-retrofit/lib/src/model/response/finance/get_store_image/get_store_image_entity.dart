import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'get_store_image_entity.g.dart';

@JsonSerializable()
class GetStoreImageEntity
    extends BaseLayerDataTransformer<GetStoreImageEntity, GetStoreImageModel> {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "data")
  String? data;
  @JsonKey(name: "message")
  String? message;

  GetStoreImageEntity({
    this.status,
    this.data,
    this.message,
  });

  factory GetStoreImageEntity.fromJson(Map<String, dynamic> json) =>
      _$GetStoreImageEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetStoreImageEntityToJson(this);

  @override
  GetStoreImageModel transform() {
    // TODO: implement transform
    return GetStoreImageModel(data: data, message: message, status: status);
  }
}
