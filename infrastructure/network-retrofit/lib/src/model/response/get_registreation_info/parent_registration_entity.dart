import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'parent_registration_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class ParentRegistrationDetailEntity extends BaseLayerDataTransformer<ParentRegistrationDetailEntity,ParentRegistrationDetail>{
    @JsonKey(name: 'firstName')
    String? firstName;
    @JsonKey(name: 'lastName')
    String? lastName;
    @JsonKey(name: 'aadharNumber')
    String? aadharNumber;
    @JsonKey(name: 'panNumber')
    String? panNumber;
    @JsonKey(name: 'qualification')
    String? qualification;
    @JsonKey(name: 'occupation')
    String? occupation;
    @JsonKey(name: 'organisationName')
    String? organisationName;
    @JsonKey(name: 'designationName')
    String? designationName;
    @JsonKey(name: 'officeAddress')
    String? officeAddress;
    @JsonKey(name: 'area')
    String? area;
    @JsonKey(name: 'country')
    String? country;
    @JsonKey(name: 'state')
    String? state;
    @JsonKey(name: 'city')
    String? city;
    @JsonKey(name: 'emailId')
    String? emailId;
    @JsonKey(name: 'mobileNumber')
    String? mobileNumber;
    @JsonKey(name:'pin_code')
    String? pinCode;

    ParentRegistrationDetailEntity({
        this.firstName,
        this.lastName,
        this.aadharNumber,
        this.panNumber,
        this.qualification,
        this.occupation,
        this.organisationName,
        this.designationName,
        this.officeAddress,
        this.area,
        this.country,
        this.state,
        this.city,
        this.emailId,
        this.mobileNumber,
      this.pinCode
    });
  factory ParentRegistrationDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$ParentRegistrationDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ParentRegistrationDetailEntityToJson(this);

  @override
  ParentRegistrationDetail transform() {
    ParentRegistrationDetail parentRegistrationDetail = ParentRegistrationDetail();
    parentRegistrationDetail.firstName=firstName;
    parentRegistrationDetail.lastName=lastName;
    parentRegistrationDetail.aadharNumber=aadharNumber;
    parentRegistrationDetail.panNumber=panNumber;
    parentRegistrationDetail.qualification=qualification;
    parentRegistrationDetail.occupation=occupation;
    parentRegistrationDetail.organisationName=organisationName;
    parentRegistrationDetail.designationName=designationName;
    parentRegistrationDetail.officeAddress=officeAddress;
    parentRegistrationDetail.area=area;
    parentRegistrationDetail.country=country;
    parentRegistrationDetail.state=state;
    parentRegistrationDetail.city=city;
    parentRegistrationDetail.emailId=emailId;
    parentRegistrationDetail.mobileNumber=mobileNumber;
    parentRegistrationDetail.pinCode=pinCode;
    return parentRegistrationDetail;

  }

}