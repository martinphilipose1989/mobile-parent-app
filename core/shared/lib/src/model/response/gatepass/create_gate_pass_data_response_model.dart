// ignore_for_file: public_member_api_docs, sort_constructors_first

class CreateGatePassDataResponseModel {
  String? id;
  String? visitorId;
  int? visitorTypeId;
  String? companyName;
  String? pointOfContact;
  String? otherPointOfContact;
  int? purposeOfVisitId;
  String? comingFrom;

  int? guestCount;

  String? issuedDate;

  String? issuedTime;

  String? incomingTime;

  String? outgoingTime;

  String? qrCode;

  String? createdAt;

  String? updatedAt;

  int? v;
  CreateGatePassDataResponseModel({
    this.id,
    this.visitorId,
    this.visitorTypeId,
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
    this.v,
  });
}
