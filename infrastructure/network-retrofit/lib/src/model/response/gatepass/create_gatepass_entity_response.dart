import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'create_gatepass_entity_response.g.dart';

CreateGatePassResponseEntity createGatePassResponseEntityFromJson(String str) =>
    CreateGatePassResponseEntity.fromJson(json.decode(str));

String createGatePassResponseEntityToJson(CreateGatePassResponseEntity data) =>
    json.encode(data.toJson());

@JsonSerializable()
class CreateGatePassResponseEntity
    implements
        BaseLayerDataTransformer<CreateGatePassResponseEntity,
            CreateGatepassResponseModel> {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "data")
  CreateGatePassDataEntity? data;
  @JsonKey(name: "message")
  String? message;

  CreateGatePassResponseEntity({
    this.status,
    this.data,
    this.message,
  });

  factory CreateGatePassResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$CreateGatePassResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CreateGatePassResponseEntityToJson(this);

  @override
  CreateGatePassResponseEntity restore(CreateGatepassResponseModel data) {
    return CreateGatePassResponseEntity(
      message: data.message,
      status: data.status,
      data: CreateGatePassDataEntity(
          companyName: data.data?.companyName,
          comingFrom: data.data?.comingFrom,
          guestCount: data.data?.guestCount,
          id: data.data?.id,
          incomingTime: data.data?.incomingTime,
          issuedDate: data.data?.issuedDate,
          issuedTime: data.data?.issuedTime,
          otherPointOfContact: data.data?.otherPointOfContact,
          outgoingTime: data.data?.outgoingTime,
          pointOfContact: data.data?.pointOfContact,
          purposeOfVisitId: data.data?.purposeOfVisitId,
          qrCode: data.data?.qrCode,
          visitorId: data.data?.visitorId,
          createdAt: data.data?.createdAt,
          updatedAt: data.data?.updatedAt,
          v: data.data?.v,
          visitorTypeId: data.data?.visitorTypeId),
    );
  }

  @override
  CreateGatepassResponseModel transform() {
    return CreateGatepassResponseModel(
        status: status,
        message: message,
        data: CreateGatePassDataResponseModel(
            companyName: data?.companyName,
            comingFrom: data?.comingFrom,
            guestCount: data?.guestCount,
            id: data?.id,
            incomingTime: data?.incomingTime,
            issuedDate: data?.issuedDate,
            issuedTime: data?.issuedTime,
            otherPointOfContact: data?.otherPointOfContact,
            outgoingTime: data?.outgoingTime,
            pointOfContact: data?.pointOfContact,
            purposeOfVisitId: data?.purposeOfVisitId,
            qrCode: data?.qrCode,
            visitorId: data?.visitorId,
            createdAt: data?.createdAt,
            updatedAt: data?.updatedAt,
            v: data?.v,
            visitorTypeId: data?.visitorTypeId));
  }
}

@JsonSerializable()
class CreateGatePassDataEntity
    implements
        BaseLayerDataTransformer<CreateGatePassDataEntity,
            CreateGatePassDataResponseModel> {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "visitor_id")
  String? visitorId;
  @JsonKey(name: "visitor_type_id")
  int? visitorTypeId;
  @JsonKey(name: "company_name")
  String? companyName;
  @JsonKey(name: "point_of_contact")
  String? pointOfContact;
  @JsonKey(name: "other_point_of_contact")
  String? otherPointOfContact;
  @JsonKey(name: "purpose_of_visit_id")
  int? purposeOfVisitId;
  @JsonKey(name: "coming_from")
  String? comingFrom;
  @JsonKey(name: "guest_count")
  int? guestCount;
  @JsonKey(name: "issued_date")
  String? issuedDate;
  @JsonKey(name: "issued_time")
  String? issuedTime;
  @JsonKey(name: "incoming_time")
  String? incomingTime;
  @JsonKey(name: "outgoing_time")
  String? outgoingTime;
  @JsonKey(name: "qr_code")
  String? qrCode;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;
  @JsonKey(name: "__v")
  int? v;

  CreateGatePassDataEntity({
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

  factory CreateGatePassDataEntity.fromJson(Map<String, dynamic> json) =>
      _$CreateGatePassDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CreateGatePassDataEntityToJson(this);

  @override
  CreateGatePassDataEntity restore(CreateGatePassDataResponseModel data) {
    return CreateGatePassDataEntity(
        id: data.id,
        companyName: data.companyName,
        outgoingTime: data.outgoingTime,
        comingFrom: data.comingFrom,
        createdAt: data.createdAt,
        guestCount: data.guestCount,
        incomingTime: data.incomingTime,
        issuedDate: data.issuedDate,
        issuedTime: data.issuedTime,
        otherPointOfContact: data.otherPointOfContact,
        pointOfContact: data.pointOfContact,
        purposeOfVisitId: data.purposeOfVisitId,
        qrCode: data.qrCode,
        updatedAt: data.updatedAt,
        v: data.v,
        visitorId: data.visitorId,
        visitorTypeId: data.visitorTypeId);
  }

  @override
  CreateGatePassDataResponseModel transform() {
    return CreateGatePassDataResponseModel(
        id: id,
        companyName: companyName,
        comingFrom: comingFrom,
        createdAt: createdAt,
        guestCount: guestCount,
        incomingTime: incomingTime,
        issuedDate: issuedDate,
        issuedTime: issuedTime,
        otherPointOfContact: otherPointOfContact,
        outgoingTime: outgoingTime,
        pointOfContact: pointOfContact,
        purposeOfVisitId: purposeOfVisitId,
        qrCode: qrCode,
        updatedAt: updatedAt,
        v: v,
        visitorId: visitorId,
        visitorTypeId: visitorTypeId);
  }
}
