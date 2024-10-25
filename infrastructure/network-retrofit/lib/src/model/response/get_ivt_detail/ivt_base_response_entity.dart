import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/get_ivt_detail/ivt_detail_response_entity.dart';

part 'ivt_base_response_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class IvtBaseResponseEntity extends BaseLayerDataTransformer<IvtBaseResponseEntity,IVTBase>{
    @JsonKey(name: 'status')
    int? status;
    @JsonKey(name: 'data')
    IvtDetailResponseEntity? data;
    @JsonKey(name: 'message')
    String? message;

    IvtBaseResponseEntity({this.status,this.data,this.message});

    factory IvtBaseResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$IvtBaseResponseEntityFromJson(json);

    Map<String, dynamic> toJson() => _$IvtBaseResponseEntityToJson(this);

    @override
  IVTBase transform() {
    IVTBase ivtBase = IVTBase();
    ivtBase.status = status;
    ivtBase.data = data?.transform();
    ivtBase.message = message;
    return ivtBase;
  }
}