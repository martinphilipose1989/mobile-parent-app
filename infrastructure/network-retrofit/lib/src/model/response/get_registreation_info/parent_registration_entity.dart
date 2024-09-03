import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'parent_registration_entity.g.dart';

@JsonSerializable(explicitToJson: true,createToJson: false)
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
    @JsonKey(name: 'country',fromJson: _fromJson)
    dynamic country;
    @JsonKey(name: 'state',fromJson: _fromJson)
    dynamic state;
    @JsonKey(name: 'city',fromJson: _fromJson)
    dynamic city;
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

  static dynamic _fromJson(dynamic value) =>
      (value is Map<String,dynamic>) ? CommonDataEntity.fromJson(value) : value;

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "mobile": mobileNumber,
    "email": emailId,
    "pan": panNumber,
    "aadhar": aadharNumber,
    "qualification": qualification,
    "occupation": occupation,
    "organization_name": organisationName,
    "designation": designationName,
    "office_address": officeAddress,
    "area": area,
    "country": country?.toJson(),
    "pin_code": pinCode,
    "state": state?.toJson(),
    "city": city?.toJson()
  };

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
    parentRegistrationDetail.country= (country is CommonDataEntity)? country?.transform() : country;
    parentRegistrationDetail.state= (state is CommonDataEntity)? state?.transform() : state;
    parentRegistrationDetail.city= (city is CommonDataEntity)? city?.transform() : city;
    parentRegistrationDetail.emailId=emailId;
    parentRegistrationDetail.mobileNumber=mobileNumber;
    parentRegistrationDetail.pinCode=pinCode;
    return parentRegistrationDetail;

  }

  @override
  ParentRegistrationDetailEntity restore(ParentRegistrationDetail data) {
    CommonDataEntity commonDataEntity = CommonDataEntity();
    ParentRegistrationDetailEntity parentRegistrationDetailEntity = ParentRegistrationDetailEntity(
      firstName: data.firstName,
      lastName: data.lastName,
      aadharNumber: data.aadharNumber,
      panNumber: data.panNumber,
      qualification: data.qualification,
      occupation: data.occupation,
      organisationName: data.organisationName,
      designationName: data.designationName,
      officeAddress: data.officeAddress,
      area: data.area,
      country: (data.country is CommonDataClass)? commonDataEntity.restore(data.country!) : data.country,
      state: (data.state is CommonDataClass)? commonDataEntity.restore(data.state!) : data.state,
      city: (data.city is CommonDataClass)? commonDataEntity.restore(data.city!) : data.city,
      emailId: data.emailId,
      mobileNumber: data.mobileNumber,
      pinCode: data.pinCode,
    );
    return parentRegistrationDetailEntity;
  }

}