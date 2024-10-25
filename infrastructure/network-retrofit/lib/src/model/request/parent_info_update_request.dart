// To parse this JSON data, do
//
//     final parentDetailsRequest = parentDetailsRequestFromJson(jsonString);

import 'dart:convert';

import 'package:network_retrofit/network_retrofit.dart';

ParentDetailsRequest parentDetailsRequestFromJson(String str) => ParentDetailsRequest.fromJson(json.decode(str));

String parentDetailsRequestToJson(ParentDetailsRequest data) => json.encode(data.toJson());

class ParentDetailsRequest {
    ParenInfoUpdateRequest? data;

    ParentDetailsRequest({
        this.data,
    });

    factory ParentDetailsRequest.fromJson(Map<String, dynamic> json) => ParentDetailsRequest(
        data: json["data"] == null ? null : ParenInfoUpdateRequest.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
    };
}

class ParenInfoUpdateRequest {
    String? parentDetailsFatherDetailsFirstName;
    String? parentDetailsFatherDetailsLastName;
    String? parentDetailsFatherDetailsAadhar;
    String? parentDetailsFatherDetailsPan;
    String? parentDetailsFatherDetailsQualification;
    String? parentDetailsFatherDetailsOccupation;
    String? parentDetailsFatherDetailsOrganizationName;
    String? parentDetailsFatherDetailsDesignation;
    String? parentDetailsFatherDetailsOfficeAddress;
    String? parentDetailsFatherDetailsArea;
    CommonDataEntity? parentDetailsFatherDetailsCountry;
    String? parentDetailsFatherDetailsPincode;
    CommonDataEntity? parentDetailsFatherDetailsState;
    CommonDataEntity? parentDetailsFatherDetailsCity;
    String? parentDetailsFatherDetailsEmail;
    String? parentDetailsFatherDetailsMobile;
    String? parentDetailsMotherDetailsFirstName;
    String? parentDetailsMotherDetailsLastName;
    String? parentDetailsMotherDetailsAadhar;
    String? parentDetailsMotherDetailsPan;
    String? parentDetailsMotherDetailsQualification;
    String? parentDetailsMotherDetailsOccupation;
    String? parentDetailsMotherDetailsOrganizationName;
    String? parentDetailsMotherDetailsDesignation;
    String? parentDetailsMotherDetailsOfficeAddress;
    String? parentDetailsMotherDetailsArea;
    CommonDataEntity? parentDetailsMotherDetailsCountry;
    String? parentDetailsMotherDetailsPincode;
    CommonDataEntity? parentDetailsMotherDetailsState;
    CommonDataEntity? parentDetailsMotherDetailsCity;
    String? parentDetailsMotherDetailsEmail;
    String? parentDetailsMotherDetailsMobile;
    String? parentDetailsGuardianDetailsFirstName;
    String? parentDetailsGuardianDetailsLastName;
    String? parentDetailsGuardianDetailsEmail;
    String? parentDetailsGuardianDetailsMobile;
    String? parentDetailsGuardianDetailsRelationshipWithChild;
    String? parentDetailsGuardianDetailsAddress;
    String? parentDetailsGuardianDetailsHouse;
    String? parentDetailsGuardianDetailsStreet;
    String? parentDetailsGuardianDetailsLandmark;
    CommonDataEntity? parentDetailsGuardianDetailsCountry;
    String? parentDetailsGuardianDetailsPincode;
    CommonDataEntity? parentDetailsGuardianDetailsState;
    CommonDataEntity? parentDetailsGuardianDetailsCity;
    String? parentDetailsGuardianDetailsAadhar;
    String? parentDetailsGuardianDetailsPan;

    ParenInfoUpdateRequest({
        this.parentDetailsFatherDetailsFirstName,
        this.parentDetailsFatherDetailsLastName,
        this.parentDetailsFatherDetailsAadhar,
        this.parentDetailsFatherDetailsPan,
        this.parentDetailsFatherDetailsQualification,
        this.parentDetailsFatherDetailsOccupation,
        this.parentDetailsFatherDetailsOrganizationName,
        this.parentDetailsFatherDetailsDesignation,
        this.parentDetailsFatherDetailsOfficeAddress,
        this.parentDetailsFatherDetailsArea,
        this.parentDetailsFatherDetailsCountry,
        this.parentDetailsFatherDetailsPincode,
        this.parentDetailsFatherDetailsState,
        this.parentDetailsFatherDetailsCity,
        this.parentDetailsFatherDetailsEmail,
        this.parentDetailsFatherDetailsMobile,
        this.parentDetailsMotherDetailsFirstName,
        this.parentDetailsMotherDetailsLastName,
        this.parentDetailsMotherDetailsAadhar,
        this.parentDetailsMotherDetailsPan,
        this.parentDetailsMotherDetailsQualification,
        this.parentDetailsMotherDetailsOccupation,
        this.parentDetailsMotherDetailsOrganizationName,
        this.parentDetailsMotherDetailsDesignation,
        this.parentDetailsMotherDetailsOfficeAddress,
        this.parentDetailsMotherDetailsArea,
        this.parentDetailsMotherDetailsCountry,
        this.parentDetailsMotherDetailsPincode,
        this.parentDetailsMotherDetailsState,
        this.parentDetailsMotherDetailsCity,
        this.parentDetailsMotherDetailsEmail,
        this.parentDetailsMotherDetailsMobile,
        this.parentDetailsGuardianDetailsFirstName,
        this.parentDetailsGuardianDetailsLastName,
        this.parentDetailsGuardianDetailsEmail,
        this.parentDetailsGuardianDetailsMobile,
        this.parentDetailsGuardianDetailsRelationshipWithChild,
        this.parentDetailsGuardianDetailsAddress,
        this.parentDetailsGuardianDetailsHouse,
        this.parentDetailsGuardianDetailsStreet,
        this.parentDetailsGuardianDetailsLandmark,
        this.parentDetailsGuardianDetailsCountry,
        this.parentDetailsGuardianDetailsPincode,
        this.parentDetailsGuardianDetailsState,
        this.parentDetailsGuardianDetailsCity,
        this.parentDetailsGuardianDetailsAadhar,
        this.parentDetailsGuardianDetailsPan,
    });

    factory ParenInfoUpdateRequest.fromJson(Map<String, dynamic> json) => ParenInfoUpdateRequest(
        parentDetailsFatherDetailsFirstName: json["parent_details.father_details.first_name"],
        parentDetailsFatherDetailsLastName: json["parent_details.father_details.last_name"],
        parentDetailsFatherDetailsAadhar: json["parent_details.father_details.aadhar"],
        parentDetailsFatherDetailsPan: json["parent_details.father_details.pan"],
        parentDetailsFatherDetailsQualification: json["parent_details.father_details.qualification"],
        parentDetailsFatherDetailsOccupation: json["parent_details.father_details.occupation"],
        parentDetailsFatherDetailsOrganizationName: json["parent_details.father_details.organization_name"],
        parentDetailsFatherDetailsDesignation: json["parent_details.father_details.designation"],
        parentDetailsFatherDetailsOfficeAddress: json["parent_details.father_details.office_address"],
        parentDetailsFatherDetailsArea: json["parent_details.father_details.area"],
        parentDetailsFatherDetailsCountry: json["parent_details.father_details.country"] == null ? null : CommonDataEntity.fromJson(json["parent_details.father_details.country"]),
        parentDetailsFatherDetailsPincode: json["parent_details.father_details.pincode"],
        parentDetailsFatherDetailsState: json["parent_details.father_details.state"] == null ? null : CommonDataEntity.fromJson(json["parent_details.father_details.state"]),
        parentDetailsFatherDetailsCity: json["parent_details.father_details.city"] == null ? null : CommonDataEntity.fromJson(json["parent_details.father_details.city"]),
        parentDetailsFatherDetailsEmail: json["parent_details.father_details.email"],
        parentDetailsFatherDetailsMobile: json["parent_details.father_details.mobile"],
        parentDetailsMotherDetailsFirstName: json["parent_details.mother_details.first_name"],
        parentDetailsMotherDetailsLastName: json["parent_details.mother_details.last_name"],
        parentDetailsMotherDetailsAadhar: json["parent_details.mother_details.aadhar"],
        parentDetailsMotherDetailsPan: json["parent_details.mother_details.pan"],
        parentDetailsMotherDetailsQualification: json["parent_details.mother_details.qualification"],
        parentDetailsMotherDetailsOccupation: json["parent_details.mother_details.occupation"],
        parentDetailsMotherDetailsOrganizationName: json["parent_details.mother_details.organization_name"],
        parentDetailsMotherDetailsDesignation: json["parent_details.mother_details.designation"],
        parentDetailsMotherDetailsOfficeAddress: json["parent_details.mother_details.office_address"],
        parentDetailsMotherDetailsArea: json["parent_details.mother_details.area"],
        parentDetailsMotherDetailsCountry: json["parent_details.mother_details.country"] == null ? null : CommonDataEntity.fromJson(json["parent_details.mother_details.country"]),
        parentDetailsMotherDetailsPincode: json["parent_details.mother_details.pincode"],
        parentDetailsMotherDetailsState: json["parent_details.mother_details.state"] == null ? null : CommonDataEntity.fromJson(json["parent_details.mother_details.state"]),
        parentDetailsMotherDetailsCity: json["parent_details.mother_details.city"] == null ? null : CommonDataEntity.fromJson(json["parent_details.mother_details.city"]),
        parentDetailsMotherDetailsEmail: json["parent_details.mother_details.email"],
        parentDetailsMotherDetailsMobile: json["parent_details.mother_details.mobile"],
        parentDetailsGuardianDetailsFirstName: json["parent_details.guardian_details.first_name"],
        parentDetailsGuardianDetailsLastName: json["parent_details.guardian_details.last_name"],
        parentDetailsGuardianDetailsEmail: json["parent_details.guardian_details.email"],
        parentDetailsGuardianDetailsMobile: json["parent_details.guardian_details.mobile"],
        parentDetailsGuardianDetailsRelationshipWithChild: json["parent_details.guardian_details.relationship_with_child"],
        parentDetailsGuardianDetailsAddress: json["parent_details.guardian_details.address"],
        parentDetailsGuardianDetailsHouse: json["parent_details.guardian_details.house"],
        parentDetailsGuardianDetailsStreet: json["parent_details.guardian_details.street"],
        parentDetailsGuardianDetailsLandmark: json["parent_details.guardian_details.landmark"],
        parentDetailsGuardianDetailsCountry: json["parent_details.guardian_details.country"] == null ? null : CommonDataEntity.fromJson(json["parent_details.guardian_details.country"]),
        parentDetailsGuardianDetailsPincode: json["parent_details.guardian_details.pincode"],
        parentDetailsGuardianDetailsState: json["parent_details.guardian_details.state"] == null ? null : CommonDataEntity.fromJson(json["parent_details.guardian_details.state"]),
        parentDetailsGuardianDetailsCity: json["parent_details.guardian_details.city"] == null ? null : CommonDataEntity.fromJson(json["parent_details.guardian_details.city"]),
        parentDetailsGuardianDetailsAadhar: json["parent_details.guardian_details.aadhar"],
        parentDetailsGuardianDetailsPan: json["parent_details.guardian_details.pan"],
    );

    Map<String, dynamic> toJson() => {
        "parent_details.father_details.first_name": parentDetailsFatherDetailsFirstName,
        "parent_details.father_details.last_name": parentDetailsFatherDetailsLastName,
        "parent_details.father_details.aadhar": parentDetailsFatherDetailsAadhar,
        "parent_details.father_details.pan": parentDetailsFatherDetailsPan,
        "parent_details.father_details.qualification": parentDetailsFatherDetailsQualification,
        "parent_details.father_details.occupation": parentDetailsFatherDetailsOccupation,
        "parent_details.father_details.organization_name": parentDetailsFatherDetailsOrganizationName,
        "parent_details.father_details.designation": parentDetailsFatherDetailsDesignation,
        "parent_details.father_details.office_address": parentDetailsFatherDetailsOfficeAddress,
        "parent_details.father_details.area": parentDetailsFatherDetailsArea,
        "parent_details.father_details.country": parentDetailsFatherDetailsCountry?.toJson(),
        "parent_details.father_details.pincode": parentDetailsFatherDetailsPincode,
        "parent_details.father_details.state": parentDetailsFatherDetailsState?.toJson(),
        "parent_details.father_details.city": parentDetailsFatherDetailsCity?.toJson(),
        "parent_details.father_details.email": parentDetailsFatherDetailsEmail,
        "parent_details.father_details.mobile": parentDetailsFatherDetailsMobile,
        "parent_details.mother_details.first_name": parentDetailsMotherDetailsFirstName,
        "parent_details.mother_details.last_name": parentDetailsMotherDetailsLastName,
        "parent_details.mother_details.aadhar": parentDetailsMotherDetailsAadhar,
        "parent_details.mother_details.pan": parentDetailsMotherDetailsPan,
        "parent_details.mother_details.qualification": parentDetailsMotherDetailsQualification,
        "parent_details.mother_details.occupation": parentDetailsMotherDetailsOccupation,
        "parent_details.mother_details.organization_name": parentDetailsMotherDetailsOrganizationName,
        "parent_details.mother_details.designation": parentDetailsMotherDetailsDesignation,
        "parent_details.mother_details.office_address": parentDetailsMotherDetailsOfficeAddress,
        "parent_details.mother_details.area": parentDetailsMotherDetailsArea,
        "parent_details.mother_details.country": parentDetailsMotherDetailsCountry?.toJson(),
        "parent_details.mother_details.pincode": parentDetailsMotherDetailsPincode,
        "parent_details.mother_details.state": parentDetailsMotherDetailsState?.toJson(),
        "parent_details.mother_details.city": parentDetailsMotherDetailsCity?.toJson(),
        "parent_details.mother_details.email": parentDetailsMotherDetailsEmail,
        "parent_details.mother_details.mobile": parentDetailsMotherDetailsMobile,
        "parent_details.guardian_details.first_name": parentDetailsGuardianDetailsFirstName,
        "parent_details.guardian_details.last_name": parentDetailsGuardianDetailsLastName,
        "parent_details.guardian_details.email": parentDetailsGuardianDetailsEmail,
        "parent_details.guardian_details.mobile": parentDetailsGuardianDetailsMobile,
        "parent_details.guardian_details.relationship_with_child": parentDetailsGuardianDetailsRelationshipWithChild,
        "parent_details.guardian_details.address": parentDetailsGuardianDetailsAddress,
        "parent_details.guardian_details.house": parentDetailsGuardianDetailsHouse,
        "parent_details.guardian_details.street": parentDetailsGuardianDetailsStreet,
        "parent_details.guardian_details.landmark": parentDetailsGuardianDetailsLandmark,
        "parent_details.guardian_details.country": parentDetailsGuardianDetailsCountry?.toJson(),
        "parent_details.guardian_details.pincode": parentDetailsGuardianDetailsPincode,
        "parent_details.guardian_details.state": parentDetailsGuardianDetailsState?.toJson(),
        "parent_details.guardian_details.city": parentDetailsGuardianDetailsCity?.toJson(),
        "parent_details.guardian_details.aadhar": parentDetailsGuardianDetailsAadhar,
        "parent_details.guardian_details.pan": parentDetailsGuardianDetailsPan,
    };
}
