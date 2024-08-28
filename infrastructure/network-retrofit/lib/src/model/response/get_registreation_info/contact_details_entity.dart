import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/get_registreation_info/residential_contact_info_entity.dart';

part 'contact_details_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class ContactDetailsEntity extends BaseLayerDataTransformer<ContactDetailsEntity,ContactDetails>{
    String? emergencyContact;
    List<dynamic>? pointOfContact;
    ResidentialAddressContactInfoEntity? residentialAddress;

    ContactDetailsEntity({
        this.emergencyContact,
        this.pointOfContact,
        this.residentialAddress,
    });

  factory ContactDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$ContactDetailsEntityFromJson(json);

    Map<String, dynamic> toJson() => _$ContactDetailsEntityToJson(this);  

  @override
  ContactDetails transform() {
    ContactDetails contactDetails = ContactDetails();
    contactDetails.emergencyContact = emergencyContact;
    contactDetails.pointOfContact = pointOfContact;
    contactDetails.residentialAddress = residentialAddress?.transform();
    return contactDetails;
  }
}