import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'additional_info_request.g.dart';

@JsonSerializable()
class AdditionalInfoRequest
    extends BaseLayerDataTransformer<AdditionalInfoRequest, AdditionalInfo> {
  @JsonKey(name: "customer_name")
  final String? customerName;
  @JsonKey(name: "customer_contact")
  final String? customerContact;
  @JsonKey(name: "customer_email")
  final String? customerEmail;

  AdditionalInfoRequest({
    this.customerName,
    this.customerContact,
    this.customerEmail,
  });

  factory AdditionalInfoRequest.fromJson(Map<String, dynamic> json) =>
      _$AdditionalInfoRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AdditionalInfoRequestToJson(this);

  @override
  AdditionalInfoRequest restore(AdditionalInfo data) {
    // TODO: implement restore
    return AdditionalInfoRequest(
        customerContact: customerContact,
        customerEmail: customerEmail,
        customerName: customerName);
  }
}
