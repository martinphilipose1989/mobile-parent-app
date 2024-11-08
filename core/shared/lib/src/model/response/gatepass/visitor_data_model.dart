// ignore_for_file: public_member_api_docs, sort_constructors_first

class VisitorDataModel {
  String? id;

  String? pointOfContact;

  String? issuedDate;

  String? issuedTime;

  String? incomingTime;

  String? outgoingTime;

  String? visitStatus;

  String? visitorId;

  String? visitorName;

  String? visitorMobile;

  String? visitorEmail;

  String? visitorProfileImage;

  String? purposeOfVisit;

//visitor details related fields
  int? purposeOfVisitId;

  String? comingFrom;

  String? qrCode;

  String? visitorProfileImageImageUrl;

  String? visitorProfileImageFilePath;

  String? visitorType;

  int? guestCount;

  String? gatePassNumber;

  String? vehicleNumber;

  String? studentName;

  VisitorDataModel(
      {this.id,
      this.pointOfContact,
      this.issuedDate,
      this.incomingTime,
      this.outgoingTime,
      this.visitStatus,
      this.visitorId,
      this.visitorName,
      this.visitorMobile,
      this.visitorEmail,
      this.visitorProfileImage,
      this.purposeOfVisit,
      this.purposeOfVisitId,
      this.comingFrom,
      this.qrCode,
      this.visitorProfileImageImageUrl,
      this.visitorProfileImageFilePath,
      this.visitorType = "Parent",
      this.guestCount,
      this.gatePassNumber,
      this.vehicleNumber,
      this.issuedTime,
      this.studentName});

  @override
  String toString() {
    return 'VisitorDataModel(id: $id, pointOfContact: $pointOfContact, issuedDate: $issuedDate, incomingTime: $incomingTime, outgoingTime: $outgoingTime, visitStatus: $visitStatus, visitorId: $visitorId, visitorName: $visitorName, visitorMobile: $visitorMobile, visitorEmail: $visitorEmail, visitorProfileImage: $visitorProfileImage, purposeOfVisit: $purposeOfVisit, purposeOfVisitId: $purposeOfVisitId, comingFrom: $comingFrom, qrCode: $qrCode, visitorProfileImageImageUrl: $visitorProfileImageImageUrl, visitorProfileImageFilePath: $visitorProfileImageFilePath, visitorType: $visitorType, guestCount: $guestCount, gatePassNumber: $gatePassNumber)';
  }
}
