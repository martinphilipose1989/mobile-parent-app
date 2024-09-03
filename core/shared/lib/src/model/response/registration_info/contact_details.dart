import 'package:shared/shared.dart';

class ContactDetails{
  dynamic emergencyContact;
  List<PointOfContactDetail>? pointOfContact;
  ResidentialAddress? residentialAddress;

    ContactDetails({
        this.emergencyContact,
        this.pointOfContact,
        this.residentialAddress,
    });
}