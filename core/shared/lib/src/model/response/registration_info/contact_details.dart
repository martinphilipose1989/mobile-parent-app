import 'package:shared/shared.dart';

class ContactDetails extends BaseDetails{
String? emergencyContact;
    List<dynamic>? pointOfContact;
    ResidentialAddress? residentialAddress;

    ContactDetails({
        this.emergencyContact,
        this.pointOfContact,
        this.residentialAddress,
    });
    

}