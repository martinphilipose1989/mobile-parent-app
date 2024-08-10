import 'package:shared/src/model/response/registration_info/base_info_detail.dart';
import 'package:shared/src/model/response/registration_info/medical_details.dart';

class MedicalInfo extends BaseInfo<MedicalDetails>{
    int? status;
    MedicalDetails? data;
    String? message;

    MedicalInfo({
        this.status,
        this.data,
        this.message,
    });

}