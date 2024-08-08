import 'package:shared/src/model/response/admission_list/admission_list.dart';

class AdmissionListBaseModel {
    int? status;
    AdmissionListModel? data;
    String? message;

    AdmissionListBaseModel({
        this.status,
        this.data,
        this.message,
    });

}