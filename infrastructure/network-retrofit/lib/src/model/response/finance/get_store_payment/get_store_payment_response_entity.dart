import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:network_retrofit/src/model/response/finance/get_store_payment/get_store_payment_datum_entity.dart';

part 'get_store_payment_response_entity.g.dart';

@JsonSerializable()
class GetStorePaymentResponseEntity extends BaseLayerDataTransformer<
    GetStorePaymentModel, GetStorePaymentModel> {
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "data")
  final List<GetStorePaymentDatumEntity>? data;
  @JsonKey(name: "message")
  final String? message;

  GetStorePaymentResponseEntity({
    this.status,
    this.data,
    this.message,
  });

  factory GetStorePaymentResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$GetStorePaymentResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetStorePaymentResponseEntityToJson(this);

  @override
  GetStorePaymentModel transform() {
    return GetStorePaymentModel(
        message: message,
        data: data!
            .map((e) => GetStorePaymentDatumModel(
                acknowledgementDate: e.acknowledgementDate,
                acknowledgementNo: e.acknowledgementNo,
                amount: e.amount,
                createdBy: e.createdBy,
                createdOn: e.createdOn,
                currencyId: e.currencyId,
                description: e.description,
                exchangeRate: e.exchangeRate,
                groupId: e.groupId,
                id: e.id,
                instrumentDate: e.instrumentDate,
                instrumentNumber: e.instrumentNumber,
                instrumentType: e.instrumentType,
                isForOracle: e.isForOracle,
                isManualEntry: e.isManualEntry,
                paymentModeId: e.paymentModeId,
                schoolReceiptNo: e.schoolReceiptNo,
                schoolReceiptUpload: e.schoolReceiptUpload,
                totalAmount: e.totalAmount,
                transactionChargeAmt: e.transactionChargeAmt,
                transactionChargeId: e.transactionChargeId,
                transactionDate: e.transactionDate,
                transactionStatus: e.transactionStatus,
                transactionType: e.transactionType))
            .toList(),
        status: status);
  }
}
