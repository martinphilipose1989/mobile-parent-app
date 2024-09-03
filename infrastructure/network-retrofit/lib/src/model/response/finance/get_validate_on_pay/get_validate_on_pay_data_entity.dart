import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:network_retrofit/src/model/response/finance/get_validate_on_pay/get_validate_on_pay_cheque_in_favour_details_entity.dart';
import 'package:network_retrofit/src/model/response/finance/get_validate_on_pay/get_validate_on_pay_last_transaction_entity.dart';

part 'get_validate_on_pay_data_entity.g.dart';

@JsonSerializable()
class GetValidateOnPayDataEntity extends BaseLayerDataTransformer<
    GetValidateOnPayDataEntity, GetValidateOnPayDataModel> {
  @JsonKey(name: "validation_status")
  final bool? validationStatus;
  @JsonKey(name: "chequeInFavourDetails")
  final GetValidateOnPayChequeInFavourDetailsEntity? chequeInFavourDetails;
  @JsonKey(name: "lastTransactionDetail")
  final LastTransactionDetail? lastTransactionDetail;

  GetValidateOnPayDataEntity({
    this.validationStatus,
    this.chequeInFavourDetails,
    this.lastTransactionDetail,
  });

  factory GetValidateOnPayDataEntity.fromJson(Map<String, dynamic> json) =>
      _$GetValidateOnPayDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetValidateOnPayDataEntityToJson(this);

  @override
  GetValidateOnPayDataModel transform() {
    return GetValidateOnPayDataModel(
      lastTransactionDetailModel: lastTransactionDetail?.transform(),
      validationStatus: validationStatus,
      chequeInFavourDetails: chequeInFavourDetails?.transform(),
    );
  }
}
