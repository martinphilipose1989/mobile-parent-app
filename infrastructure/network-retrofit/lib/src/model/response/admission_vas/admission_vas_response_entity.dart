// To parse this JSON data, do
//
//     final admissionVasDetailsResponseEntity = admissionVasDetailsResponseEntityFromJson(jsonString);

import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'admission_vas_response_entity.g.dart';

AdmissionVasDetailsResponseEntity admissionVasDetailsResponseEntityFromJson(
        String str) =>
    AdmissionVasDetailsResponseEntity.fromJson(json.decode(str));

String admissionVasDetailsResponseEntityToJson(
        AdmissionVasDetailsResponseEntity data) =>
    json.encode(data.toJson());

@JsonSerializable()
class AdmissionVasDetailsResponseEntity
    implements
        BaseLayerDataTransformer<AdmissionVasDetailsResponseEntity,
            AdmissionVasDetailsResponse> {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "data")
  AdmissionVasDetailsDataEntity? data;
  @JsonKey(name: "message")
  String? message;

  AdmissionVasDetailsResponseEntity({this.status, this.data, this.message});

  factory AdmissionVasDetailsResponseEntity.fromJson(
          Map<String, dynamic> json) =>
      _$AdmissionVasDetailsResponseEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AdmissionVasDetailsResponseEntityToJson(this);

  @override
  AdmissionVasDetailsResponseEntity restore(AdmissionVasDetailsResponse data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  AdmissionVasDetailsResponse transform() {
    return AdmissionVasDetailsResponse(
        message: message, status: status, data: data?.transform());
  }
}

@JsonSerializable()
class AdmissionVasDetailsDataEntity
    implements
        BaseLayerDataTransformer<AdmissionVasDetailsDataEntity,
            AdmissionVasDetailsData> {
  @JsonKey(name: "enquiry_id")
  String? enquiryId;
  @JsonKey(name: "enrolment_number")
  dynamic enrolmentNumber;
  @JsonKey(name: "gr_number")
  dynamic grNumber;
  @JsonKey(name: "subject_details")
  List<dynamic>? subjectDetails;
  @JsonKey(name: "opted_for_transport")
  bool? optedForTransport;
  @JsonKey(name: "transport_details")
  dynamic transportDetails;
  @JsonKey(name: "opted_for_cafeteria")
  bool? optedForCafeteria;
  @JsonKey(name: "cafeteria_details")
  dynamic cafeteriaDetails;
  @JsonKey(name: "opted_for_hostel")
  bool? optedForHostel;
  @JsonKey(name: "hostel_details")
  dynamic hostelDetails;
  @JsonKey(name: "opted_for_kids_club")
  bool? optedForKidsClub;
  @JsonKey(name: "kids_club_details")
  KidsClubDetailsEntity? kidsClubDetails;
  @JsonKey(name: "opted_for_psa")
  bool? optedForPsa;
  @JsonKey(name: "psa_details")
  dynamic psaDetails;
  @JsonKey(name: "opted_for_summer_camp")
  bool? optedForSummerCamp;
  @JsonKey(name: "summer_camp_details")
  dynamic summerCampDetails;
  @JsonKey(name: "total_amount")
  int? totalAmount;
  @JsonKey(name: "admission_approval_status")
  String? admissionApprovalStatus;
  @JsonKey(name: "is_admitted")
  bool? isAdmitted;
  @JsonKey(name: "admission_fees_paid")
  bool? admissionFeesPaid;
  @JsonKey(name: "admitted_at")
  dynamic admittedAt;
  @JsonKey(name: "payment_details")
  dynamic paymentDetails;
  @JsonKey(name: "admission_fee_request_triggered")
  bool? admissionFeeRequestTriggered;

  AdmissionVasDetailsDataEntity({
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

  factory AdmissionVasDetailsDataEntity.fromJson(Map<String, dynamic> json) =>
      _$AdmissionVasDetailsDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AdmissionVasDetailsDataEntityToJson(this);

  @override
  AdmissionVasDetailsDataEntity restore(AdmissionVasDetailsData data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  AdmissionVasDetailsData transform() {
    return AdmissionVasDetailsData(
        admissionApprovalStatus: admissionApprovalStatus,
        admissionFeeRequestTriggered: admissionFeeRequestTriggered,
        admissionFeesPaid: admissionFeesPaid,
        admittedAt: admittedAt,
        cafeteriaDetails: cafeteriaDetails,
        enquiryId: enquiryId,
        enrolmentNumber: enrolmentNumber,
        grNumber: grNumber,
        hostelDetails: hostelDetails,
        isAdmitted: isAdmitted,
        kidsClubDetails: kidsClubDetails?.transform(),
        optedForCafeteria: optedForCafeteria,
        optedForHostel: optedForHostel,
        optedForKidsClub: optedForKidsClub,
        optedForPsa: optedForPsa,
        optedForSummerCamp: optedForSummerCamp,
        transportDetails: transportDetails,
        optedForTransport: optedForTransport,
        paymentDetails: paymentDetails,
        psaDetails: psaDetails,
        subjectDetails: subjectDetails,
        summerCampDetails: summerCampDetails,
        totalAmount: totalAmount);
  }
}

@JsonSerializable()
class KidsClubDetailsEntity
    implements
        BaseLayerDataTransformer<KidsClubDetailsEntity, KidsClubDetails> {
  @JsonKey(name: "type")
  int? type;
  @JsonKey(name: "period_of_service")
  int? periodOfService;
  @JsonKey(name: "month")
  int? month;
  @JsonKey(name: "cafeteria_opt_for")
  int? cafeteriaOptFor;
  @JsonKey(name: "amount")
  int? amount;

  KidsClubDetailsEntity(
      {this.type,
      this.periodOfService,
      this.month,
      this.cafeteriaOptFor,
      this.amount});

  factory KidsClubDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$KidsClubDetailsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$KidsClubDetailsEntityToJson(this);

  @override
  KidsClubDetailsEntity restore(KidsClubDetails data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  KidsClubDetails transform() {
    return KidsClubDetails(
        type: type,
        periodOfService: periodOfService,
        month: month,
        cafeteriaOptFor: cafeteriaOptFor,
        amount: amount);
  }
}
