import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'get_coupons_data_entity.g.dart';

@JsonSerializable()
class GetCouponsDataEntity extends BaseLayerDataTransformer<
    GetCouponsDataEntity, FetchCouponsDataModel> {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "coupon_type")
  String? couponType;
  @JsonKey(name: "concession_percentage")
  int? concessionPercentage;
  @JsonKey(name: "concession_max_amount")
  int? concessionMaxAmount;
  @JsonKey(name: "concession_fixed_amount")
  dynamic concessionFixedAmount;
  @JsonKey(name: "concession_group_id")
  String? concessionGroupId;
  @JsonKey(name: "transaction_type")
  String? transactionType;
  @JsonKey(name: "is_active_coupon")
  bool? isActiveCoupon;
  @JsonKey(name: "coupon_order_no")
  int? couponOrderNo;
  @JsonKey(name: "coupon_code")
  String? couponCode;
  @JsonKey(name: "user_coupon_count")
  int? userCouponCount;
  @JsonKey(name: "total_coupon")
  int? totalCoupon;
  @JsonKey(name: "terms_and_conditions")
  String? termsAndConditions;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "max_count")
  int? maxCount;

  GetCouponsDataEntity(
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
      this.maxCount});

  factory GetCouponsDataEntity.fromJson(Map<String, dynamic> json) =>
      _$GetCouponsDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetCouponsDataEntityToJson(this);

  @override
  FetchCouponsDataModel transform() {
    return FetchCouponsDataModel(
        concessionFixedAmount: concessionFixedAmount,
        concessionGroupId: concessionGroupId,
        concessionMaxAmount: concessionMaxAmount,
        concessionPercentage: concessionPercentage,
        couponCode: couponCode,
        couponOrderNo: couponOrderNo,
        couponType: couponType,
        description: description,
        id: id,
        isActiveCoupon: isActiveCoupon,
        termsAndConditions: termsAndConditions,
        totalCoupon: totalCoupon,
        transactionType: transactionType,
        userCouponCount: userCouponCount,
        maxCount: maxCount);
  }
}
