class CreateBearerRequest {
  CreateBearerRequesData? data;

  CreateBearerRequest({this.data});
}

class CreateBearerRequesData {
  String? firstName;

  String? lastName;

  String? profileImage;

  CreateBearerRequesData({this.firstName, this.lastName, this.profileImage});
}
