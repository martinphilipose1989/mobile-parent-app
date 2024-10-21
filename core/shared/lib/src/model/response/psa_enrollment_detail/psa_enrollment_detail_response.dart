

import 'package:shared/shared.dart';

class PsaEnrollmentDetailResponseModel{
  String? status;
  String? message;
  PsaEnrollmentDetailModel? data;

  PsaEnrollmentDetailResponseModel({
    this.status,
    this.message,
    this.data,
  });
}