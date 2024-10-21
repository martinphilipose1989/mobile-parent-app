import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/get_new_admission/new_admission_detail_entity.dart';

part 'new_admission_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class NewAdmissionEntity extends BaseLayerDataTransformer<NewAdmissionEntity,NewAdmissionBase>{
  @JsonKey(name: 'status')
  int? status;
  @JsonKey(name: 'data')
  NewAdmissionDetailEntity? data;
  @JsonKey(name: 'message')
  String? message;

  NewAdmissionEntity({this.data,this.message,this.status});

  factory NewAdmissionEntity.fromJson(Map<String, dynamic> json) =>
      _$NewAdmissionEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NewAdmissionEntityToJson(this);

  @override
  NewAdmissionBase transform() {
    NewAdmissionBase newAdmissionBase = NewAdmissionBase();
    newAdmissionBase.status = status;
    newAdmissionBase.data = data?.transform();
    newAdmissionBase.message = message;
    return newAdmissionBase;
  }

}