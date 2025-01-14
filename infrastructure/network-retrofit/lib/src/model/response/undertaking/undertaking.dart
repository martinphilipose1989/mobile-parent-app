import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'undertaking.g.dart';

@JsonSerializable()
class UndertakingResponseEntity
    implements
        BaseLayerDataTransformer<UndertakingResponseEntity,
            UndertakingResponse> {
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "message")
  final String? message;
  // @JsonKey(name: "data")
  // final UndertakingEntity? data;

  UndertakingResponseEntity({required this.status, required this.message});

  @override
  UndertakingResponseEntity restore(UndertakingResponse data) {
    return UndertakingResponseEntity(status: status, message: message);
  }

  @override
  UndertakingResponse transform() {
    return UndertakingResponse(status: status, message: message);
  }

  factory UndertakingResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$UndertakingResponseEntityFromJson(json);
}

// @JsonSerializable()
class UndertakingEntity
    implements BaseLayerDataTransformer<UndertakingEntity, Undertaking> {
  @override
  UndertakingEntity restore(Undertaking data) {
    return UndertakingEntity();
  }

  @override
  Undertaking transform() {
    return Undertaking();
  }
}
