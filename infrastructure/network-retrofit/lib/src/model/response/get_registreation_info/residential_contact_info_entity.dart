import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'residential_contact_info_entity.g.dart';

@JsonSerializable(explicitToJson: true,createPerFieldToJson: false)
class ResidentialAddressContactInfoEntity extends BaseLayerDataTransformer<ResidentialAddressContactInfoEntity,ResidentialAddressContactInfo>{
  @JsonKey(name: 'house')
  String? house;
  @JsonKey(name: 'street')
  String? street;
  @JsonKey(name: 'landmark')
  String? landmark;
  @JsonKey(name: 'country')
  String? country;
  @JsonKey(name: 'state')
  String? state;
  @JsonKey(name: 'city')
  String? city;
  @JsonKey(name: 'pincode')
  String? pincode;
  @JsonKey(name: 'isPermanentAddress')
  bool? isPermanentAddress;

  ResidentialAddressContactInfoEntity({
    this.house,
    this.street,
    this.landmark,
    this.country,
    this.state,
    this.city,
    this.pincode,
    this.isPermanentAddress,
  });

  factory ResidentialAddressContactInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$ResidentialAddressContactInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => {
    "house": house,
    "street": street,
    "landmark": landmark,
    "country": country,
    "pin_code": pincode,
    "state": state,
    "city": city,
    "is_permanent_address": isPermanentAddress
  };

  @override
  ResidentialAddressContactInfo transform() {
    ResidentialAddressContactInfo residentialAddressContactInfo = ResidentialAddressContactInfo();
    residentialAddressContactInfo.house = house;
    residentialAddressContactInfo.street = street;
    residentialAddressContactInfo.landmark = landmark;
    residentialAddressContactInfo.country = country;
    residentialAddressContactInfo.state = state;
    residentialAddressContactInfo.city = city;
    residentialAddressContactInfo.pincode = pincode;
    residentialAddressContactInfo.isPermanentAddress = isPermanentAddress;
    return residentialAddressContactInfo;
  }

  @override
  ResidentialAddressContactInfoEntity restore(ResidentialAddressContactInfo data) {
    ResidentialAddressContactInfoEntity residentialAddressContactInfoEntity = ResidentialAddressContactInfoEntity(
      house: data.house,
      street: data.street,
      landmark: data.landmark,
      country: data.country,
      state: data.state,
      city: data.city,
      pincode: data.pincode,
      isPermanentAddress: data.isPermanentAddress,
    );  
    return residentialAddressContactInfoEntity;
  }
}