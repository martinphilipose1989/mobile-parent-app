import 'package:shared/src/model/response/finance/get_transaction_type_model.dart';

class GetTransactiontypefeesCollectedModel {
  final int? status;
  final GetTransactiontypefeesCollectedData? data;
  final String? message;

  GetTransactiontypefeesCollectedModel({
    this.status,
    this.data,
    this.message,
  });
}

class GetTransactiontypefeesCollectedData {
  final List<TransactionModel>? transactions;
  final PaymentModesModel? paymentModes;

  GetTransactiontypefeesCollectedData({
    this.transactions,
    this.paymentModes,
  });
}

class PaymentModesModel {
  final The1Model? the1;
  final The1Model? the2;
  final The1Model? the3;
  final The1Model? the4;
  final The1Model? the7;
  final The1Model? the8;
  final The1Model? the9;
  final The1Model? the10;
  final The1Model? the11;
  final The1Model? the12;
  final The1Model? the13;
  final The1Model? the14;
  final The1Model? the15;
  final The1Model? the16;
  final The1Model? the17;

  PaymentModesModel({
    this.the1,
    this.the2,
    this.the3,
    this.the4,
    this.the7,
    this.the8,
    this.the9,
    this.the10,
    this.the11,
    this.the12,
    this.the13,
    this.the14,
    this.the15,
    this.the16,
    this.the17,
  });
}

class The1Model {
  final int? id;
  final AttributesModel? attributes;

  The1Model({
    this.id,
    this.attributes,
  });
}

class AttributesModel {
  final String? name;
  final int? parentVisible;
  final int? feeCounterVisible;

  AttributesModel({
    this.name,
    this.parentVisible,
    this.feeCounterVisible,
  });
}

class TransactionModel {
  final String? detailsCustomerBankName;
  final String? detailsPgTransactionid;
  final int? transactionId;
  final String? transactionDate;
  final String? customerName;
  final int? paymentModeId;
  final int? transactionStatus;
  final String? acknowledgementNo;
  final String? acknowledgementDate;
  final String? receiptNumber;
  final String? receiptDate;
  final String? totalAmount;
  final String? transactionAmount;
  final String? transactionCharges;
  final dynamic receivedOn;
  final int? currencyId;
  final String? exchangeRate;
  final String? postedAmount;
  final String? paymentMode;
  List<GetTransactionTypeDatumModel>? getTransactiontypefeesCollectedModel;
  final String? transactionUrlKey;

  TransactionModel(
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
      this.getTransactiontypefeesCollectedModel,
      this.transactionUrlKey});
}
