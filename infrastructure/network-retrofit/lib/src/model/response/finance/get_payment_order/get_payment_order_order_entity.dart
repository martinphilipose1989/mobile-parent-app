import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:network_retrofit/src/model/response/finance/get_payment_order/get_payment_order_notes_entity.dart';

part 'get_payment_order_order_entity.g.dart';

@JsonSerializable()
class GetPaymentOrderOrderEntity extends BaseLayerDataTransformer<
    GetPaymentOrderOrderEntity, GetPaymentOrderOrderResponseModel> {
  @JsonKey(name: "amount")
  int? amount;
  @JsonKey(name: "amount_due")
  int? amountDue;
  @JsonKey(name: "amount_paid")
  int? amountPaid;
  @JsonKey(name: "attempts")
  int? attempts;
  @JsonKey(name: "created_at")
  int? createdAt;
  @JsonKey(name: "currency")
  String? currency;
  @JsonKey(name: "entity")
  String? entity;
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "notes")
  GetPaymentOrderNotesEntity? notes;
  @JsonKey(name: "offer_id")
  dynamic offerId;
  @JsonKey(name: "receipt")
  String? receipt;
  @JsonKey(name: "status")
  String? status;

  GetPaymentOrderOrderEntity({
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

  factory GetPaymentOrderOrderEntity.fromJson(Map<String, dynamic> json) =>
      _$GetPaymentOrderOrderEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetPaymentOrderOrderEntityToJson(this);

  @override
  GetPaymentOrderOrderResponseModel transform() {
    // TODO: implement transform
    return GetPaymentOrderOrderResponseModel(
        amount: amount,
        amountDue: amountDue,
        amountPaid: amountPaid,
        attempts: attempts,
        createdAt: createdAt,
        currency: currency,
        entity: entity,
        id: id,
        notes: notes?.transform(),
        offerId: offerId,
        receipt: receipt,
        status: status);
  }
}
