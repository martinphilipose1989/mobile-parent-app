import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:network_retrofit/src/model/response/finance/get_pending_fees/get_pending_fees_data_entity.dart';

part 'get_pending_fees_entity.g.dart';

@JsonSerializable()
class GetPendingFeesEntity extends BaseLayerDataTransformer<
    GetPendingFeesEntity, GetPendingFeesModel> {
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final GetPendingFeesDataEntity? data;
  @JsonKey(name: "message")
  final String? message;

  GetPendingFeesEntity({
    this.status,
    this.data,
    this.message,
  });

  factory GetPendingFeesEntity.fromJson(Map<String, dynamic> json) =>
      _$GetPendingFeesEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetPendingFeesEntityToJson(this);

  @override
  GetPendingFeesModel transform() {
    // TODO: implement transform
    return GetPendingFeesModel(
        status: status, message: message, data: data!.transform());
  }
}
