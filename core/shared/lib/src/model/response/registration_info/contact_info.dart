import 'package:shared/src/model/response/registration_info/contact_details.dart';

class ContactInfo {
    int? status;
    ContactDetails? data;
    String? message;

    ContactInfo({
        this.status,
        this.data,
        this.message,
    });

}