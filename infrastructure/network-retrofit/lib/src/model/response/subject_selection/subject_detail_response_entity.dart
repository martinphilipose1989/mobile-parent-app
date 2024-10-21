import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/subject_selection/subject_detail_entity.dart';

part 'subject_detail_response_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class SubjectDetailResponseEntity extends BaseLayerDataTransformer<SubjectDetailResponseEntity,SubjectDetailResponse>{
  @JsonKey(name: 'status')
  int? status;
  @JsonKey(name: 'data')
  SubjectDetailEntity? data;
  @JsonKey(name: 'message')
  String? message;

  SubjectDetailResponseEntity({
    this.status,
    this.data,
    this.message,
  });

  factory SubjectDetailResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$SubjectDetailResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectDetailResponseEntityToJson(this);

  @override
  SubjectDetailResponse transform() {
    SubjectDetailResponse response = SubjectDetailResponse();
    response.status = status;
    response.data = data?.transform();
    response.message = message;
    return response;
  }
}