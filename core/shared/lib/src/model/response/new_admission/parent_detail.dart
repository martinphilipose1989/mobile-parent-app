import 'package:shared/shared.dart';

class ParentDetails {
  ParentContactDetail? fatherDetails;
  ParentContactDetail? motherDetails;

  ParentDetails({
    this.fatherDetails,
    this.motherDetails,
  });

  @override
  String toString() {
    return 'ParentDetails(fatherDetails: $fatherDetails, motherDetails: $motherDetails)';
  }
}
