import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_qrcode_request.g.dart';

@JsonSerializable()
class CreateQrcodeRequestEntity
    implements
        BaseLayerDataTransformer<CreateQrcodeRequestEntity,
            CreateQrcodeRequestModel> {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "mobile")
  String? mobile;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "profile_image")
  String? profileImage;

  CreateQrcodeRequestEntity(
      {this.name, this.mobile, this.email, this.profileImage});

  factory CreateQrcodeRequestEntity.fromJson(Map<String, dynamic> json) =>
      _$CreateQrcodeRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CreateQrcodeRequestEntityToJson(this);

  @override
  CreateQrcodeRequestEntity restore(CreateQrcodeRequestModel data) {
    return CreateQrcodeRequestEntity(
        email: data.email,
        mobile: data.mobile,
        name: data.name,
        profileImage: data.profileImage);
  }

  @override
  CreateQrcodeRequestModel transform() {
    return CreateQrcodeRequestModel(
        email: email, mobile: mobile, name: name, profileImage: profileImage);
  }
}
