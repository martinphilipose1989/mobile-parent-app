import 'package:network_retrofit/network_retrofit.dart';

part 'get_token_generator_request.g.dart';

@JsonSerializable(explicitToJson: true)
class GetTokenGeneratorRequest {
  @JsonKey(name: "segment_lob_id")
  final int segmentLobId;

  GetTokenGeneratorRequest({required this.segmentLobId});

  factory GetTokenGeneratorRequest.fromJson(Map<String, dynamic> json) =>
      _$GetTokenGeneratorRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetTokenGeneratorRequestToJson(this);
}
