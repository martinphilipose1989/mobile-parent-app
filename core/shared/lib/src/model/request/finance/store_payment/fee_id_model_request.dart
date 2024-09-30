class FeeIdModelRequest {
  final int studentFeeId;
  final int collected;
  final int feeOrder;
  final int? amountBeforeDiscount;
  final String? couponId;

  FeeIdModelRequest(
      {required this.studentFeeId,
      required this.collected,
      required this.feeOrder,
      this.amountBeforeDiscount,
      this.couponId});

  FeeIdModelRequest copyWith(
          {int? studentFeeId,
          int? collected,
          int? feeOrder,
          int? amountBeforeDiscount,
          String? couponId}) =>
      FeeIdModelRequest(
          studentFeeId: studentFeeId ?? this.studentFeeId,
          collected: collected ?? this.collected,
          feeOrder: feeOrder ?? this.feeOrder,
          amountBeforeDiscount:
              amountBeforeDiscount ?? this.amountBeforeDiscount,
          couponId: couponId ?? this.couponId);
}
