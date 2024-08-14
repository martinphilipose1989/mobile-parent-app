import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/get_new_admission/common_data_entity.dart';

part 'residential_address_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class ResidentialAddressEntity extends BaseLayerDataTransformer<ResidentialAddressEntity,ResidentialAddress>{
    @JsonKey(name: 'house')
    dynamic house;
    @JsonKey(name: 'street')
    dynamic street;
    @JsonKey(name: 'landmark')
    dynamic landmark;
    @JsonKey(name: 'country')
    CommonDataEntity? country;
    @JsonKey(name: 'pinCode')
    dynamic pinCode;
    @JsonKey(name: 'state')
    CommonDataEntity? state;
    @JsonKey(name: 'city')
    CommonDataEntity? city;
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

  Map<String, dynamic> toJson() => _$ResidentialAddressEntityToJson(this);

  @override
  ResidentialAddress transform() {
    ResidentialAddress residentialAddress = ResidentialAddress();
    residentialAddress.city = city?.transform();
    residentialAddress.country = country?.transform();
    residentialAddress.house = house;
    residentialAddress.isPermanentAddress = isPermanentAddress;
    residentialAddress.landmark = landmark;
    residentialAddress.pinCode = pinCode;
    residentialAddress.state = state?.transform();
    residentialAddress.street = street;
    return residentialAddress;
  }

}