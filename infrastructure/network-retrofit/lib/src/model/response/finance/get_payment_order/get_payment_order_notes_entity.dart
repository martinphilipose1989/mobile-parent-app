import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'get_payment_order_notes_entity.g.dart';

@JsonSerializable()
class GetPaymentOrderNotesEntity
    extends BaseLayerDataTransformer<GetPaymentOrderNotesEntity, Notes> {
  @JsonKey(name: "customer_contact")
  String? customerContact;
  @JsonKey(name: "customer_email")
  String? customerEmail;
  @JsonKey(name: "customer_name")
  String? customerName;
  @JsonKey(name: "lob_id")
  String? lobId;
  @JsonKey(name: "student_fees")
  String? studentFees;
  @JsonKey(name: "total_amount_with_charge")
  String? totalAmountWithCharge;
  @JsonKey(name: "userId")
  String? userId;

  GetPaymentOrderNotesEntity({
    this.customerContact,
    this.customerEmail,
    this.customerName,
    this.lobId,
    this.studentFees,
    this.totalAmountWithCharge,
    this.userId,
  });

  factory GetPaymentOrderNotesEntity.fromJson(Map<String, dynamic> json) =>
      _$GetPaymentOrderNotesEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetPaymentOrderNotesEntityToJson(this);

  @override
  Notes transform() {
    // TODO: implement transform
    return Notes(
        customerContact: customerContact,
        customerEmail: customerEmail,
        customerName: customerName,
        lobId: lobId,
        studentFees: studentFees,
        totalAmountWithCharge: totalAmountWithCharge,
        userId: userId);
  }
}
