import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'enquiry_stage_update.g.dart';

@JsonSerializable()
class MoveToNextStageEnquiryResponseEntity
    implements
        BaseLayerDataTransformer<MoveToNextStageEnquiryResponseEntity,
            MoveToNextStageEnquiryResponse> {
  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  MoveToNextStageEnquiryResponseEntity({
    this.status,
    this.message,
  });

  factory MoveToNextStageEnquiryResponseEntity.fromJson(
          Map<String, dynamic> json) =>
      _$MoveToNextStageEnquiryResponseEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MoveToNextStageEnquiryResponseEntityToJson(this);

  @override
  MoveToNextStageEnquiryResponseEntity restore(data) {
    return MoveToNextStageEnquiryResponseEntity();
  }

  @override
  MoveToNextStageEnquiryResponse transform() {
    return MoveToNextStageEnquiryResponse(message: message, status: status);
  }
}
