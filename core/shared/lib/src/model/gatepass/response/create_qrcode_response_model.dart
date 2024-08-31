class CreateQrcodeResponseModel {
  int? status;
  CreateQrcodeResponseData? data;
  String? message;

  CreateQrcodeResponseModel({
    this.status,
    this.data,
    this.message,
  });
}

class CreateQrcodeResponseData {
  String? id;
  String? visitorId;
  int? visitorTypeId;
  String? gatepassNumber;
  dynamic companyName;
  dynamic pointOfContact;
  dynamic otherPointOfContact;
  dynamic purposeOfVisitId;
  dynamic comingFrom;
  int? guestCount;
  String? issuedDate;
  String? issuedTime;
  dynamic incomingTime;
  dynamic outgoingTime;
  String? qrCode;
  String? createdAt;
  String? updatedAt;
  int? v;

  CreateQrcodeResponseData(
      {this.id,
      this.visitorId,
      this.visitorTypeId,
      this.gatepassNumber,
      this.companyName,
      this.pointOfContact,
      this.otherPointOfContact,
      this.purposeOfVisitId,
      this.comingFrom,
      this.guestCount,
      this.issuedDate,
      this.issuedTime,
      this.incomingTime,
      this.outgoingTime,
      this.qrCode,
      this.createdAt,
      this.updatedAt,
      this.v});
}
