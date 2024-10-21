import 'package:shared/src/model/response/registration_info/bank_detail.dart';
import 'package:shared/src/model/response/registration_info/base_info_detail.dart';

class BankInfo extends BaseInfo<BankDetails>{
    int? status;
    BankDetails? data;
    String? message;

    BankInfo({
        this.status,
        this.data,
        this.message,
    });

}