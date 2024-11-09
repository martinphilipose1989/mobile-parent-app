import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'visitor_data_entity.g.dart';

@JsonSerializable()
class VisitorDataEntity
    implements BaseLayerDataTransformer<VisitorDataEntity, VisitorDataModel> {
  @JsonKey(name: "_id")
  String? id;

  @JsonKey(name: "point_of_contact")
  String? pointOfContact;

  @JsonKey(name: "issued_date")
  String? issuedDate;

  @JsonKey(name: "issued_time")
  String? issuedTime;

  @JsonKey(name: "incoming_time")
  String? incomingTime;

  @JsonKey(name: "outgoing_time")
  String? outgoingTime;

  @JsonKey(name: "visit_status")
  String? visitStatus;

  @JsonKey(name: "visitor_id")
  String? visitorId;

  @JsonKey(name: "visitor_name")
  String? visitorName;

  @JsonKey(name: "visitor_mobile")
  String? visitorMobile;

  @JsonKey(name: "visitor_email")
  String? visitorEmail;

  @JsonKey(name: "visitor_profile_image")
  String? visitorProfileImage;

  @JsonKey(name: "purpose_of_visit")
  String? purposeOfVisit;

//visitor details related fields
  @JsonKey(name: "purpose_of_visit_id")
  int? purposeOfVisitId;

  @JsonKey(name: "coming_from")
  String? comingFrom;

  @JsonKey(name: "qr_code")
  String? qrCode;

  @JsonKey(name: "visitor_profile_image_file_path")
  String? visitorProfileImageFilePath;

  @JsonKey(name: "visitor_profile_image_image_url")
  String? visitorProfileImageImageUrl;

  @JsonKey(name: "visitor_type")
  String? visitorType;

  @JsonKey(name: "guest_count")
  int? guestCount;

  @JsonKey(name: "gatepass_number")
  String? gatePassNumber;

  @JsonKey(name: "vehicle_number")
  String? vehicleNumber;

  @JsonKey(name: "student_name")
  String? studentName;

  VisitorDataEntity(
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
      this.visitorProfileImageFilePath,
      this.visitorProfileImageImageUrl,
      this.visitorType,
      this.guestCount,
      this.gatePassNumber,
      this.vehicleNumber,
      this.issuedTime,
      this.studentName});

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
        studentName: studentName);
  }
}
