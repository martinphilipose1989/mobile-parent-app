import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'visitor_data_entity.g.dart';

@JsonSerializable()
class VisitorDataEntity
    implements BaseLayerDataTransformer<VisitorDataEntity, VisitorDataModel> {
  @JsonKey(name: "_id")
  final String? id;

  @JsonKey(name: "point_of_contact")
  final String? pointOfContact;

    @JsonKey(name: "issued_date")
  final String? issuedDate;

  @JsonKey(name: "issued_time")
  final String? issuedTime;

  @JsonKey(name: "incoming_time")
  final String? incomingTime;

  @JsonKey(name: "outgoing_time")
  final String? outgoingTime;

  @JsonKey(name: "visit_status")
  final String? visitStatus;

  @JsonKey(name: "visitor_id")
  final String? visitorId;

  @JsonKey(name: "visitor_name")
  final String? visitorName;

  @JsonKey(name: "visitor_mobile")
  final String? visitorMobile;

  @JsonKey(name: "visitor_email")
  final String? visitorEmail;

  @JsonKey(name: "visitor_profile_image")
  final String? visitorProfileImage;

  @JsonKey(name: "purpose_of_visit")
  final String? purposeOfVisit;

//visitor details related fields
  @JsonKey(name: "purpose_of_visit_id")
  final int? purposeOfVisitId;

  @JsonKey(name: "coming_from")
  final String? comingFrom;

  @JsonKey(name: "qr_code")
  final String? qrCode;

  @JsonKey(name: "visitor_profile_image_file_path")
  final String? visitorProfileImageFilePath;

  @JsonKey(name: "visitor_profile_image_image_url")
  final String? visitorProfileImageImageUrl;

  @JsonKey(name: "visitor_type")
  final String? visitorType;

  @JsonKey(name: "guest_count")
  final int? guestCount;

  @JsonKey(name: "gatepass_number")
  final String? gatePassNumber;

  @JsonKey(name: "vehicle_number")
  final String? vehicleNumber;

  @JsonKey(name: "student_name")
  final String? studentName;

  @JsonKey(name: "school_visit_date")
  final String? schoolVisitDate;

  @JsonKey(name: "other_point_of_contact")
  final String? otherPointOfContact;

  @JsonKey(name: "visitor_type_id")
  final int? visitorTypeId;

  VisitorDataEntity({
    this.id,
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
    this.visitorProfileImageFilePath,
    this.visitorProfileImageImageUrl,
    this.visitorType,
    this.guestCount,
    this.gatePassNumber,
    this.vehicleNumber,
    this.issuedTime,
    this.studentName,
    this.schoolVisitDate,
    this.otherPointOfContact,
    this.visitorTypeId,
  });

  factory VisitorDataEntity.fromJson(Map<String, dynamic> json) =>
      _$VisitorDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$VisitorDataEntityToJson(this);

  @override
  VisitorDataEntity restore(VisitorDataModel data) {
    return VisitorDataEntity(id: data.id, incomingTime: data.incomingTime);
  }

  @override
  VisitorDataModel transform() {
    return VisitorDataModel(
      id: id,
      incomingTime: incomingTime,
      issuedDate: issuedDate,
      outgoingTime: outgoingTime,
      pointOfContact: pointOfContact,
      purposeOfVisit: purposeOfVisit,
      visitStatus: visitStatus,
      visitorEmail: visitorEmail,
      visitorId: visitorId,
      visitorMobile: visitorMobile,
      visitorName: visitorName,
      visitorProfileImage: visitorProfileImage,
      purposeOfVisitId: purposeOfVisitId,
      comingFrom: comingFrom,
      qrCode: qrCode,
      visitorProfileImageFilePath: visitorProfileImageFilePath,
      visitorProfileImageImageUrl: visitorProfileImageImageUrl,
      visitorType: visitorType ?? "Parent",
      guestCount: guestCount,
      vehicleNumber: vehicleNumber,
      gatePassNumber: gatePassNumber,
      issuedTime: issuedTime,
      studentName: studentName,
      schoolVisitDate: schoolVisitDate,
      otherPointOfContact: otherPointOfContact,
      visitorTypeId: visitorTypeId,
    );
  }
}
