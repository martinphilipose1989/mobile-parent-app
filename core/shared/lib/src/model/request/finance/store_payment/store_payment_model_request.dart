import 'package:shared/src/model/request/finance/store_payment/fee_id_model_request.dart';
import 'package:shared/src/model/request/finance/store_payment/payment_detail_model_request.dart';

class StorePaymentModelRequest {
  final int paymentMode;
  final int paymentAmount;
  final int lobId;
  final bool forMobile;
  final int chequeInFavour;
  final List<FeeIdModelRequest> feeIds;
  final List<PaymentDetailModelRequest> paymentDetails;

  StorePaymentModelRequest({
    required this.paymentMode,
    required this.paymentAmount,
    required this.lobId,
    required this.feeIds,
    required this.forMobile,
    required this.paymentDetails,
    required this.chequeInFavour,
  });

  StorePaymentModelRequest copyWith({
    int? paymentMode,
    int? paymentAmount,
    int? lobId,
    int? chequeInFavour,
    bool? forMobile,
    List<FeeIdModelRequest>? feeIds,
    List<PaymentDetailModelRequest>? paymentDetails,
  }) =>
      StorePaymentModelRequest(
        forMobile: forMobile ?? this.forMobile,
        paymentMode: paymentMode ?? this.paymentMode,
        paymentAmount: paymentAmount ?? this.paymentAmount,
        lobId: lobId ?? this.lobId,
        feeIds: feeIds ?? this.feeIds,
        paymentDetails: paymentDetails ?? this.paymentDetails,
        chequeInFavour: chequeInFavour ?? this.chequeInFavour,
      );
}
