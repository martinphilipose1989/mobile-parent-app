import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
part 'create_qrcode_response.g.dart';

@JsonSerializable()
class CreateQrcodeResponseEntity
    implements
        BaseLayerDataTransformer<CreateQrcodeResponseEntity,
            CreateQrcodeResponseModel> {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "data")
  CreateQrcodeResponseDataEntity? data;
  @JsonKey(name: "message")
  String? message;

  CreateQrcodeResponseEntity({
    this.status,
    this.data,
    this.message,
  });

  factory CreateQrcodeResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$CreateQrcodeResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CreateQrcodeResponseEntityToJson(this);

  @override
  CreateQrcodeResponseEntity restore(CreateQrcodeResponseModel data) {
    return CreateQrcodeResponseEntity();
  }

  @override
  CreateQrcodeResponseModel transform() {
    return CreateQrcodeResponseModel(
        data: data?.transform(), status: status, message: message);
  }
}

@JsonSerializable()
class CreateQrcodeResponseDataEntity
    implements
        BaseLayerDataTransformer<CreateQrcodeResponseDataEntity,
            CreateQrcodeResponseData> {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "visitor_id")
  String? visitorId;
  @JsonKey(name: "visitor_type_id")
  int? visitorTypeId;
  @JsonKey(name: "gatepass_number")
  String? gatepassNumber;
  @JsonKey(name: "company_name")
  dynamic companyName;
  @JsonKey(name: "point_of_contact")
  dynamic pointOfContact;
  @JsonKey(name: "other_point_of_contact")
  dynamic otherPointOfContact;
  @JsonKey(name: "purpose_of_visit_id")
  dynamic purposeOfVisitId;
  @JsonKey(name: "coming_from")
  dynamic comingFrom;
  @JsonKey(name: "guest_count")
  int? guestCount;
  @JsonKey(name: "issued_date")
  String? issuedDate;
  @JsonKey(name: "issued_time")
  String? issuedTime;
  @JsonKey(name: "incoming_time")
  dynamic incomingTime;
  @JsonKey(name: "outgoing_time")
  dynamic outgoingTime;
  @JsonKey(name: "qr_code")
  String? qrCode;
  @JsonKey(name: "vehicle_number")
  dynamic vehicleNumber;
  @JsonKey(name: "created_by")
  dynamic createdBy;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;
  @JsonKey(name: "__v")
  int? v;

  CreateQrcodeResponseDataEntity({
    this.id,
    this.visitorId,
    this.visitorTypeId,
    this.gatepassNumber,
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
    this.vehicleNumber,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory CreateQrcodeResponseDataEntity.fromJson(Map<String, dynamic> json) =>
      _$CreateQrcodeResponseDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CreateQrcodeResponseDataEntityToJson(this);

  @override
  CreateQrcodeResponseDataEntity restore(CreateQrcodeResponseData data) {
    return CreateQrcodeResponseDataEntity();
  }

  @override
  CreateQrcodeResponseData transform() {
    return CreateQrcodeResponseData(comingFrom: comingFrom, qrCode: qrCode);
  }
}
