import 'package:shared/src/model/response/gatepass/create_gate_pass_data_response_model.dart';

class CreateGatepassResponseModel {
  int? status;
  String? message;
  CreateGatePassDataResponseModel? data;
  CreateGatepassResponseModel({
    this.status,
    this.message,
    this.data,
  });
}
