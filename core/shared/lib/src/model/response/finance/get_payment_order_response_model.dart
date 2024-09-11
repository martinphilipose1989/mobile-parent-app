class GetPaymentOrderResponseModel {
  int? status;
  GetPaymentOrderDataResponseModel? data;
  String? message;

  GetPaymentOrderResponseModel({
    this.status,
    this.data,
    this.message,
  });
}

class GetPaymentOrderDataResponseModel {
  GetPaymentOrderOrderResponseModel? order;
  String? paymentLink;

  GetPaymentOrderDataResponseModel({
    this.order,
    this.paymentLink,
  });
}

class GetPaymentOrderOrderResponseModel {
  int? amount;
  int? amountDue;
  int? amountPaid;
  int? attempts;
  int? createdAt;
  String? currency;
  String? entity;
  String? id;
  Notes? notes;
  dynamic offerId;
  String? receipt;
  String? status;

  GetPaymentOrderOrderResponseModel({
    this.amount,
    this.amountDue,
    this.amountPaid,
    this.attempts,
    this.createdAt,
    this.currency,
    this.entity,
    this.id,
    this.notes,
    this.offerId,
    this.receipt,
    this.status,
  });
}

class Notes {
  String? customerContact;
  String? customerEmail;
  String? customerName;
  String? lobId;
  String? studentFees;
  String? totalAmountWithCharge;
  String? userId;

  Notes({
    this.customerContact,
    this.customerEmail,
    this.customerName,
    this.lobId,
    this.studentFees,
    this.totalAmountWithCharge,
    this.userId,
  });
}
