// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:network_retrofit/src/model/request/finance/store_payment/fee_id_request.dart';
import 'package:network_retrofit/src/model/request/finance/store_payment/payment_details_request.dart';

part 'get_store_payment_request.g.dart';

@JsonSerializable(explicitToJson: true)
class GetStorePaymentRequest extends BaseLayerDataTransformer<
    GetStorePaymentRequest, StorePaymentModelRequest> {
  @JsonKey(name: "payment_mode")
  final int paymentMode;
  @JsonKey(name: "payment_amount")
  final int paymentAmount;
  @JsonKey(name: "cheque_in_favour")
  final int chequeInFavour;
  @JsonKey(name: "lob_id")
  final int lobID;
  @JsonKey(name: "fee_ids")
  final List<FeeId> feeIds;
  @JsonKey(name: "payment_details")
  final List<PaymentDetail> paymentDetails;
  @JsonKey(name: "is_manual_entry")
  final int isManualEntry;
  @JsonKey(name: "manual_receipt_no")
  final String manualReceiptNo;
  @JsonKey(name: "manual_receipt_image")
  final String manualReceiptImage;

  GetStorePaymentRequest(
      {required this.paymentMode,
      required this.paymentAmount,
      required this.chequeInFavour,
      required this.lobID,
      required this.feeIds,
      required this.paymentDetails,
      required this.isManualEntry,
      required this.manualReceiptImage,
      required this.manualReceiptNo});

  factory GetStorePaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$GetStorePaymentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetStorePaymentRequestToJson(this);

  @override
  GetStorePaymentRequest restore(StorePaymentModelRequest data) {
    return GetStorePaymentRequest(
        lobID: data.lobId,
        chequeInFavour: data.chequeInFavour,
        paymentAmount: data.paymentAmount,
        paymentMode: data.paymentMode,
        isManualEntry: data.isManualEntry,
        manualReceiptImage: data.manualReceiptImage,
        manualReceiptNo: data.manualReceiptNo,
        feeIds: data.feeIds
            .map((e) => FeeId(
                studentFeeId: e.studentFeeId,
                collected: e.collected,
                feeOrder: e.feeOrder))
            .toList(),
        paymentDetails: data.paymentDetails
            .map((e) => PaymentDetail(
                amount: e.amount,
                chequeDate: e.chequeDate,
                chequeImage: e.chequeImage,
                chequeNo: e.chequeNo,
                bankName: e.bankName,
                issuerIfsc: e.issuerIfsc,
                issuerName: e.issuerName,
                paymentModeId: e.paymentModeId,
                tokenNo: e.tokenNo))
            .toList());
  }
}
