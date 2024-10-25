import 'package:shared/src/model/response/subject_selection/subject_detail_element.dart';

class SubjectDetail{
  String? id;
  String? enquiryId;
  List<SubjectDetailElement>? subjectDetails;
  bool? optedForTransport;
  dynamic transportDetails;
  bool? optedForCafeteria;
  dynamic cafeteriaDetails;
  bool? optedForHostel;
  dynamic hostelDetails;
  bool? optedForKidsClub;
  dynamic kidsClubDetails;
  bool? optedForPsa;
  dynamic psaDetails;
  int? totalAmount;
  String? admissionApprovalStatus;
  bool? isAdmitted;
  bool? admissionFeesPaid;
  dynamic admittedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
}