class MsgCategoryModel {
  List<MsgCategoryModelDatum>? data;
  MsgCategoryMeta? meta;

  MsgCategoryModel({
    this.data,
    this.meta,
  });
}

class MsgCategoryModelDatum {
  int? id;
  PurpleAttributes? attributes;

  MsgCategoryModelDatum({
    this.id,
    this.attributes,
  });
}

class PurpleAttributes {
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;
  CreatedBy? createdBy;
  UpdatedBy? updatedBy;

  PurpleAttributes({
    this.name,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
  });
}

class CreatedBy {
  Data? data;

  CreatedBy({
    this.data,
  });
}

class Data {
  int? id;
  FluffyAttributes? attributes;

  Data({
    this.id,
    this.attributes,
  });
}

class FluffyAttributes {
  String? firstname;
  String? lastname;
  String? username;
  String? email;
  String? resetPasswordToken;
  String? registrationToken;
  bool? isActive;
  Roles? roles;
  bool? blocked;
  String? preferedLanguage;
  DateTime? createdAt;
  DateTime? updatedAt;
  UpdatedBy? createdBy;
  UpdatedBy? updatedBy;

  FluffyAttributes({
    this.firstname,
    this.lastname,
    this.username,
    this.email,
    this.resetPasswordToken,
    this.registrationToken,
    this.isActive,
    this.roles,
    this.blocked,
    this.preferedLanguage,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
  });
}

class UpdatedBy {
  Dat? data;

  UpdatedBy({
    this.data,
  });
}

class Dat {
  int? id;
  TentacledAttributes? attributes;

  Dat({
    this.id,
    this.attributes,
  });
}

class TentacledAttributes {
  TentacledAttributes();
}

class Roles {
  List<RolesDatum>? data;

  Roles({
    this.data,
  });
}

class RolesDatum {
  int? id;
  StickyAttributes? attributes;

  RolesDatum({
    this.id,
    this.attributes,
  });
}

class StickyAttributes {
  String? name;
  String? code;
  String? description;
  Users? users;
  Permissions? permissions;
  DateTime? createdAt;
  DateTime? updatedAt;
  UpdatedBy? createdBy;
  UpdatedBy? updatedBy;

  StickyAttributes({
    this.name,
    this.code,
    this.description,
    this.users,
    this.permissions,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
  });
}

class Permissions {
  List<PermissionsDatum>? data;

  Permissions({
    this.data,
  });
}

class PermissionsDatum {
  int? id;
  IndigoAttributes? attributes;

  PermissionsDatum({
    this.id,
    this.attributes,
  });
}

class IndigoAttributes {
  String? action;
  String? actionParameters;
  String? subject;
  String? properties;
  String? conditions;
  UpdatedBy? role;
  DateTime? createdAt;
  DateTime? updatedAt;
  UpdatedBy? createdBy;
  UpdatedBy? updatedBy;

  IndigoAttributes({
    this.action,
    this.actionParameters,
    this.subject,
    this.properties,
    this.conditions,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
  });
}

class Users {
  List<Dat>? data;

  Users({
    this.data,
  });
}

class MsgCategoryMeta {
  MsgCategoryPagination? pagination;

  MsgCategoryMeta({
    this.pagination,
  });
}

class MsgCategoryPagination {
  int? page;
  int? pageSize;
  int? pageCount;
  int? total;

  MsgCategoryPagination({
    this.page,
    this.pageSize,
    this.pageCount,
    this.total,
  });
}
