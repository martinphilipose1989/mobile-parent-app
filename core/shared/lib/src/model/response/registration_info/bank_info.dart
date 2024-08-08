import 'package:shared/src/model/response/registration_info/bank_detail.dart';

class BankInfo {
    int? status;
    BankDetails? data;
    String? message;

    BankInfo({
        this.status,
        this.data,
        this.message,
    });

}