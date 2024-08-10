import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_info_entity.g.dart';

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class BaseInfoEntity<T, U> extends BaseLayerDataTransformer<BaseInfoEntity<T, U>, U> {
  @JsonKey(name: 'status')
  int? status;

  @JsonKey(name: 'data')
  T? data;

  @JsonKey(name: 'message')
  String? message;

  BaseInfoEntity({
    this.status,
    this.data,
    this.message,
  });
  
  factory BaseInfoEntity.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT, U Function(Object? json) fromJsonU) =>
      _$BaseInfoEntityFromJson(json, fromJsonT, fromJsonU);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT, Object? Function(U value) toJsonU) =>
      _$BaseInfoEntityToJson(this, toJsonT, toJsonU);

  @override
  U transform();
}