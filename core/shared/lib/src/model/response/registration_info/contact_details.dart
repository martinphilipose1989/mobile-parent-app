import 'package:shared/shared.dart';

class ContactDetails{
  EmergencyContact? emergencyContact;
  List<PointOfContactDetail>? pointOfContact;
  ResidentialAddress? residentialAddress;

    ContactDetails({
        this.emergencyContact,
        this.pointOfContact,
        this.residentialAddress,
    });
}