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
  @JsonKey(name: 'errorCode')
  int? errorCode;
  @JsonKey(name: 'errorMessage', fromJson: _fromJson)
  String? errorMessage;
  @JsonKey(name: 'error')
  String? error;

  factory ErrorEntity.fromJson(Map<String, dynamic> json) =>
      _$ErrorEntityFromJson(json);

  static String _fromJson(dynamic data) {
    if (data is List<String>) {
      return data.first;
    } else {
      return data;
    }
  }

  Map<String, dynamic> toJson() => _$ErrorEntityToJson(this);

  ErrorEntity({
    this.type,
    this.code,
    this.message,
    this.errorCode,
    this.error,
    this.errorMessage,
  });
}
