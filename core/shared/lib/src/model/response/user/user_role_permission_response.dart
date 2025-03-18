// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserRolePermissionResponse {
  bool? success;
  UserRolePermissionData? data;

  String? message;

  UserRolePermissionResponse({this.success, this.data, this.message});

  @override
  String toString() => 'UserRolePermissionResponse(success: $success, data: $data, message: $message)';
}

class UserRolePermissionData {
  dynamic roleId;
  String? service;
  List<dynamic>? permissions;
  UserRbacData? user;

  UserRolePermissionData(
      {this.roleId, this.service, this.permissions, this.user});

  @override
  String toString() {
    return 'UserRolePermissionData(roleId: $roleId, service: $service, permissions: $permissions, user: $user)';
  }
}

class UserRbacData {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? dob;
  String? mobileNo;
  dynamic roleId;
  int? statusId;

  UserRbacData(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.dob,
      this.mobileNo,
      this.roleId,
      this.statusId});

  @override
  String toString() {
    return 'UserRbacData(id: $id, firstName: $firstName, lastName: $lastName, email: $email, dob: $dob, mobileNo: $mobileNo, roleId: $roleId, statusId: $statusId)';
  }
}
