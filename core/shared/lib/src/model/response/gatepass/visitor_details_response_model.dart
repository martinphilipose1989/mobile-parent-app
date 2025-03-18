import 'package:shared/src/model/response/gatepass/visitor_data_model.dart';

class VisitorDetailsResponseModel {
  final int? status;
  final VisitorDataModel? data;
  final String? message;

  VisitorDetailsResponseModel({
    this.status,
    this.data,
    this.message,
  });
}
