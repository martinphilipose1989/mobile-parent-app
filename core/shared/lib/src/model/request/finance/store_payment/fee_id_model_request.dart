class FeeIdModelRequest {
  final int studentFeeId;
  final int collected;
  final int feeOrder;

  FeeIdModelRequest({
    required this.studentFeeId,
    required this.collected,
    required this.feeOrder,
  });

  FeeIdModelRequest copyWith({
    int? studentFeeId,
    int? collected,
    int? feeOrder,
  }) =>
      FeeIdModelRequest(
        studentFeeId: studentFeeId ?? this.studentFeeId,
        collected: collected ?? this.collected,
        feeOrder: feeOrder ?? this.feeOrder,
      );
}
