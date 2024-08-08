import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/get_registreation_info/bank_details_entity.dart';

part 'bank_info_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class BankInfoEntity extends BaseLayerDataTransformer<BankInfoEntity,BankInfo>{
    @JsonKey(name: 'status')
    int? status;
    @JsonKey(name: 'data')
    BankDetailsEntity? data;
    @JsonKey(name: 'message')
    String? message;

    BankInfoEntity({
        this.status,
        this.data,
        this.message,
    });

    factory BankInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$BankInfoEntityFromJson(json);

    Map<String, dynamic> toJson() => _$BankInfoEntityToJson(this);

  @override
  BankInfo transform() {
    BankInfo bankInfo =BankInfo();
    bankInfo.status = status;
    bankInfo.data = data?.transform();
    bankInfo.message = message;
    return bankInfo;
  }

}