import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/get_registreation_info/contact_details_entity.dart';

part 'contact_info_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class ContactInfoEntity extends BaseLayerDataTransformer<ContactInfoEntity,ContactInfo>{
    @JsonKey(name: 'status')
    int? status;
    @JsonKey(name: 'data')
    ContactDetailsEntity? data;
    @JsonKey(name: 'message')
    String? message;

    ContactInfoEntity({
        this.status,
        this.data,
        this.message,
    });
  factory ContactInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$ContactInfoEntityFromJson(json);

    Map<String, dynamic> toJson() => _$ContactInfoEntityToJson(this);
  
  @override
  ContactInfo transform() {
    ContactInfo contactInfo = ContactInfo();
    contactInfo.status = status;
    contactInfo.data = data?.transform();
    contactInfo.message = message;
    return contactInfo;
  }

}