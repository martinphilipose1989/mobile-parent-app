class StaffListResponseModel {
  int? status;
  List<Staff>? data;
  String? message;

  StaffListResponseModel({
    this.status,
    this.data,
    this.message,
  });

}

class Staff {
  int? userId;
  String? fullName;
  String? firstName;
  String? middleName;
  String? lastName;
  String? mobile;

  Staff({
    this.userId,
    this.fullName,
    this.firstName,
    this.middleName,
    this.lastName,
    this.mobile,
  });

}
