import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/get_enquiry_list/enquiry_list_detail_response_entity.dart';

part 'enquirylist_base_response_entity.g.dart';


@JsonSerializable(explicitToJson: true)
class EnquirylistBaseResponseEntity extends BaseLayerDataTransformer<EnquirylistBaseResponseEntity,EnquiryListBaseModel>{
  @JsonKey(name: 'totalCount')
  int? totalCount;
  @JsonKey(name: 'isNextPage')
  bool? isNextPage;
  @JsonKey(name: 'data')
  List<EnquiryListDetailResponseEntity>? data;

  EnquirylistBaseResponseEntity({
      required this.totalCount,
      required this.isNextPage,
      required this.data,
  });

  factory EnquirylistBaseResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$EnquirylistBaseResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$EnquirylistBaseResponseEntityToJson(this);

  @override
  EnquiryListBaseModel transform() {
    EnquiryListBaseModel enquiryListBaseModel = EnquiryListBaseModel();
    enquiryListBaseModel.totalCount = totalCount;
    enquiryListBaseModel.isNextPage = isNextPage;
    enquiryListBaseModel.data = data?.map((element)=> element.transform()).toList();    
    return enquiryListBaseModel;
  }
}