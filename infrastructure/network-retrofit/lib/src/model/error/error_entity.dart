import 'package:network_retrofit/network_retrofit.dart';

part 'error_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class ErrorEntity {
  @JsonKey(name: 'errorCode')
  int? code;
  @JsonKey(name: 'errorMessage')
  String? message;

  factory ErrorEntity.fromJson(Map<String, dynamic> json) =>
      _$ErrorEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorEntityToJson(this);

  ErrorEntity({
    this.code,
    this.message,
  });
}
