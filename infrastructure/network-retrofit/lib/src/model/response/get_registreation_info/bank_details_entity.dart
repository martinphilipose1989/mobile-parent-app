import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bank_details_entity.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: false)
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
    @JsonKey(name: 'upiInfo')
    String? upiInfo;

    BankDetailsEntity({
        this.ifscCode,
        this.bankName,
        this.branchName,
        this.accountHolderName,
        this.accountType,
        this.accountNumber,
      this.upiInfo
    });

    factory BankDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$BankDetailsEntityFromJson(json);


  Map<String,dynamic> toJson() => {
    'ifsc': ifscCode,
    'bank_name': bankName,
    'branch_name': branchName,
    'account_holder_name': accountHolderName,
    'account_type': accountType,
    'account_number': accountNumber,
    'upi': upiInfo,
  };

  @override
  BankDetails transform() {
    BankDetails bankDetails =BankDetails();
    bankDetails.ifscCode = ifscCode;
    bankDetails.bankName = bankName;
    bankDetails.branchName = branchName;
    bankDetails.accountHolderName = accountHolderName;
    bankDetails.accountType = accountType;
    bankDetails.accountNumber = accountNumber;
    bankDetails.upiInfo=upiInfo;
    return bankDetails;
  }

  @override
  BankDetailsEntity restore(BankDetails data) {
    BankDetailsEntity bankDetailsEntity = BankDetailsEntity(
      ifscCode: data.ifscCode,
      bankName: data.bankName,
      branchName: data.branchName,
      accountHolderName: data.accountHolderName,
      accountType: data.accountType,
      accountNumber: data.accountNumber,
      upiInfo: data.upiInfo,  
    );
    
    return bankDetailsEntity;
  }

}