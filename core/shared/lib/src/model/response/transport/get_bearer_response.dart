class GetBearerListResponse {
  int? status;

  List<BearerResponse>? data;

  String? message;

  GetBearerListResponse({this.status, this.data, this.message});
}

class BearerResponse {
  String? firstName;

  String? middleName;

  String? lastName;

  String? mobileNo;

  String? profileImage;

  BearerResponse(
      {this.firstName,
      this.middleName,
      this.lastName,
      this.mobileNo,
      this.profileImage});
}
