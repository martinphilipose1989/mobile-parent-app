import 'package:network_retrofit/network_retrofit.dart';

part 'error_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class ErrorEntity {
  @JsonKey(name: 'name')
  String? type;
  @JsonKey(name: 'statusCode')
  int? code;
  @JsonKey(name: 'message')
  String? message;

  factory ErrorEntity.fromJson(Map<String, dynamic> json) =>
      _$ErrorEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorEntityToJson(this);

  ErrorEntity({
    this.type,
    this.code,
    this.message,
  });
}
