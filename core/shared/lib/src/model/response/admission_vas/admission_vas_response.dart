class AdmissionVasDetailsResponse {
  int? status;
  AdmissionVasDetailsData? data;
  String? message;

  AdmissionVasDetailsResponse({
    this.status,
    this.data,
    this.message,
  });
}

class AdmissionVasDetailsData {
  String? enquiryId;
  dynamic enrolmentNumber;
  dynamic grNumber;
  List<dynamic>? subjectDetails;
  bool? optedForTransport;
  dynamic transportDetails;
  bool? optedForCafeteria;
  dynamic cafeteriaDetails;
  bool? optedForHostel;
  dynamic hostelDetails;
  bool? optedForKidsClub;
  KidsClubDetails? kidsClubDetails;
  bool? optedForPsa;
  dynamic psaDetails;
  bool? optedForSummerCamp;
  dynamic summerCampDetails;
  int? totalAmount;
  String? admissionApprovalStatus;
  bool? isAdmitted;
  bool? admissionFeesPaid;
  dynamic admittedAt;
  dynamic paymentDetails;
  bool? admissionFeeRequestTriggered;

  AdmissionVasDetailsData({
    this.enquiryId,
    this.enrolmentNumber,
    this.grNumber,
    this.subjectDetails,
    this.optedForTransport,
    this.transportDetails,
    this.optedForCafeteria,
    this.cafeteriaDetails,
    this.optedForHostel,
    this.hostelDetails,
    this.optedForKidsClub,
    this.kidsClubDetails,
    this.optedForPsa,
    this.psaDetails,
    this.optedForSummerCamp,
    this.summerCampDetails,
    this.totalAmount,
    this.admissionApprovalStatus,
    this.isAdmitted,
    this.admissionFeesPaid,
    this.admittedAt,
    this.paymentDetails,
    this.admissionFeeRequestTriggered,
  });
}

class KidsClubDetails {
  int? type;
  int? periodOfService;
  int? month;
  int? cafeteriaOptFor;
  int? amount;

  KidsClubDetails({
    this.type,
    this.periodOfService,
    this.month,
    this.cafeteriaOptFor,
    this.amount,
  });
}
