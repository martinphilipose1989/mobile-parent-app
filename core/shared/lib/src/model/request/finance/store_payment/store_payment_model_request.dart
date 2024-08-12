import 'package:shared/src/model/request/finance/store_payment/fee_id_model_request.dart';
import 'package:shared/src/model/request/finance/store_payment/payment_detail_model_request.dart';

class StorePaymentModelRequest {
  final int paymentMode;
  final int paymentAmount;
  final int lobId;
  final int isManualEntry;
  final String manualReceiptNo;
  final String manualReceiptImage;
  final int chequeInFavour;
  final List<FeeIdModelRequest> feeIds;
  final List<PaymentDetailModelRequest> paymentDetails;

  StorePaymentModelRequest(
      {required this.paymentMode,
      required this.paymentAmount,
      required this.lobId,
      required this.feeIds,
      required this.paymentDetails,
      required this.chequeInFavour,
      required this.isManualEntry,
      required this.manualReceiptImage,
      required this.manualReceiptNo});

  StorePaymentModelRequest copyWith({
    int? paymentMode,
    int? paymentAmount,
    int? lobId,
    int? chequeInFavour,
    final int? isManualEntry,
    final String? manualReceiptNo,
    final String? manualReceiptImage,
    List<FeeIdModelRequest>? feeIds,
    List<PaymentDetailModelRequest>? paymentDetails,
  }) =>
      StorePaymentModelRequest(
          paymentMode: paymentMode ?? this.paymentMode,
          paymentAmount: paymentAmount ?? this.paymentAmount,
          lobId: lobId ?? this.lobId,
          feeIds: feeIds ?? this.feeIds,
          paymentDetails: paymentDetails ?? this.paymentDetails,
          chequeInFavour: chequeInFavour ?? this.chequeInFavour,
          isManualEntry: isManualEntry ?? this.isManualEntry,
          manualReceiptImage: manualReceiptImage ?? this.manualReceiptImage,
          manualReceiptNo: manualReceiptNo ?? this.manualReceiptNo);
}
