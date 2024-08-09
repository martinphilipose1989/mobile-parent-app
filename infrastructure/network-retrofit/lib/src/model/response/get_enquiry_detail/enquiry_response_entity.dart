import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/get_enquiry_detail/enquiry_detail_entity.dart';

part 'enquiry_response_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class EnquiryResponseEntity extends BaseLayerDataTransformer <EnquiryResponseEntity,CompetencyTestBase> {
    @JsonKey(name: 'status')
    int? status;
    @JsonKey(name: 'data')
    EnquiryDetailEntity? data;
    @JsonKey(name: 'message')
    String? message;

    EnquiryResponseEntity({
      this.status,
      this.data,
      this.message,
    });

  factory EnquiryResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$EnquiryResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$EnquiryResponseEntityToJson(this);

  @override
  CompetencyTestBase transform() {
    CompetencyTestBase enquiry = CompetencyTestBase();
    enquiry.status = status;
    enquiry.data = data?.transform();
    enquiry.message = message;
    return enquiry;
    
  }

}