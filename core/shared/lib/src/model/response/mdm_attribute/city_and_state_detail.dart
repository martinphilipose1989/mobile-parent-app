import 'package:shared/shared.dart';

class CityAndStateDetail{
  String? pincode;
    DateTime? createdAt;
    DateTime? updatedAt;
    DateTime? publishedAt;
    DistrictCityDetail? districtOrCity;
    StateDetail? state;

    CityAndStateDetail({
        this.pincode,
        this.createdAt,
        this.updatedAt,
        this.publishedAt,
        this.districtOrCity,
        this.state,
    });
}