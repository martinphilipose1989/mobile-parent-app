import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/get_registreation_info/base_info_entity.dart';
import 'package:network_retrofit/src/model/response/get_registreation_info/parent_info_entity.dart';

part 'parent_info_base_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class ParentInfoBaseEntity extends BaseInfoEntity<ParentInfoEntity,ParentInfoBase>{
    @JsonKey(name: 'status')
    int? status;
    @JsonKey(name: 'data')
    ParentInfoEntity? data;
    @JsonKey(name: 'message')
    String? message;

    ParentInfoBaseEntity({
        this.status,
        this.data,
        this.message,
    });

  factory ParentInfoBaseEntity.fromJson(Map<String, dynamic> json) =>
      _$ParentInfoBaseEntityFromJson(json);

  @override
  Map<String, dynamic> toJson([Object? Function(ParentInfoEntity)? toJsonContactDetailEntity, Object? Function(ParentInfoBase)? toJsonContactInfo]) {
    return _$ParentInfoBaseEntityToJson(this);
  }

  @override
  ParentInfoBase transform() {
    ParentInfoBase parentInfoBase = ParentInfoBase();
    parentInfoBase.data = data?.transform();
    parentInfoBase.status = status;
    parentInfoBase.message = message;
    return ParentInfoBase();
  }
}