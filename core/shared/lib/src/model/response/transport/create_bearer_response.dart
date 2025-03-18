class CreateBearerResponse {
  CreateBearerResponseData? data;

  CreateBearerResponse({this.data});
}

class CreateBearerResponseData {
  int? id;

  CreateBearerResponseAttributes? attributes;

  CreateBearerResponseData({this.id, this.attributes});
}

class CreateBearerResponseAttributes {
  dynamic globalNo;

  String? firstName;

  dynamic middleName;

  String? lastName;

  dynamic address;

  dynamic area;

  dynamic pincode;

  dynamic landline;

  dynamic mobileNo;

  dynamic email;

  dynamic occupationId;

  dynamic organizationId;

  dynamic designationId;

  dynamic qualificationId;

  dynamic isPreferredAddress;

  dynamic isPreferredEmail;

  dynamic isPreferredMobileNo;

  dynamic userId;

  String? createdAt;

  String? updatedAt;

  dynamic globalId;

  dynamic adharNo;

  dynamic panNo;

  dynamic isCustodian;

  dynamic isLegalGuardian;

  dynamic setAsEmergencyContact;

  dynamic uniqueUrlKey;

  String? profileImage;

  CreateBearerResponseAttributes({
    this.globalNo,
    this.firstName,
    this.middleName,
    this.lastName,
    this.address,
    this.area,
    this.pincode,
    this.landline,
    this.mobileNo,
    this.email,
    this.occupationId,
    this.organizationId,
    this.designationId,
    this.qualificationId,
    this.isPreferredAddress,
    this.isPreferredEmail,
    this.isPreferredMobileNo,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.globalId,
    this.adharNo,
    this.panNo,
    this.isCustodian,
    this.isLegalGuardian,
    this.setAsEmergencyContact,
    this.uniqueUrlKey,
    this.profileImage,
  });
}
