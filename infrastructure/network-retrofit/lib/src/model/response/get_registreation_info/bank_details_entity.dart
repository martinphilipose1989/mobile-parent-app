import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bank_details_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class BankDetailsEntity extends BaseLayerDataTransformer<BankDetailsEntity,BankDetails>{
    @JsonKey(name: 'ifscCode')
    String? ifscCode;
    @JsonKey(name: 'bankName')
    String? bankName;
    @JsonKey(name: 'branchName')
    String? branchName;
    @JsonKey(name: 'accountHolderName')
    String? accountHolderName;
    @JsonKey(name: 'accountType')
    String? accountType;
    @JsonKey(name: 'accountNumber')
    String? accountNumber;

    BankDetailsEntity({
        this.ifscCode,
        this.bankName,
        this.branchName,
        this.accountHolderName,
        this.accountType,
        this.accountNumber,
    });

    factory BankDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$BankDetailsEntityFromJson(json);

    Map<String, dynamic> toJson() => _$BankDetailsEntityToJson(this);

  @override
  BankDetails transform() {
    BankDetails bankDetails =BankDetails();
    bankDetails.ifscCode = ifscCode;
    bankDetails.bankName = bankName;
    bankDetails.branchName = branchName;
    bankDetails.accountHolderName = accountHolderName;
    bankDetails.accountType = accountType;
    bankDetails.accountNumber = accountNumber;
    return bankDetails;
  }

}