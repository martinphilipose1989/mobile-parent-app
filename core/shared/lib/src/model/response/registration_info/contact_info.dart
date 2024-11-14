import 'package:shared/src/model/response/registration_info/base_info_detail.dart';
import 'package:shared/src/model/response/registration_info/contact_details.dart';

class ContactInfo extends BaseInfo<ContactDetails>{
    int? status;
    ContactDetails? data;
    String? message;

    ContactInfo({
        this.status,
        this.data,
        this.message,
    });

}