import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/get_new_admission/residential_address_entity.dart';

part 'residential_address_detail_entity.g.dart';

@JsonSerializable(explicitToJson: true,createToJson: false)
class ResidentialAddressDetailEntity extends BaseLayerDataTransformer<ResidentialAddressDetailEntity,ResidentialAddressDetail>{
 ResidentialAddressEntity? currentAddress;
 ResidentialAddressEntity? permanentAddress; 

 ResidentialAddressDetailEntity({
  this.currentAddress,
  this.permanentAddress
 });

 factory ResidentialAddressDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$ResidentialAddressDetailEntityFromJson(json);

  Map<String, dynamic> toJson() {
    Map<String,dynamic> request = {};
    request.addAll({"currentAddress": currentAddress?.toJson()});
    if(permanentAddress != null){
      request.addAll({"permanentAddress": permanentAddress?.toJson()});
    }
    return request;
  }
  
  @override
  ResidentialAddressDetail transform() {
    ResidentialAddressDetail residentialAddressDetail = ResidentialAddressDetail();
    residentialAddressDetail.currentAddress = currentAddress?.transform();
    residentialAddressDetail.permanentAddress = permanentAddress?.transform();
    return residentialAddressDetail;
  }

  @override
  ResidentialAddressDetailEntity restore(ResidentialAddressDetail data) {
    ResidentialAddressEntity residentialAddressEntity = ResidentialAddressEntity();
    ResidentialAddressDetailEntity residentialAddressDetailEntity = ResidentialAddressDetailEntity(
      currentAddress: residentialAddressEntity.restore(data.currentAddress??ResidentialAddress()),
      permanentAddress: residentialAddressEntity.restore(data.permanentAddress??ResidentialAddress())
    );
    return residentialAddressDetailEntity;
  }
}