import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:network_retrofit/src/model/response/finance/get_token_generator/get_token_generator_global_number_generator_entity.dart';
import 'package:network_retrofit/src/model/response/finance/get_token_generator/get_token_generator_segment_lob_id_entity.dart';

part 'get_token_generator_details_entity.g.dart';

@JsonSerializable()
class GetTokenGeneratorDetailsEntity
    extends BaseLayerDataTransformer<GetTokenGeneratorDetailsEntity, Details> {
  @JsonKey(name: "global_number_generator")
  final GetTokenGeneratorGlobalNumberGeneratorEntity? globalNumberGenerator;
  @JsonKey(name: "segment_lob_id")
  final GetTokenGeneratorSegmentLobIdEntity? segmentLobId;

  GetTokenGeneratorDetailsEntity({
    this.globalNumberGenerator,
    this.segmentLobId,
  });

  factory GetTokenGeneratorDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$GetTokenGeneratorDetailsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetTokenGeneratorDetailsEntityToJson(this);

  @override
  Details transform() {
    // TODO: implement transform
    return Details(
        globalNumberGenerator: globalNumberGenerator!.transform(),
        segmentLobId: segmentLobId!.transform());
  }
}
