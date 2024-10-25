import 'package:shared/shared.dart';

class ContactDetails{
  String? emergencyContact;
  PointOfContactDetail? pointOfContact;
  ResidentialAddressDetail? residentialAddress;

    ContactDetails({
        this.emergencyContact,
        this.pointOfContact,
        this.residentialAddress,
    });
}