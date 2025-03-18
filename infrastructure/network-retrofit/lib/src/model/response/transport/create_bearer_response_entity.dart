import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_bearer_response_entity.g.dart';

@JsonSerializable()
class CreateBearerResponseEntity
    implements
        BaseLayerDataTransformer<CreateBearerResponseEntity,
            CreateBearerResponse> {
  @JsonKey(name: "data")
  CreateBearerResponseDataEntity? data;

  CreateBearerResponseEntity({this.data});

  factory CreateBearerResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$CreateBearerResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CreateBearerResponseEntityToJson(this);

  @override
  CreateBearerResponseEntity restore(CreateBearerResponse data) {
    return CreateBearerResponseEntity();
  }

  @override
  CreateBearerResponse transform() {
    return CreateBearerResponse(data: data?.transform());
  }
}

@JsonSerializable()
class CreateBearerResponseDataEntity
    implements
        BaseLayerDataTransformer<CreateBearerResponseDataEntity,
            CreateBearerResponseData> {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "attributes")
  CreateBearerResponseAttributesEntity? attributes;

  CreateBearerResponseDataEntity({this.id, this.attributes});

  factory CreateBearerResponseDataEntity.fromJson(Map<String, dynamic> json) =>
      _$CreateBearerResponseDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CreateBearerResponseDataEntityToJson(this);

  @override
  CreateBearerResponseDataEntity restore(CreateBearerResponseData data) {
    return CreateBearerResponseDataEntity();
  }

  @override
  CreateBearerResponseData transform() {
    return CreateBearerResponseData(
        id: id, attributes: attributes?.transform());
  }
}

@JsonSerializable()
class CreateBearerResponseAttributesEntity
    implements
        BaseLayerDataTransformer<CreateBearerResponseAttributesEntity,
            CreateBearerResponseAttributes> {
  @JsonKey(name: "global_no")
  dynamic globalNo;
  @JsonKey(name: "first_name")
  String? firstName;
  @JsonKey(name: "middle_name")
  dynamic middleName;
  @JsonKey(name: "last_name")
  String? lastName;
  @JsonKey(name: "address")
  dynamic address;
  @JsonKey(name: "area")
  dynamic area;
  @JsonKey(name: "pincode")
  dynamic pincode;
  @JsonKey(name: "landline")
  dynamic landline;
  @JsonKey(name: "mobile_no")
  dynamic mobileNo;
  @JsonKey(name: "email")
  dynamic email;
  @JsonKey(name: "occupation_id")
  dynamic occupationId;
  @JsonKey(name: "organization_id")
  dynamic organizationId;
  @JsonKey(name: "designation_id")
  dynamic designationId;
  @JsonKey(name: "qualification_id")
  dynamic qualificationId;
  @JsonKey(name: "is_preferred_address")
  dynamic isPreferredAddress;
  @JsonKey(name: "is_preferred_email")
  dynamic isPreferredEmail;
  @JsonKey(name: "is_preferred_mobile_no")
  dynamic isPreferredMobileNo;
  @JsonKey(name: "user_id")
  dynamic userId;
  @JsonKey(name: "createdAt")
  String? createdAt;
  @JsonKey(name: "updatedAt")
  String? updatedAt;
  @JsonKey(name: "global_id")
  dynamic globalId;
  @JsonKey(name: "adhar_no")
  dynamic adharNo;
  @JsonKey(name: "pan_no")
  dynamic panNo;
  @JsonKey(name: "is_custodian")
  dynamic isCustodian;
  @JsonKey(name: "is_legal_guardian")
  dynamic isLegalGuardian;
  @JsonKey(name: "set_as_emergency_contact")
  dynamic setAsEmergencyContact;
  @JsonKey(name: "unique_url_key")
  dynamic uniqueUrlKey;
  @JsonKey(name: "profile_image")
  String? profileImage;

  CreateBearerResponseAttributesEntity({
    this.globalNo,
    this.firstName,
    this.middleName,
    this.lastName,
    this.address,
    this.area,
    this.pincode,
    this.landline,
    this.mobileNo,
    this.email,
    this.occupationId,
    this.organizationId,
    this.designationId,
    this.qualificationId,
    this.isPreferredAddress,
    this.isPreferredEmail,
    this.isPreferredMobileNo,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.globalId,
    this.adharNo,
    this.panNo,
    this.isCustodian,
    this.isLegalGuardian,
    this.setAsEmergencyContact,
    this.uniqueUrlKey,
    this.profileImage,
  });

  factory CreateBearerResponseAttributesEntity.fromJson(
          Map<String, dynamic> json) =>
      _$CreateBearerResponseAttributesEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CreateBearerResponseAttributesEntityToJson(this);

  @override
  CreateBearerResponseAttributesEntity restore(
      CreateBearerResponseAttributes data) {
    return CreateBearerResponseAttributesEntity();
  }

  @override
  CreateBearerResponseAttributes transform() {
    return CreateBearerResponseAttributes(
        address: address,
        adharNo: adharNo,
        area: area,
        createdAt: createdAt,
        designationId: designationId,
        email: email,
        userId: updatedAt,
        profileImage: profileImage,
        lastName: lastName,
        firstName: firstName,
        globalId: globalId,
        globalNo: globalNo,
        isCustodian: isCustodian);
  }
}
