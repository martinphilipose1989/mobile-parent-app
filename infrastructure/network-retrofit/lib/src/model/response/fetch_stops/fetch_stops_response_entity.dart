import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:network_retrofit/src/model/response/fetch_stops/stop_detail_entity.dart';

part 'fetch_stops_response_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class FetchStopResponseEntity extends BaseLayerDataTransformer<FetchStopResponseEntity,FetchStopResponseModel>{
    int? status;
    List<StopDetailEntity>? data;
    String? message;

    FetchStopResponseEntity({
        this.status,
        this.data,
        this.message,
    });

    factory FetchStopResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$FetchStopResponseEntityFromJson(json);

    Map<String, dynamic> toJson() => _$FetchStopResponseEntityToJson(this);

    @override
  FetchStopResponseModel transform() {
    FetchStopResponseModel fetchStopResponseModel = FetchStopResponseModel(
      status: status,
      message: message,
      data: data?.map((element)=> element.transform()).toList()
    );
    return fetchStopResponseModel;
  }
}