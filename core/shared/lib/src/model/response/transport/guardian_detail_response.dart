class GetGuardianListResponse {
  int? status;

  List<GuardiansDetail>? data;

  String? message;

  GetGuardianListResponse({this.status, this.data, this.message});
}

class GuardiansDetail {
  String? firstName;

  String? middleName;

  String? lastName;

  String? mobileNo;

  GuardiansDetail(
      {this.firstName, this.middleName, this.lastName, this.mobileNo});
}
