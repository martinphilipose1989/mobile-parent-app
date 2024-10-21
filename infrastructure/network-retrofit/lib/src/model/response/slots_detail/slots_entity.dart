import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/slots_detail/slots_detail_entity.dart';

part 'slots_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class SlotsEntity extends BaseLayerDataTransformer<SlotsEntity,Slots>{
  @JsonKey(name: 'status')
  int? status;
  @JsonKey(name: 'data')
  List<SlotsDetailEntity>? data;
  @JsonKey(name: 'message')
  String? message;

  SlotsEntity({
      this.status,
      this.data,
      this.message,
  });

  factory SlotsEntity.fromJson(Map<String, dynamic> json) =>
    _$SlotsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SlotsEntityToJson(this);

  @override
  Slots transform() {
    Slots slots = Slots();
    slots.status = status;
    slots.data = data?.map((element)=> element.transform()).toList();
    slots.status = status;
    return slots;
  }
  
}