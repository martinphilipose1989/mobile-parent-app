import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:network_retrofit/src/model/response/finance/get_transaction_type/fee_details_entity.dart';

part 'get_transaction_type_datum.g.dart';

@JsonSerializable()
class GetTransactionTypeDatum extends BaseLayerDataTransformer<
    GetTransactionTypeDatum, GetTransactionTypeDatumModel> {
  @JsonKey(name: "payment_id")
  final int? paymentId;
  @JsonKey(name: "student_fee_id")
  final int? studentFeeId;
  @JsonKey(name: "transaction_id")
  final int? transactionId;
  @JsonKey(name: "paid_amount")
  final String? paidAmount;
  @JsonKey(name: "payment_status")
  final int? paymentStatus;
  @JsonKey(name: "fee_id")
  final int? feeId;
  @JsonKey(name: "fee_amount")
  final String? feeAmount;
  @JsonKey(name: "paid")
  final String? paid;
  @JsonKey(name: "pending")
  final String? pending;
  @JsonKey(name: "adjustment")
  final String? adjustment;
  @JsonKey(name: "w_off")
  final String? wOff;
  @JsonKey(name: "discount")
  final String? discount;
  @JsonKey(name: "due_date")
  final DateTime? dueDate;
  @JsonKey(name: "tax_1")
  final String? tax1;
  @JsonKey(name: "tax_2")
  final String? tax2;
  @JsonKey(name: "tax_3")
  final String? tax3;
  @JsonKey(name: "fee_type")
  final String? feeType;
  @JsonKey(name: "feeDetails")
  final FeeDetailsEntity? feeDetails;
  @JsonKey(name: "fee_url_key")
  final String? feeUrlKey;

  GetTransactionTypeDatum(
      {this.paymentId,
      this.studentFeeId,
      this.transactionId,
      this.paidAmount,
      this.paymentStatus,
      this.feeId,
      this.feeAmount,
      this.paid,
      this.pending,
      this.adjustment,
      this.wOff,
      this.discount,
      this.dueDate,
      this.tax1,
      this.tax2,
      this.tax3,
      this.feeType,
      this.feeDetails,
      this.feeUrlKey});

  factory GetTransactionTypeDatum.fromJson(Map<String, dynamic> json) =>
      _$GetTransactionTypeDatumFromJson(json);

  Map<String, dynamic> toJson() => _$GetTransactionTypeDatumToJson(this);

  @override
  GetTransactionTypeDatumModel transform() {
    return GetTransactionTypeDatumModel(
        adjustment: adjustment,
        discount: discount,
        dueDate: dueDate,
        feeAmount: feeAmount,
        feeDetailsModel: feeDetails!.transform(),
        feeId: feeId,
        feeType: feeType,
        paid: paid,
        paidAmount: paidAmount,
        paymentId: paymentId,
        paymentStatus: paymentStatus,
        pending: pending,
        studentFeeId: studentFeeId,
        tax1: tax1,
        tax2: tax2,
        tax3: tax3,
        transactionId: transactionId,
        wOff: wOff,
        feeUrlKey: feeUrlKey);
  }
}
