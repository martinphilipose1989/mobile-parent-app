import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transaction
    extends BaseLayerDataTransformer<Transaction, TransactionModel> {
  @JsonKey(name: "details_customer_bank_name")
  final String? detailsCustomerBankName;
  @JsonKey(name: "details_pg_transactionid")
  final String? detailsPgTransactionid;
  @JsonKey(name: "transaction_id")
  final int? transactionId;
  @JsonKey(name: "transaction_date")
  final String? transactionDate;
  @JsonKey(name: "customer_name")
  final String? customerName;
  @JsonKey(name: "payment_mode_id")
  final int? paymentModeId;
  @JsonKey(name: "transaction_status")
  final int? transactionStatus;
  @JsonKey(name: "acknowledgement_no")
  final String? acknowledgementNo;
  @JsonKey(name: "acknowledgement_date")
  final String? acknowledgementDate;
  @JsonKey(name: "receipt_number")
  final String? receiptNumber;
  @JsonKey(name: "receipt_date")
  final String? receiptDate;
  @JsonKey(name: "total_amount")
  final String? totalAmount;
  @JsonKey(name: "transaction_amount")
  final String? transactionAmount;
  @JsonKey(name: "transaction_charges")
  final String? transactionCharges;
  @JsonKey(name: "received_on")
  final dynamic receivedOn;
  @JsonKey(name: "currency_id")
  final int? currencyId;
  @JsonKey(name: "exchange_rate")
  final String? exchangeRate;
  @JsonKey(name: "posted_amount")
  final String? postedAmount;
  @JsonKey(name: "payment_mode")
  final String? paymentMode;
  @JsonKey(name: "transaction_url_key")
  final String? transactionUrlKey;

  Transaction(
      {this.detailsCustomerBankName,
      this.detailsPgTransactionid,
      this.transactionId,
      this.transactionDate,
      this.customerName,
      this.paymentModeId,
      this.transactionStatus,
      this.acknowledgementNo,
      this.acknowledgementDate,
      this.receiptNumber,
      this.receiptDate,
      this.totalAmount,
      this.transactionAmount,
      this.transactionCharges,
      this.receivedOn,
      this.currencyId,
      this.exchangeRate,
      this.postedAmount,
      this.paymentMode,
      this.transactionUrlKey});

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);

  @override
  TransactionModel transform() {
    // TODO: implement transform
    return TransactionModel(
        acknowledgementDate: acknowledgementDate,
        acknowledgementNo: acknowledgementNo,
        currencyId: currencyId,
        customerName: customerName,
        detailsCustomerBankName: detailsCustomerBankName,
        detailsPgTransactionid: detailsPgTransactionid,
        exchangeRate: exchangeRate,
        paymentModeId: paymentModeId,
        postedAmount: postedAmount,
        receiptDate: receiptDate,
        receiptNumber: receiptNumber,
        receivedOn: receivedOn,
        totalAmount: totalAmount,
        transactionAmount: transactionAmount,
        transactionCharges: transactionCharges,
        transactionDate: transactionDate,
        transactionId: transactionId,
        paymentMode: paymentMode,
        transactionStatus: transactionStatus,
        transactionUrlKey: transactionUrlKey);
  }
}
