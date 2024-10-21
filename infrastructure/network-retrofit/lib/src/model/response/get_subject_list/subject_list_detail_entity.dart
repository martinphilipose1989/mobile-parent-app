import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/get_subject_list/page_detail_entity.dart';
import 'package:network_retrofit/src/model/response/get_subject_list/subject_entity.dart';

part 'subject_list_detail_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class SubjectListDetailEntity extends BaseLayerDataTransformer<SubjectListDetailEntity, SubjectListDetail>{
  List<SubjectEntity>? data;
  PageDetailEntity? meta;

  SubjectListDetailEntity({
    this.data,
    this.meta,
  });

  factory SubjectListDetailEntity.fromJson(Map<String, dynamic> json) => _$SubjectListDetailEntityFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectListDetailEntityToJson(this);

  @override
  SubjectListDetail transform() {
    SubjectListDetail subjectListDetail = SubjectListDetail();
    subjectListDetail.data = data?.map((e) => e.transform()).toList();
    subjectListDetail.meta = meta?.transform();
    return subjectListDetail;
  }
}