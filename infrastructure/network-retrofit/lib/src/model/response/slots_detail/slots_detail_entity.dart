import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'slots_detail_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class SlotsDetailEntity extends BaseLayerDataTransformer<SlotsDetailEntity,SlotsDetail>{
    @JsonKey(name: '_id')
    String? id;
    @JsonKey(name: 'slot_for')
    String? slotFor;
    @JsonKey(name: 'slot')
    String? slot;
    @JsonKey(name: 'day')
    String? day;
    @JsonKey(name: 'school_id')
    int? schoolId;

    SlotsDetailEntity({
        this.id,
        this.slotFor,
        this.slot,
        this.day,
        this.schoolId,
    });
    factory SlotsDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$SlotsDetailEntityFromJson(json);

    Map<String, dynamic> toJson() => _$SlotsDetailEntityToJson(this);

    @override
  SlotsDetail transform() {
    SlotsDetail slotsDetail =SlotsDetail();
    slotsDetail.id = id;
    slotsDetail.slotFor = slotFor;
    slotsDetail.slot = slot;
    slotsDetail.day = day;
    slotsDetail.schoolId = schoolId;
    return slotsDetail;
  }
}