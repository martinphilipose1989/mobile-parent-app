import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'get_store_payment_datum_entity.g.dart';

@JsonSerializable()
class GetStorePaymentDatumEntity extends BaseLayerDataTransformer<
    GetStorePaymentDatumEntity, GetStorePaymentDatumModel> {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "is_manual_entry")
  final bool? isManualEntry;
  @JsonKey(name: "payment_mode_id")
  final int? paymentModeId;
  @JsonKey(name: "transaction_date")
  final DateTime? transactionDate;
  @JsonKey(name: "instrument_type")
  final int? instrumentType;
  @JsonKey(name: "instrument_number")
  final dynamic instrumentNumber;
  @JsonKey(name: "instrument_date")
  final dynamic instrumentDate;
  @JsonKey(name: "amount")
  final int? amount;
  @JsonKey(name: "acknowledgement_no")
  final String? acknowledgementNo;
  @JsonKey(name: "acknowledgement_date")
  final DateTime? acknowledgementDate;
  @JsonKey(name: "transaction_type")
  final String? transactionType;
  @JsonKey(name: "transaction_charge_amt")
  final int? transactionChargeAmt;
  @JsonKey(name: "transaction_charge_id")
  final dynamic transactionChargeId;
  @JsonKey(name: "total_amount")
  final int? totalAmount;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "currency_id")
  final int? currencyId;
  @JsonKey(name: "exchange_rate")
  final int? exchangeRate;
  @JsonKey(name: "transaction_status")
  final int? transactionStatus;
  @JsonKey(name: "group_id")
  final String? groupId;
  @JsonKey(name: "created_by")
  final int? createdBy;
  @JsonKey(name: "created_on")
  final DateTime? createdOn;
  @JsonKey(name: "school_receipt_no")
  final String? schoolReceiptNo;
  @JsonKey(name: "school_receipt_upload")
  final dynamic schoolReceiptUpload;
  @JsonKey(name: "is_for_oracle")
  final bool? isForOracle;

  GetStorePaymentDatumEntity({
    this.id,
    this.isManualEntry,
    this.paymentModeId,
    this.transactionDate,
    this.instrumentType,
    this.instrumentNumber,
    this.instrumentDate,
    this.amount,
    this.acknowledgementNo,
    this.acknowledgementDate,
    this.transactionType,
    this.transactionChargeAmt,
    this.transactionChargeId,
    this.totalAmount,
    this.description,
    this.currencyId,
    this.exchangeRate,
    this.transactionStatus,
    this.groupId,
    this.createdBy,
    this.createdOn,
    this.schoolReceiptNo,
    this.schoolReceiptUpload,
    this.isForOracle,
  });

  factory GetStorePaymentDatumEntity.fromJson(Map<String, dynamic> json) =>
      _$GetStorePaymentDatumEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetStorePaymentDatumEntityToJson(this);

  @override
  GetStorePaymentDatumModel transform() {
    return GetStorePaymentDatumModel(
        acknowledgementDate: acknowledgementDate,
        acknowledgementNo: acknowledgementNo,
        amount: amount,
        createdBy: createdBy,
        createdOn: createdOn,
        currencyId: currencyId,
        description: description,
        exchangeRate: exchangeRate,
        groupId: groupId,
        id: id,
        instrumentDate: instrumentDate,
        instrumentNumber: instrumentNumber,
        instrumentType: instrumentType,
        isForOracle: isForOracle,
        isManualEntry: isManualEntry,
        paymentModeId: paymentModeId,
        schoolReceiptNo: schoolReceiptNo,
        schoolReceiptUpload: schoolReceiptUpload,
        totalAmount: totalAmount,
        transactionChargeAmt: transactionChargeAmt,
        transactionChargeId: transactionChargeId,
        transactionDate: transactionDate,
        transactionStatus: transactionStatus,
        transactionType: transactionType);
  }
}
