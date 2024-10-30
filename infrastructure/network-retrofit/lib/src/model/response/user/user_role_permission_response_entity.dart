import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_role_permission_response_entity.g.dart';

@JsonSerializable()
class UserRolePermissionResponseEntity
    implements
        BaseLayerDataTransformer<UserRolePermissionResponseEntity,
            UserRolePermissionResponse> {
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "data")
  UserRolePermissionEntity? data;

  @JsonKey(name: "message")
  String? message;

  UserRolePermissionResponseEntity({this.success, this.data, this.message});

  factory UserRolePermissionResponseEntity.fromJson(
          Map<String, dynamic> json) =>
      _$UserRolePermissionResponseEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$UserRolePermissionResponseEntityToJson(this);

  @override
  UserRolePermissionResponseEntity restore(UserRolePermissionResponse data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  UserRolePermissionResponse transform() {
    return UserRolePermissionResponse(
        data: data?.transform(), message: message, success: success);
  }
}

@JsonSerializable()
class UserRolePermissionEntity
    implements
        BaseLayerDataTransformer<UserRolePermissionEntity,
            UserRolePermissionData> {
  @JsonKey(name: "roleId")
  dynamic roleId;
  @JsonKey(name: "service")
  String? service;
  @JsonKey(name: "permissions")
  List<dynamic>? permissions;
  @JsonKey(name: "user")
  UserRbacEntity? user;

  UserRolePermissionEntity(
      {this.roleId, this.service, this.permissions, this.user});

  factory UserRolePermissionEntity.fromJson(Map<String, dynamic> json) =>
      _$UserRolePermissionEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserRolePermissionEntityToJson(this);

  @override
  UserRolePermissionEntity restore(UserRolePermissionData data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  UserRolePermissionData transform() {
    return UserRolePermissionData(
        roleId: roleId, service: service, user: user?.transform());
  }
}

@JsonSerializable()
class UserRbacEntity
    implements BaseLayerDataTransformer<UserRbacEntity, UserRbacData> {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "first_name")
  String? firstName;
  @JsonKey(name: "last_name")
  String? lastName;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "dob")
  String? dob;
  @JsonKey(name: "mobile_no")
  String? mobileNo;
  @JsonKey(name: "role_id")
  dynamic roleId;
  @JsonKey(name: "status_id")
  int? statusId;

  UserRbacEntity({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.dob,
    this.mobileNo,
    this.roleId,
    this.statusId,
  });

  factory UserRbacEntity.fromJson(Map<String, dynamic> json) =>
      _$UserRbacEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserRbacEntityToJson(this);

  @override
  UserRbacEntity restore(UserRbacData data) {
    return UserRbacEntity();
  }

  @override
  UserRbacData transform() {
    return UserRbacData(
        dob: dob,
        email: email,
        firstName: firstName,
        id: id,
        lastName: lastName,
        mobileNo: mobileNo,
        roleId: roleId,
        statusId: statusId);
  }
}
