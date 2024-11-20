// ignore_for_file: public_member_api_docs, sort_constructors_first

class VisitorDataModel {
  final String? id;

  final String? pointOfContact;

  final String? issuedDate;

  final String? issuedTime;

  final String? incomingTime;

  final String? outgoingTime;

  final String? visitStatus;

  final String? visitorId;

  final String? visitorName;

  final String? visitorMobile;

  final String? visitorEmail;

  final String? visitorProfileImage;

  final String? purposeOfVisitName;

//visitor details related fields
  final int? purposeOfVisitId;

  final String? comingFrom;

  final String? qrCode;

  final String? visitorProfileImageImageUrl;

  final String? visitorProfileImageFilePath;

  final String? visitorType;

  final int? guestCount;

  final String? gatePassNumber;

  final String? vehicleNumber;

  final String? studentName;

  final String? schoolVisitDate;

  final String? otherPointOfContact;

  final int? visitorTypeId;

  final String? vistDate;

  final String? dateOfVisit;

  VisitorDataModel(
      {required this.id,
      required this.pointOfContact,
      required this.issuedDate,
      required this.issuedTime,
      required this.incomingTime,
      required this.outgoingTime,
      required this.visitStatus,
      required this.visitorId,
      required this.visitorName,
      required this.visitorMobile,
      required this.visitorEmail,
      required this.visitorProfileImage,
      required this.purposeOfVisitName,
      required this.purposeOfVisitId,
      required this.comingFrom,
      required this.qrCode,
      required this.visitorProfileImageImageUrl,
      required this.visitorProfileImageFilePath,
      this.visitorType = "Parent",
      required this.guestCount,
      required this.gatePassNumber,
      required this.vehicleNumber,
      required this.studentName,
      required this.schoolVisitDate,
      required this.otherPointOfContact,
      required this.visitorTypeId,
      required this.vistDate,
      required this.dateOfVisit});

  @override
  String toString() {
    return 'VisitorDataModel(id: $id, pointOfContact: $pointOfContact, issuedDate: $issuedDate, incomingTime: $incomingTime, outgoingTime: $outgoingTime, visitStatus: $visitStatus, visitorId: $visitorId, visitorName: $visitorName, visitorMobile: $visitorMobile, visitorEmail: $visitorEmail, visitorProfileImage: $visitorProfileImage, purposeOfVisitName: $purposeOfVisitName, purposeOfVisitId: $purposeOfVisitId, comingFrom: $comingFrom, qrCode: $qrCode, visitorProfileImageImageUrl: $visitorProfileImageImageUrl, visitorProfileImageFilePath: $visitorProfileImageFilePath, visitorType: $visitorType, guestCount: $guestCount, gatePassNumber: $gatePassNumber)';
  }
}
