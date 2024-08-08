import 'package:shared/src/model/response/registration_info/medical_details.dart';

class MedicalInfo {
    int? status;
    MedicalDetails? data;
    String? message;

    MedicalInfo({
        this.status,
        this.data,
        this.message,
    });

}