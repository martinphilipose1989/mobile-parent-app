import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'get_validate_on_pay_cheque_in_favour_details_entity.g.dart';

@JsonSerializable()
class GetValidateOnPayChequeInFavourDetailsEntity
    extends BaseLayerDataTransformer<
        GetValidateOnPayChequeInFavourDetailsEntity, ChequeInFavourDetails> {
  @JsonKey(name: "cheque_in_favour_id")
  final int? chequeInFavourId;
  @JsonKey(name: "cheque_in_favour")
  final String? chequeInFavour;

  GetValidateOnPayChequeInFavourDetailsEntity({
    this.chequeInFavourId,
    this.chequeInFavour,
  });

  factory GetValidateOnPayChequeInFavourDetailsEntity.fromJson(
          Map<String, dynamic> json) =>
      _$GetValidateOnPayChequeInFavourDetailsEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetValidateOnPayChequeInFavourDetailsEntityToJson(this);

  @override
  ChequeInFavourDetails transform() {
    return ChequeInFavourDetails(
      chequeInFavour: chequeInFavour,
      chequeInFavourId: chequeInFavourId,
    );
  }
}
