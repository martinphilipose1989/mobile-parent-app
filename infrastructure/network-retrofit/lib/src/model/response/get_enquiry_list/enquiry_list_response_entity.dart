import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/get_enquiry_list/enquirylist_base_response_entity.dart';

part 'enquiry_list_response_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class EnquiryListResponseEntity extends BaseLayerDataTransformer<
    EnquiryListResponseEntity, EnquiryListModel> {
  @JsonKey(name: 'status')
  int? status;
  @JsonKey(name: 'data', fromJson: _dataFromJson)
  EnquirylistBaseResponseEntity? data;
  @JsonKey(name: 'message')
  String? message;

  EnquiryListResponseEntity({this.status, this.data, this.message});

  factory EnquiryListResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$EnquiryListResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$EnquiryListResponseEntityToJson(this);

  // Custom JSON converter for `data`
  static EnquirylistBaseResponseEntity? _dataFromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return EnquirylistBaseResponseEntity.fromJson(json);
    } else if (json is List && json.isEmpty) {
      return null; // No data case
    } else {
      throw Exception('Unexpected data format');
    }
  }

  @override
  EnquiryListModel transform() {
    EnquiryListModel enquiryListModel = EnquiryListModel();
    enquiryListModel.status = status;
    enquiryListModel.data = data?.transform();
    enquiryListModel.message = message;
    return enquiryListModel;
  }
}
