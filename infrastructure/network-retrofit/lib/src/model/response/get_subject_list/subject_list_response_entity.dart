import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/get_subject_list/subject_list_detail_entity.dart';

part 'subject_list_response_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class SubjectListResponseEntity extends BaseLayerDataTransformer<SubjectListResponseEntity, SubjectListResponse>{
    int? status;
    SubjectListDetailEntity? data;
    String? message;
    bool? success;

    SubjectListResponseEntity({
        this.status,
        this.data,
        this.message,
        this.success, 
    });

    factory SubjectListResponseEntity.fromJson(Map<String, dynamic> json) => _$SubjectListResponseEntityFromJson(json);
    Map<String, dynamic> toJson() => _$SubjectListResponseEntityToJson(this);

    @override
    SubjectListResponse transform() {
        SubjectListResponse subjectListResponse = SubjectListResponse();
        subjectListResponse.status = status;
        subjectListResponse.data = data?.transform();
        subjectListResponse.message = message;
        subjectListResponse.success = success;
        return subjectListResponse;
    }
}