import 'package:shared/shared.dart';

class ResidentialAddressDetail{
  ResidentialAddress? currentAddress;
  ResidentialAddress? permanentAddress;
  bool? isPermanentAddress;

  ResidentialAddressDetail({
    this.currentAddress,
    this.permanentAddress,
    this.isPermanentAddress
  });
}