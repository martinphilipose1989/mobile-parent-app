import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:network_retrofit/src/model/response/admin/get_couponse_list/get_coupons_data_entity.dart';

part 'get_coupons_response_entity.g.dart';

@JsonSerializable()
class GetCouponsResponseEntity extends BaseLayerDataTransformer<
    GetCouponsResponseEntity, FetchCouponsListModel> {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "data")
  List<GetCouponsDataEntity>? data;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "success")
  bool? success;

  GetCouponsResponseEntity({
    this.status,
    this.data,
    this.message,
    this.success,
  });

  factory GetCouponsResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$GetCouponsResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetCouponsResponseEntityToJson(this);

  @override
  FetchCouponsListModel transform() {
    return FetchCouponsListModel(
        data: data
            ?.map((e) => FetchCouponsDataModel(
                maxCount: e.maxCount,
                concessionFixedAmount: e.concessionFixedAmount,
                concessionGroupId: e.concessionGroupId,
                concessionMaxAmount: e.concessionMaxAmount,
                concessionPercentage: e.concessionPercentage,
                couponCode: e.couponCode,
                couponOrderNo: e.couponOrderNo,
                couponType: e.couponType,
                description: e.description,
                id: e.id,
                isActiveCoupon: e.isActiveCoupon,
                termsAndConditions: e.termsAndConditions,
                totalCoupon: e.totalCoupon,
                transactionType: e.transactionType,
                userCouponCount: e.userCouponCount))
            .toList(),
        message: message,
        status: status,
        success: success);
  }
}
