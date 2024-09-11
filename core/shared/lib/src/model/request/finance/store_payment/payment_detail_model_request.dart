class PaymentDetailModelRequest {
  final int paymentModeId;
  final int amount;
  final String chequeNo;
  final String chequeDate;
  final String issuerName;
  final String issuerIfsc;
  final dynamic chequeImage;
  final String tokenNo;
  final int? feeId;

  PaymentDetailModelRequest(
      {required this.paymentModeId,
      required this.amount,
      required this.chequeNo,
      required this.chequeDate,
      required this.issuerName,
      required this.issuerIfsc,
      required this.chequeImage,
      required this.tokenNo,
      this.feeId});

  PaymentDetailModelRequest copyWith(
          {int? paymentModeId,
          int? amount,
          String? chequeNo,
          String? chequeDate,
          String? issuerName,
          String? issuerIfsc,
          dynamic chequeImage,
          String? tokenNo,
          int? feeId,
          String? bankName}) =>
      PaymentDetailModelRequest(
          paymentModeId: paymentModeId ?? this.paymentModeId,
          amount: amount ?? this.amount,
          chequeNo: chequeNo ?? this.chequeNo,
          chequeDate: chequeDate ?? this.chequeDate,
          issuerName: issuerName ?? this.issuerName,
          issuerIfsc: issuerIfsc ?? this.issuerIfsc,
          chequeImage: chequeImage ?? this.chequeImage,
          tokenNo: tokenNo ?? this.tokenNo,
          feeId: feeId ?? this.feeId);
}
