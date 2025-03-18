class FetchCouponsListModel {
  int? status;
  List<FetchCouponsDataModel>? data;
  String? message;
  bool? success;

  FetchCouponsListModel({
    this.status,
    this.data,
    this.message,
    this.success,
  });
}

class FetchCouponsDataModel {
  String? id;
  String? couponType;
  int? concessionPercentage;
  int? concessionMaxAmount;
  int? concessionFixedAmount;
  String? concessionGroupId;
  String? transactionType;
  bool? isActiveCoupon;
  int? couponOrderNo;
  String? couponCode;
  int? userCouponCount;
  int? totalCoupon;
  String? termsAndConditions;
  String? description;
  int? maxCount;
  int appliedCouponCount;

  FetchCouponsDataModel(
      {this.id,
      this.couponType,
      this.concessionPercentage,
      this.concessionMaxAmount,
      this.concessionFixedAmount,
      this.concessionGroupId,
      this.transactionType,
      this.isActiveCoupon,
      this.couponOrderNo,
      this.couponCode,
      this.userCouponCount,
      this.totalCoupon,
      this.termsAndConditions,
      this.description,
      this.maxCount,
      this.appliedCouponCount = 0});
}
