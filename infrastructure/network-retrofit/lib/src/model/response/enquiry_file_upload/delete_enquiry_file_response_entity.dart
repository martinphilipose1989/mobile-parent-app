import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delete_enquiry_file_response_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class DeleteEnquiryFileResponseEntity extends BaseLayerDataTransformer<DeleteEnquiryFileResponseEntity,DeleteEnquiryFileBase>{
  @JsonKey(name: 'status')
  int? status;
  @JsonKey(name: 'data')
  Map<String,dynamic>? data;
  @JsonKey(name: 'message')
  String? message;

    DeleteEnquiryFileResponseEntity({
        this.status,
        this.data,
        this.message,
    });
  factory DeleteEnquiryFileResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$DeleteEnquiryFileResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteEnquiryFileResponseEntityToJson(this);

  @override
  DeleteEnquiryFileBase transform() {
    DeleteEnquiryFileBase deleteEnquiryFileBase = DeleteEnquiryFileBase();
    deleteEnquiryFileBase.status = status;
    deleteEnquiryFileBase.data = data;
    deleteEnquiryFileBase.message = message;
    return deleteEnquiryFileBase;
  }
}