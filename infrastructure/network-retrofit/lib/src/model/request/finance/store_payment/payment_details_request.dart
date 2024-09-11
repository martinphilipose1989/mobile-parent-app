import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'payment_details_request.g.dart';

@JsonSerializable()
class PaymentDetail
    extends BaseLayerDataTransformer<PaymentDetail, PaymentDetailModelRequest> {
  @JsonKey(name: "payment_mode_id")
  final int paymentModeId;
  @JsonKey(name: "amount")
  final int amount;
  @JsonKey(name: "cheque_no")
  final String chequeNo;
  @JsonKey(name: "cheque_date")
  final String chequeDate;
  @JsonKey(name: "issuer_name")
  final String issuerName;
  @JsonKey(name: "issuer_ifsc")
  final String issuerIfsc;
  @JsonKey(name: "cheque_image")
  final dynamic chequeImage;
  @JsonKey(name: "token_no")
  final String tokenNo;
  @JsonKey(name: "bank_name")
  final String bankName;
  @JsonKey(name: "fee_id")
  final int? feeId;

  PaymentDetail(
      {required this.paymentModeId,
      required this.amount,
      required this.chequeNo,
      required this.chequeDate,
      required this.issuerName,
      required this.issuerIfsc,
      required this.chequeImage,
      required this.tokenNo,
      required this.bankName,
      this.feeId});

  PaymentDetail copyWith(
          {int? paymentModeId,
          int? amount,
          String? chequeNo,
          String? chequeDate,
          String? issuerName,
          String? issuerIfsc,
          dynamic chequeImage,
          String? tokenNo,
          String? bankName,
          int? feeId}) =>
      PaymentDetail(
          paymentModeId: paymentModeId ?? this.paymentModeId,
          amount: amount ?? this.amount,
          chequeNo: chequeNo ?? this.chequeNo,
          chequeDate: chequeDate ?? this.chequeDate,
          issuerName: issuerName ?? this.issuerName,
          issuerIfsc: issuerIfsc ?? this.issuerIfsc,
          chequeImage: chequeImage ?? this.chequeImage,
          tokenNo: tokenNo ?? this.tokenNo,
          bankName: bankName ?? this.bankName,
          feeId: feeId ?? this.feeId);

  factory PaymentDetail.fromJson(Map<String, dynamic> json) =>
      _$PaymentDetailFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentDetailToJson(this);

  @override
  PaymentDetail restore(PaymentDetailModelRequest data) {
    // TODO: implement restore
    return PaymentDetail(
        amount: data.amount,
        chequeDate: data.chequeDate,
        chequeImage: data.chequeImage,
        chequeNo: data.chequeNo,
        bankName: '',
        issuerIfsc: data.issuerIfsc,
        issuerName: data.issuerName,
        paymentModeId: data.paymentModeId,
        tokenNo: data.tokenNo,
        feeId: data.feeId);
  }
}
