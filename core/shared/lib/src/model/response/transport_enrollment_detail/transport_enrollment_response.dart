import 'package:shared/shared.dart';

class TransportEnrollmentResponseModel {
    String? status;
    String? message;
    TransportEnrollmentDetailModel? data;

    TransportEnrollmentResponseModel({
        this.status,
        this.message,
        this.data,
    });

}