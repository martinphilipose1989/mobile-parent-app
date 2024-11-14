import 'package:shared/src/model/response/gatepass/visitor_data_model.dart';

class VisitorListResponseModel {
  final int? status;
  final String? message;
  final VisitorListDataModel? visitorListDataModel;

  VisitorListResponseModel(
      {this.status, this.message, this.visitorListDataModel});
}

class VisitorListDataModel {
  final int? totalCount;
  final List<VisitorDataModel>? visitors;
  final bool? isNextPage;

  VisitorListDataModel({this.visitors, this.totalCount, this.isNextPage});
}
