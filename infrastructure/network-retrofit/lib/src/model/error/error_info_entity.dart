import 'package:network_retrofit/network_retrofit.dart';
import 'package:network_retrofit/src/model/error/error_entity.dart';

part 'error_info_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class ErrorInfoEntity {
  @JsonKey(name: 'error')
  ErrorEntity? error;


  //
  factory ErrorInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$ErrorInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorInfoEntityToJson(this);

  ErrorInfoEntity({this.error});

}
