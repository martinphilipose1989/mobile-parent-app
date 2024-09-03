import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/get_new_admission/residential_address_entity.dart';
import 'package:network_retrofit/src/model/response/get_registreation_info/emergency_contact_entity.dart';
import 'package:network_retrofit/src/model/response/get_registreation_info/point_of_contact_entity.dart';

part 'contact_details_entity.g.dart';

@JsonSerializable(explicitToJson: true,createToJson: false)
class ContactDetailsEntity extends BaseLayerDataTransformer<ContactDetailsEntity,ContactDetails>{
    @JsonKey(name: 'emergencyContact')
    EmergencyContactEntity? emergencyContact;
    @JsonKey(name: 'pointOfContact')
    List<PointOfContactInfoEntity>? pointOfContact;
    @JsonKey(name: 'residentialAddress')
    ResidentialAddressEntity? residentialAddress;

    ContactDetailsEntity({
        this.emergencyContact,
        this.pointOfContact,
        this.residentialAddress,
    });

  factory ContactDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$ContactDetailsEntityFromJson(json);

    Map<String, dynamic> toJson() => {
      "other_details": emergencyContact?.toJson(),
      "contact_details": pointOfContact?.map((e)=> e.toJson()).toList(),
      "residential_address": residentialAddress?.toJson()
    };

  @override
  ContactDetails transform() {
    ContactDetails contactDetails = ContactDetails();
    contactDetails.emergencyContact = emergencyContact?.transform();
    contactDetails.pointOfContact = pointOfContact?.map((e)=> e.transform()).toList();
    contactDetails.residentialAddress = residentialAddress?.transform();
    return contactDetails;
  }

  @override
  ContactDetailsEntity restore(ContactDetails data) {
    EmergencyContactEntity emergencyContactEntity = EmergencyContactEntity();
    PointOfContactInfoEntity pointOfContactInfoEntity = PointOfContactInfoEntity();
    ResidentialAddressEntity residentialAddressContactInfo = ResidentialAddressEntity();
    ContactDetailsEntity contactDetailsEntity = ContactDetailsEntity(
      emergencyContact: emergencyContactEntity.restore((data.emergencyContact??EmergencyContact())),
      pointOfContact: data.pointOfContact?.map((e)=> pointOfContactInfoEntity.restore(e)).toList(),
      residentialAddress: residentialAddressContactInfo.restore((data.residentialAddress??ResidentialAddress()))
    );
    return contactDetailsEntity;
  }
}