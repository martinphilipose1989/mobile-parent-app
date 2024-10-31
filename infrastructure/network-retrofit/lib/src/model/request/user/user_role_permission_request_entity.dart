import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_role_permission_request_entity.g.dart';

@JsonSerializable()
class UserRolePermissionRequestEntity
    implements
        BaseLayerDataTransformer<UserRolePermissionRequestEntity,
            UserRolePermissionRequest> {
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "service")
  String? service;

  UserRolePermissionRequestEntity({this.email, this.service});

  factory UserRolePermissionRequestEntity.fromJson(Map<String, dynamic> json) =>
      _$UserRolePermissionRequestEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$UserRolePermissionRequestEntityToJson(this);

  @override
  UserRolePermissionRequestEntity restore(UserRolePermissionRequest data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  UserRolePermissionRequest transform() {
    return UserRolePermissionRequest(email: email, service: service);
  }
}
