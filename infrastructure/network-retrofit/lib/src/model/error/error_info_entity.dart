import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'error_info_entity.g.dart';

ErrorInfoEntity errorInfoEntityFromJson(String str) =>
    ErrorInfoEntity.fromJson(json.decode(str));

String errorInfoEntityToJson(ErrorInfoEntity data) =>
    json.encode(data.toJson());

@JsonSerializable()
class ErrorInfoEntity {
  @JsonKey(name: "errorCode")
  int? errorCode;

  @JsonKey(name: "errorMessage")
  dynamic errorMessage; // Allow both string and map for errorMessage

  @JsonKey(name: "error")
  String? error;

  ErrorInfoEntity({
    this.errorCode,
    this.errorMessage,
    this.error,
  });

  factory ErrorInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$ErrorInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorInfoEntityToJson(this);

  // Custom getters to extract error message details
  String? get message => errorMessage is Map<String, dynamic>
      ? errorMessage['message']
      : errorMessage as String?;
  String? get detailedError =>
      errorMessage is Map<String, dynamic> ? errorMessage['error'] : null;
  int? get statusCode =>
      errorMessage is Map<String, dynamic> ? errorMessage['statusCode'] : null;
}
