// To parse this JSON data, do
//
//     final CreateGatePassRequestEntity = CreateGatePassResponseEntityFromJson(jsonString);

import 'dart:convert';

import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_gatepass_entity.g.dart';

CreateGatePassRequestEntity createGatePassRequestEntityFromJson(String str) =>
    CreateGatePassRequestEntity.fromJson(json.decode(str));

String createGatePassRequestEntityToJson(CreateGatePassRequestEntity data) =>
    json.encode(data.toJson());

@JsonSerializable()
class CreateGatePassRequestEntity
    implements
        BaseLayerDataTransformer<CreateGatePassRequestEntity,
            CreateGatePassModel> {
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "mobile")
  final String? mobile;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "visitor_type_id")
  final int? visitorTypeId;
  @JsonKey(name: "company_name")
  final String? companyName;
  @JsonKey(name: "point_of_contact")
  final String? pointOfContact;
  @JsonKey(name: "other_point_of_contact")
  final String? otherPointOfContact;
  @JsonKey(name: "purpose_of_visit_id")
  final int? purposeOfVisitId;
  @JsonKey(name: "coming_from")
  final String? comingFrom;
  @JsonKey(name: "guest_count")
  final int? guestCount;
  @JsonKey(name: "profile_image")
  final String? profileImage;
  @JsonKey(name: "vehicle_number")
  final String? vehicleNumber;
  @JsonKey(name: "issued_date")
  final String? issuedDate;
  @JsonKey(name: "issued_time")
  final String? issuedTime;
  @JsonKey(name: "session")
  dynamic session;
  @JsonKey(name: "student_name")
  final String? studentName;
  @JsonKey(name: "student_id")
  final int? studentId;
  @JsonKey(name: "school_id")
  final int? schoolId;
  @JsonKey(name: "other_reason")
  final String? otherReason;

  CreateGatePassRequestEntity(
      {required this.name,
      required this.mobile,
      required this.email,
      required this.visitorTypeId,
      required this.companyName,
      required this.pointOfContact,
      required this.otherPointOfContact,
      required this.purposeOfVisitId,
      required this.comingFrom,
      required this.guestCount,
      required this.profileImage,
      required this.vehicleNumber,
      required this.issuedDate,
      required this.issuedTime,
      required this.studentName,
      this.studentId,
      this.schoolId,
      this.otherReason});

  factory CreateGatePassRequestEntity.fromJson(Map<String, dynamic> json) =>
      _$CreateGatePassRequestEntityFromJson(json);

  Map<String, dynamic> toJson() {
    final json = _$CreateGatePassRequestEntityToJson(this);
    if (json['company_name'] == null) {
      json.remove('company_name');
    }
    if (json['vehicle_number'] == null) {
      json.remove('vehicle_number');
    }

    return json;
  }

  @override
  CreateGatePassModel transform() {
    return CreateGatePassModel(
        name: name,
        email: email,
        comingFrom: comingFrom,
        companyName: companyName,
        guestCount: guestCount,
        mobile: mobile,
        otherPointOfContact: otherPointOfContact,
        pointOfContact: pointOfContact,
        profileImage: profileImage,
        purposeOfVisitId: purposeOfVisitId,
        visitorTypeId: visitorTypeId,
        studentId: studentId,
        schoolId: schoolId,
        otherReason: otherReason);
  }

  @override
  CreateGatePassRequestEntity restore(CreateGatePassModel data) {
    return CreateGatePassRequestEntity(
        name: data.name,
        email: data.email,
        comingFrom: data.comingFrom,
        companyName: data.companyName,
        guestCount: data.guestCount,
        mobile: data.mobile,
        otherPointOfContact: data.otherPointOfContact,
        pointOfContact: data.pointOfContact,
        profileImage: data.profileImage,
        purposeOfVisitId: data.purposeOfVisitId,
        visitorTypeId: data.visitorTypeId,
        vehicleNumber: data.vehicleNumber,
        issuedDate: data.issuedDate,
        issuedTime: data.issuedTime,
        studentName: data.studentName,
        studentId: data.studentId,
        schoolId: data.schoolId,
        otherReason: data.otherReason);
  }
}
