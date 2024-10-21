import 'package:data/data.dart';
import 'package:network_retrofit/src/model/response/subject_selection/subject_detail_element_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subject_detail_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class SubjectDetailEntity extends BaseLayerDataTransformer<SubjectDetailEntity,SubjectDetail>{
  @JsonKey(name:'_id')
  String? id;
  @JsonKey(name:'enquiryId')
  String? enquiryId;
  @JsonKey(name:'subject_details')
  List<SubjectDetailElementEntity>? subjectDetails;
  @JsonKey(name:'opted_for_transport')
  bool? optedForTransport;
  @JsonKey(name:'transport_details')
  dynamic transportDetails;
  @JsonKey(name:'opted_for_cafeteria')
  bool? optedForCafeteria;
  @JsonKey(name:'cafeteria_details')
  dynamic cafeteriaDetails;
  @JsonKey(name:'opted_for_hostel')
  bool? optedForHostel;
  @JsonKey(name:'hostel_details')
  dynamic hostelDetails;
  @JsonKey(name:'opted_for_kids_club')
  bool? optedForKidsClub;
  @JsonKey(name:'kids_club_details')
  dynamic kidsClubDetails;
  @JsonKey(name:'opted_for_psa')
  bool? optedForPsa;
  @JsonKey(name:'psa_details')
  dynamic psaDetails;
  @JsonKey(name:'total_amount')
  int? totalAmount;
  @JsonKey(name:'admission_approval_status')
  String? admissionApprovalStatus;
  @JsonKey(name:'is_admitted')
  bool? isAdmitted;
  @JsonKey(name:'admission_fees_paid')
  bool? admissionFeesPaid;
  @JsonKey(name:'admitted_at')
  dynamic admittedAt;
  @JsonKey(name:'created_at')
  DateTime? createdAt;
  @JsonKey(name:'updated_at')
  DateTime? updatedAt;
  @JsonKey(name:'__v')
  int? v;

  SubjectDetailEntity({
    this.id,
    this.enquiryId,
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
    this.totalAmount,
    this.admissionApprovalStatus,
    this.isAdmitted,
    this.admissionFeesPaid,
    this.admittedAt,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory SubjectDetailEntity.fromJson(Map<String, dynamic> json) => _$SubjectDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectDetailEntityToJson(this);

  @override
  SubjectDetail transform() {
    SubjectDetail subjectDetail = SubjectDetail();
    subjectDetail.id = id;
    subjectDetail.enquiryId = enquiryId;
    subjectDetail.subjectDetails = subjectDetails?.map((e) => e.transform()).toList();
    subjectDetail.optedForTransport = optedForTransport;
    subjectDetail.transportDetails = transportDetails;
    subjectDetail.optedForCafeteria = optedForCafeteria;
    subjectDetail.cafeteriaDetails = cafeteriaDetails;
    subjectDetail.optedForHostel = optedForHostel;
    subjectDetail.hostelDetails = hostelDetails;
    subjectDetail.optedForKidsClub = optedForKidsClub;
    subjectDetail.kidsClubDetails = kidsClubDetails;
    subjectDetail.optedForPsa = optedForPsa;
    subjectDetail.psaDetails = psaDetails;
    subjectDetail.totalAmount = totalAmount;
    subjectDetail.admissionApprovalStatus = admissionApprovalStatus;
    subjectDetail.isAdmitted = isAdmitted;
    subjectDetail.admissionFeesPaid = admissionFeesPaid;
    subjectDetail.admittedAt = admittedAt;
    subjectDetail.createdAt = createdAt;
    subjectDetail.updatedAt = updatedAt;
    subjectDetail.v = v;
    return subjectDetail;
  }
}