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
  @JsonKey(name: "coupon_id")
  final String? couponId;
  @JsonKey(name: "amount_before_discount")
  final int? amountBeforeDiscount;

  FeeId(
      {required this.studentFeeId,
      required this.collected,
      required this.feeOrder,
      this.couponId,
      this.amountBeforeDiscount});

  FeeId copyWith(
          {int? studentFeeId,
          int? collected,
          int? feeOrder,
          String? couponId,
          int? amountBeforeDiscount}) =>
      FeeId(
          studentFeeId: studentFeeId ?? this.studentFeeId,
          collected: collected ?? this.collected,
          feeOrder: feeOrder ?? this.feeOrder,
          amountBeforeDiscount:
              amountBeforeDiscount ?? this.amountBeforeDiscount,
          couponId: couponId ?? this.couponId);

  factory FeeId.fromJson(Map<String, dynamic> json) => _$FeeIdFromJson(json);

  Map<String, dynamic> toJson() => _$FeeIdToJson(this);

  @override
  FeeId restore(FeeIdModelRequest data) {
    // TODO: implement restore
    return FeeId(
        collected: data.collected,
        feeOrder: data.feeOrder,
        studentFeeId: data.studentFeeId,
        amountBeforeDiscount: amountBeforeDiscount,
        couponId: couponId);
  }
}
