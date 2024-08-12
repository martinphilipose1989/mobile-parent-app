import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'meta_entity.g.dart';

@JsonSerializable()
class GetSibglingListResponseEntityMeta
    extends BaseLayerDataTransformer<GetSibglingListResponseEntityMeta, Meta> {
  GetSibglingListResponseEntityMeta();

  factory GetSibglingListResponseEntityMeta.fromJson(
          Map<String, dynamic> json) =>
      _$GetSibglingListResponseEntityMetaFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetSibglingListResponseEntityMetaToJson(this);

  @override
  Meta transform() {
    return Meta();
  }
}
