import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'move_next_stage_request.g.dart';

@JsonSerializable()
class MoveToNextStageEnquiryRequestEntity
    implements
        BaseLayerDataTransformer<MoveToNextStageEnquiryRequestEntity,
            MoveToNextStageEnquiryRequest> {
  @JsonKey(name: "currentStage")
  String? currentStage;

  MoveToNextStageEnquiryRequestEntity({this.currentStage});

  factory MoveToNextStageEnquiryRequestEntity.fromJson(
          Map<String, dynamic> json) =>
      _$MoveToNextStageEnquiryRequestEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MoveToNextStageEnquiryRequestEntityToJson(this);

  @override
  MoveToNextStageEnquiryRequestEntity restore(
      MoveToNextStageEnquiryRequest data) {
    return MoveToNextStageEnquiryRequestEntity(currentStage: data.currentStage);
  }

  @override
  MoveToNextStageEnquiryRequest transform() {
    return MoveToNextStageEnquiryRequest(currentStage: currentStage);
  }
}
