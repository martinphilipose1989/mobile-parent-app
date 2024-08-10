import 'package:shared/shared.dart';

class BankDetails extends BaseDetails{
    String? ifscCode;
    String? bankName;
    String? branchName;
    String? accountHolderName;
    String? accountType;
    String? accountNumber;

    BankDetails({
        this.ifscCode,
        this.bankName,
        this.branchName,
        this.accountHolderName,
        this.accountType,
        this.accountNumber,
    });

}