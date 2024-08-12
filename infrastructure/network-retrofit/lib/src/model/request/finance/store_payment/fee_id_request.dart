import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'fee_id_request.g.dart';

@JsonSerializable()
class FeeId extends BaseLayerDataTransformer<FeeId, FeeIdModelRequest> {
  @JsonKey(name: "student_fee_id")
  final int studentFeeId;
  @JsonKey(name: "collected")
  final int collected;
  @JsonKey(name: "fee_order")
  final int feeOrder;

  FeeId({
    required this.studentFeeId,
    required this.collected,
    required this.feeOrder,
  });

  FeeId copyWith({
    int? studentFeeId,
    int? collected,
    int? feeOrder,
  }) =>
      FeeId(
        studentFeeId: studentFeeId ?? this.studentFeeId,
        collected: collected ?? this.collected,
        feeOrder: feeOrder ?? this.feeOrder,
      );

  factory FeeId.fromJson(Map<String, dynamic> json) => _$FeeIdFromJson(json);

  Map<String, dynamic> toJson() => _$FeeIdToJson(this);

  @override
  FeeId restore(FeeIdModelRequest data) {
    // TODO: implement restore
    return FeeId(
        collected: data.collected,
        feeOrder: data.feeOrder,
        studentFeeId: data.studentFeeId);
  }
}
