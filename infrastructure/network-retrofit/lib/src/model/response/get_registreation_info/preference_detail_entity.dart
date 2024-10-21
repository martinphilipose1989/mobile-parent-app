import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'preference_detail_entity.g.dart';

@JsonSerializable(explicitToJson: true,createToJson: false)
class PreferenceDetailEntity extends BaseLayerDataTransformer<PreferenceDetailEntity, PreferenceDetail>{
  @JsonKey(name: 'mobile_of_parent')
  String? mobileOfParent;
  @JsonKey(name: 'mobile')
  String? mobile;
  @JsonKey(name: 'email_of_parent')
  String? emailOfParent;
  @JsonKey(name: 'email')
  String? email;

  PreferenceDetailEntity({
    this.mobileOfParent,
    this.mobile,
    this.emailOfParent,
    this.email,
  });

  factory PreferenceDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$PreferenceDetailEntityFromJson(json);

  Map<String, dynamic> toJson(){
    Map<String,dynamic> request = {};
    void addIfNotEmpty(String key, dynamic value) {
      if (value != null && value != '' && value != "N/A") {
        request[key] = value;
      }
    }

    addIfNotEmpty('mobile_of_parent', mobileOfParent);
    addIfNotEmpty('mobile', mobile);
    addIfNotEmpty('email_of_parent', emailOfParent);
    addIfNotEmpty('email', email);

    return request;
  }

  @override
  PreferenceDetail transform() {
    PreferenceDetail preferenceDetail = PreferenceDetail(
      mobileOfParent: mobileOfParent,
      mobile: mobile,
      emailOfParent: emailOfParent,
      email: email,
    );
    return preferenceDetail;
  }

  @override
  PreferenceDetailEntity restore(PreferenceDetail data) {
    PreferenceDetailEntity preferenceDetailEntity = PreferenceDetailEntity(
      mobileOfParent: data.mobileOfParent,
      mobile: data.mobile,
      emailOfParent: data.emailOfParent,
      email: data.email
    );
    return preferenceDetailEntity;
  }
}
