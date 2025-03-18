class PaymentOrderModel {
  final Orders? orders;

  PaymentOrderModel({
    this.orders,
  });
}

class Orders {
  final List<StudentFee>? studentFees;
  final int? amount;
  final String? currency;
  final AdditionalInfo? additionalInfo;
  final Device? device;
  final String? paymentGateway;
  final String? receipt;
  final int? lobId;
  final int? transactionTypeId;
  final int? serviceProviderId;
  final int? paymentModeId;
  final int? bankWalletMerchantId;

  Orders({
    this.studentFees,
    this.amount,
    this.currency,
    this.additionalInfo,
    this.device,
    this.paymentGateway,
    this.receipt,
    this.lobId,
    this.transactionTypeId,
    this.serviceProviderId,
    this.paymentModeId,
    this.bankWalletMerchantId,
  });
}

class AdditionalInfo {
  final String? customerName;
  final String? customerContact;
  final String? customerEmail;

  AdditionalInfo({
    this.customerName,
    this.customerContact,
    this.customerEmail,
  });
}

class Device {
  final String? initChannel;
  final String? ip;
  final String? userAgent;
  final String? acceptHeader;
  final int? browserTz;
  final int? browserColorDepth;
  final bool? browserJavaEnabled;
  final int? browserScreenHeight;
  final int? browserScreenWidth;
  final String? browserLanguage;
  final bool? browserJavascriptEnabled;

  Device({
    this.initChannel,
    this.ip,
    this.userAgent,
    this.acceptHeader,
    this.browserTz,
    this.browserColorDepth,
    this.browserJavaEnabled,
    this.browserScreenHeight,
    this.browserScreenWidth,
    this.browserLanguage,
    this.browserJavascriptEnabled,
  });
}

class StudentFee {
  final dynamic id;
  final int? feeId;
  final String? amount;
  final int? amountBeforeDiscount;
  final String? couponId;

  StudentFee(
      {this.id,
      this.feeId,
      this.amount,
      this.amountBeforeDiscount,
      this.couponId});
}
