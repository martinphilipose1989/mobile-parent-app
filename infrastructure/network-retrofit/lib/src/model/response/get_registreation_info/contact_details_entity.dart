import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/get_registreation_info/emergency_contact_entity.dart';
import 'package:network_retrofit/src/model/response/get_registreation_info/point_of_contact_entity.dart';
import 'package:network_retrofit/src/model/response/get_registreation_info/residential_address_detail_entity.dart';

part 'contact_details_entity.g.dart';

@JsonSerializable(explicitToJson: true,createToJson: false)
class ContactDetailsEntity extends BaseLayerDataTransformer<ContactDetailsEntity,ContactDetails>{
    @JsonKey(name: 'emergencyContact')
    String? emergencyContact;
    @JsonKey(name: 'pointOfContact')
    PointOfContactInfoEntity? pointOfContact;
    @JsonKey(name: 'residentialAddress')
    ResidentialAddressDetailEntity? residentialAddress;

    ContactDetailsEntity({
        this.emergencyContact,
        this.pointOfContact,
        this.residentialAddress,
    });

  factory ContactDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$ContactDetailsEntityFromJson(json);

    Map<String, dynamic> toJson(){
      Map<String,dynamic> request = {};
      if ((emergencyContact??'').isNotEmpty && emergencyContact.toString() != 'N/A' && emergencyContact != null) {
      request.addAll({"emergency_contact": emergencyContact??''});
      }
      if(pointOfContact != null){
        request.addAll({"contact_details": pointOfContact?.toJson()});
      }
      if(residentialAddress != null){
        request.addAll({"residential_address": residentialAddress?.toJson()});
      }
      return request;
    }

  static dynamic _fromJson(dynamic data){
    if(data is Map<String,dynamic>){
      return EmergencyContactEntity.fromJson(data);
    }
    else{
      return data;
    }
  }

  @override
  ContactDetails transform() {
    ContactDetails contactDetails = ContactDetails();
    contactDetails.emergencyContact = emergencyContact;
    contactDetails.pointOfContact = pointOfContact?.transform();
    contactDetails.residentialAddress = residentialAddress?.transform();
    return contactDetails;
  }

  @override
  ContactDetailsEntity restore(ContactDetails data) {
    
    PointOfContactInfoEntity pointOfContactInfoEntity = PointOfContactInfoEntity();
    ResidentialAddressDetailEntity residentialAddressContactInfo = ResidentialAddressDetailEntity();
    ContactDetailsEntity contactDetailsEntity = ContactDetailsEntity(
      emergencyContact: data.emergencyContact,
      pointOfContact: pointOfContactInfoEntity.restore(data.pointOfContact?? PointOfContactDetail()),
      residentialAddress: residentialAddressContactInfo.restore((data.residentialAddress??ResidentialAddressDetail()))
    );
    return contactDetailsEntity;
  }
}