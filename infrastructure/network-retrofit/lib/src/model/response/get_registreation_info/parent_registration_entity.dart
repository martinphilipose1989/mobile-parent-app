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
    @JsonKey(name: 'qualification',fromJson: _fromJson)
    dynamic qualification;
    @JsonKey(name: 'occupation', fromJson: _fromJson)
    dynamic occupation;
    @JsonKey(name: 'organisationName', fromJson: _fromJson)
    dynamic organisationName;
    @JsonKey(name: 'designationName', fromJson: _fromJson)
    dynamic designationName;
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
    @JsonKey(name:'pincode')
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

  Map<String, dynamic> toJson(){
    Map<String,dynamic> request = {
      "first_name": firstName,
      "last_name": lastName,
      "mobile": mobileNumber,
      "email": emailId,
      "pan": panNumber,
      "aadhar": aadharNumber,
    };
    if(qualification != null){
      if(qualification is CommonDataEntity){
        CommonDataEntity requestQualification = qualification;
        if(requestQualification.isValid()){
          request.addAll({"qualification": requestQualification.toJson(),});
        }
      }
      else{
        if (qualification is String) {
          if (qualification.toString().isNotEmpty && qualification.toString() != 'N/A') {
            request.addAll({"qualification": qualification.toString()});
          }
        }
      }
    }
    if(occupation != null){
      if(occupation is CommonDataEntity){
        CommonDataEntity requestOccupation = occupation;
        if(requestOccupation.isValid()){
          request.addAll({"occupation": requestOccupation.toJson(),});
        }
      }
      else{
        if(occupation is String){
          if (occupation.toString().isNotEmpty && occupation.toString() != 'N/A') {
              request.addAll({"occupation": occupation.toString()});
          }
        }
      }
    }
    if(organisationName != null){
      if(organisationName is CommonDataEntity){
        CommonDataEntity requestOrganisationName = organisationName;
        if(requestOrganisationName.isValid()){
          request.addAll({"organization_name": requestOrganisationName.toJson(),});
        }
      }
      else{
      if(organisationName is String){
        if (organisationName.toString().isNotEmpty && organisationName.toString() != 'N/A') {
            request.addAll({"organization_name": organisationName.toString()});
          }
        }
      }
    }
    if(designationName != null){
      if(designationName is CommonDataEntity){
        CommonDataEntity requestDesignationName = designationName;
        if(requestDesignationName.isValid()){
          request.addAll({"designation": requestDesignationName.toJson(),});
        }
      }
      else{
        if(designationName is String){
          if (designationName.toString().isNotEmpty && designationName.toString() != 'N/A') {
              request.addAll({"designation": designationName.toString()});
          }
        }
      }
    }
    if(officeAddress != null && (officeAddress??'').isNotEmpty && officeAddress != 'N/A'){
      request.addAll({"office_address": officeAddress,});
    }
    if(area != null && (area??'').isNotEmpty && area != 'N/A'){
      request.addAll({"area": area,});
    }
    if(country != null){
      if(country is CommonDataEntity){
        CommonDataEntity requestCountry = country;
        if(requestCountry.isValid()){
          request.addAll({
            "country": requestCountry.toJson() 
          });
        }
      }
      else{
        if (country is String) {
          if (country.toString().isNotEmpty && country.toString() != 'N/A') {
            request.addAll({"country": country.toString()});
          }
        }
      }
    }
    if(state != null){
      if(state is CommonDataEntity){
        CommonDataEntity requestState = state;
        if(requestState.isValid()){
          request.addAll({"state": requestState.toJson(),});
        }
      }
      else{
        if (state is String) {
          if (state.toString().isNotEmpty && state.toString() != 'N/A') {
            request.addAll({"state": state.toString()});
          }
        }
      }
    }
    if(city != null){
      if(city is CommonDataEntity){
        CommonDataEntity requestCity = city;
        if(requestCity.isValid()){
          request.addAll({"city": requestCity.toJson(),});
        }
      }
      else{
        if (city is String) {
          if (city.toString().isNotEmpty && city.toString() != 'N/A') {
            request.addAll({"city": city.toString()});
          }
        }
      }
    }
    if(pinCode != null && (pinCode??'').isNotEmpty && pinCode != 'N/A'){
      request.addAll({"pin_code": pinCode,});
    }

    return request;
  }

  @override
  ParentRegistrationDetail transform() {
    ParentRegistrationDetail parentRegistrationDetail = ParentRegistrationDetail();
    parentRegistrationDetail.firstName=firstName;
    parentRegistrationDetail.lastName=lastName;
    parentRegistrationDetail.aadharNumber=aadharNumber;
    parentRegistrationDetail.panNumber=panNumber;
    parentRegistrationDetail.qualification=(qualification is CommonDataEntity)? qualification?.transform() : qualification;
    parentRegistrationDetail.occupation = (occupation is CommonDataEntity)? occupation?.transform() : occupation;
    parentRegistrationDetail.organisationName = (organisationName is CommonDataEntity)? organisationName?.transform() : organisationName;
    parentRegistrationDetail.designationName = (designationName is CommonDataEntity)? designationName?.transform() : designationName;
    parentRegistrationDetail.officeAddress = officeAddress;
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
      qualification: (data.qualification is CommonDataClass)? commonDataEntity.restore(data.qualification!) : data.qualification,
      occupation: (data.occupation is CommonDataClass)? commonDataEntity.restore(data.occupation??CommonDataClass()) : data.occupation,
      organisationName: (data.organisationName is CommonDataClass)? commonDataEntity.restore(data.organisationName??CommonDataClass()) : data.organisationName,
      designationName: (data.designationName is CommonDataClass)? commonDataEntity.restore(data.designationName??CommonDataClass()) : data.designationName,
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