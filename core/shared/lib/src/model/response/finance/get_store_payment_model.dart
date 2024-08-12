class GetStorePaymentModel {
  final int? status;
  final List<GetStorePaymentDatumModel>? data;
  final String? message;

  GetStorePaymentModel({
    this.status,
    this.data,
    this.message,
  });
}

class GetStorePaymentDatumModel {
  final int? id;
  final bool? isManualEntry;
  final int? paymentModeId;
  final DateTime? transactionDate;
  final int? instrumentType;
  final dynamic instrumentNumber;
  final dynamic instrumentDate;
  final int? amount;
  final String? acknowledgementNo;
  final DateTime? acknowledgementDate;
  final String? transactionType;
  final int? transactionChargeAmt;
  final dynamic transactionChargeId;
  final int? totalAmount;
  final String? description;
  final int? currencyId;
  final int? exchangeRate;
  final int? transactionStatus;
  final String? groupId;
  final int? createdBy;
  final DateTime? createdOn;
  final String? schoolReceiptNo;
  final dynamic schoolReceiptUpload;
  final bool? isForOracle;

  GetStorePaymentDatumModel({
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
}
