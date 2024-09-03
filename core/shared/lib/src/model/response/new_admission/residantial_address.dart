import 'package:shared/shared.dart';
import 'package:shared/src/model/response/new_admission/common_data_class.dart';

class ResidentialAddress {
    String? house;
    String? street;
    String? landmark;
    CommonDataClass? country;
    String? pinCode;
    CommonDataClass? state;
    CommonDataClass? city;
    bool? isPermanentAddress;

  ResidentialAddress({
    this.house,
    this.street,
    this.landmark,
    this.country,
    this.pinCode,
    this.state,
    this.city,
    this.isPermanentAddress,
  }); 
}
