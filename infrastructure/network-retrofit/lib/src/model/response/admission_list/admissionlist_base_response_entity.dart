import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/admission_list/admission_list_detail_response_entity.dart';

part 'admissionlist_base_response_entity.g.dart';


@JsonSerializable(explicitToJson: true)
class AdmissionListBaseResponseEntity extends BaseLayerDataTransformer<AdmissionListBaseResponseEntity,AdmissionListModel>{
  @JsonKey(name: 'totalCount')
  int? totalCount;
  @JsonKey(name: 'isNextPage')
  bool? isNextPage;
  @JsonKey(name: 'data')
  List<AdmissionListDetailResponseEntity>? data;

  AdmissionListBaseResponseEntity({
      required this.totalCount,
      required this.isNextPage,
      required this.data,
  });

  factory AdmissionListBaseResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$AdmissionListBaseResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AdmissionListBaseResponseEntityToJson(this);

  @override
  AdmissionListModel transform() {
    AdmissionListModel admissionListModel = AdmissionListModel();
    admissionListModel.totalCount = totalCount;
    admissionListModel.isNextPage = isNextPage;
    admissionListModel.data = data?.map((element)=> element.transform()).toList();    
    return admissionListModel;
  }
}