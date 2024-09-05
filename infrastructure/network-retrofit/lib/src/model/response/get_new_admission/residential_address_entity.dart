import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/get_new_admission/common_data_entity.dart';

part 'residential_address_entity.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: false)
class ResidentialAddressEntity extends BaseLayerDataTransformer<ResidentialAddressEntity,ResidentialAddress>{
    @JsonKey(name: 'house')
    String? house;
    @JsonKey(name: 'street')
    String? street;
    @JsonKey(name: 'landmark')
    String? landmark;
    @JsonKey(name: 'country',fromJson: _fromJson)
    dynamic country;
    @JsonKey(name: 'pinCode')
    String? pinCode;
    @JsonKey(name: 'state',fromJson: _fromJson)
    dynamic state;
    @JsonKey(name: 'city',fromJson: _fromJson)
    dynamic city;
    @JsonKey(name: 'is_permanent_address')
    bool? isPermanentAddress;

    ResidentialAddressEntity({
      this.house,
      this.street,
      this.landmark,
      this.country,
      this.pinCode,
      this.state,
      this.city,
      this.isPermanentAddress,
    });

  factory ResidentialAddressEntity.fromJson(Map<String, dynamic> json) =>
      _$ResidentialAddressEntityFromJson(json);

  Map<String, dynamic> toJson() {
    return {
      "house": house,
      "street": street,
      "landmark": landmark,
      "country": (country is CommonDataEntity) ? country.toJson() : country,
      "pin_code": pinCode,
      "state": (state is CommonDataEntity) ? state.toJson() : state,
      "city": (city is CommonDataEntity) ? city.toJson() : city,
      "is_permanent_address": isPermanentAddress
    };
  }

  static dynamic _fromJson(dynamic data){
    if(data is Map<String,dynamic>){
      return CommonDataEntity.fromJson(data);
    }
    else{
      return data;
    }
  }

  @override
  ResidentialAddress transform() {
    ResidentialAddress residentialAddress = ResidentialAddress();
    residentialAddress.city = (city is CommonDataEntity) ? city?.transform() : city;
    residentialAddress.country = (country is CommonDataEntity) ? country?.transform() : country;
    residentialAddress.house = house;
    residentialAddress.isPermanentAddress = isPermanentAddress;
    residentialAddress.landmark = landmark;
    residentialAddress.pinCode = pinCode;
    residentialAddress.state = (state is CommonDataEntity) ? state?.transform() : state;
    residentialAddress.street = street;
    return residentialAddress;
  }

  @override
  ResidentialAddressEntity restore(ResidentialAddress data) {
    CommonDataEntity commonDataEntity = CommonDataEntity();
    ResidentialAddressEntity residentialAddressEntity = ResidentialAddressEntity(
      house: data.house,
      street: data.street,
      landmark: data.landmark,
      country: commonDataEntity.restore(data.country??CommonDataClass()),
      pinCode: data.pinCode,
      state: commonDataEntity.restore(data.state??CommonDataClass()),
      city: commonDataEntity.restore(data.city??CommonDataClass()),
      isPermanentAddress: data.isPermanentAddress,
    );  
    return residentialAddressEntity;
  }

}