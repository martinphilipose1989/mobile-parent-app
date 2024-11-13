class VisitorPopulateResponseModel {
  int? status;
  VisitorPopulateDataModel? data;
  String? message;

  VisitorPopulateResponseModel({this.status, this.data, this.message});
}

class VisitorPopulateDataModel {
  String? id;
  String? visitorId;
  String? name;
  String? mobile;
  String? email;
  String? globalId;
  String? profileImage;
  String? createdAt;
  String? updatedAt;
  int? v;
  String? profileImageUrl;

  VisitorPopulateDataModel(
      {this.id,
      this.visitorId,
      this.name,
      this.mobile,
      this.email,
      this.globalId,
      this.profileImage,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.profileImageUrl});
}
