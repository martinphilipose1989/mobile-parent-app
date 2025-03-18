import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'get_token_generator_segment_lob_id_entity.g.dart';

@JsonSerializable()
class GetTokenGeneratorSegmentLobIdEntity extends BaseLayerDataTransformer<
    GetTokenGeneratorSegmentLobIdEntity, SegmentLobId> {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "segment_id")
  final int? segmentId;
  @JsonKey(name: "createdAt")
  final dynamic createdAt;
  @JsonKey(name: "updatedAt")
  final DateTime? updatedAt;
  @JsonKey(name: "parent1_id")
  final int? parent1Id;
  @JsonKey(name: "parent2_id")
  final int? parent2Id;
  @JsonKey(name: "parent3_id")
  final int? parent3Id;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "start_date")
  final dynamic startDate;
  @JsonKey(name: "end_date")
  final dynamic endDate;

  GetTokenGeneratorSegmentLobIdEntity({
    this.id,
    this.segmentId,
    this.createdAt,
    this.updatedAt,
    this.parent1Id,
    this.parent2Id,
    this.parent3Id,
    this.description,
    this.startDate,
    this.endDate,
  });

  factory GetTokenGeneratorSegmentLobIdEntity.fromJson(
          Map<String, dynamic> json) =>
      _$GetTokenGeneratorSegmentLobIdEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetTokenGeneratorSegmentLobIdEntityToJson(this);

  @override
  SegmentLobId transform() {
    // TODO: implement transform
    return SegmentLobId(
      createdAt: createdAt,
      description: description,
      endDate: endDate,
      id: id,
      parent1Id: parent1Id,
      parent2Id: parent2Id,
      parent3Id: parent3Id,
      segmentId: segmentId,
      startDate: startDate,
      updatedAt: updatedAt,
    );
  }
}
