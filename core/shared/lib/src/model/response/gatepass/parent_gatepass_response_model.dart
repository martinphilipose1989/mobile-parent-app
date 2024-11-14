import 'package:shared/shared.dart';

class ParentGatepassResponseModel {
  int? status;
  ParentGatepassResponseDataModel? data;

  ParentGatepassResponseModel({this.status, this.data});
}

class ParentGatepassResponseDataModel {
  bool? signedIn;
  bool? signedOut;
  VisitorDataModel? visitorDataModel;

  ParentGatepassResponseDataModel(
      {this.visitorDataModel, this.signedIn, this.signedOut});
}
