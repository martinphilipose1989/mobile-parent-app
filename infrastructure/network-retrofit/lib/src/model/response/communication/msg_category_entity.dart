import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'msg_category_entity.g.dart';

@JsonSerializable()
class MsgCategoryEntity
    extends BaseLayerDataTransformer<MsgCategoryEntity, MsgCategoryModel> {
  @JsonKey(name: "data")
  List<MsgCategoryEntityDatum>? data;
  @JsonKey(name: "meta")
  MetaEntity? meta;

  MsgCategoryEntity({
    this.data,
    this.meta,
  });

  factory MsgCategoryEntity.fromJson(Map<String, dynamic> json) =>
      _$MsgCategoryEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MsgCategoryEntityToJson(this);

  @override
  MsgCategoryModel transform() {
    // TODO: implement transform
    return MsgCategoryModel(
        data: data
            ?.map(
              (e) => e.transform(),
            )
            .toList(),
        meta: meta?.transform());
  }
}

@JsonSerializable()
class MsgCategoryEntityDatum extends BaseLayerDataTransformer<
    MsgCategoryEntityDatum, MsgCategoryModelDatum> {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "attributes")
  PurpleAttributesEntity? attributes;

  MsgCategoryEntityDatum({
    this.id,
    this.attributes,
  });

  factory MsgCategoryEntityDatum.fromJson(Map<String, dynamic> json) =>
      _$MsgCategoryEntityDatumFromJson(json);

  Map<String, dynamic> toJson() => _$MsgCategoryEntityDatumToJson(this);

  @override
  MsgCategoryModelDatum transform() {
    // TODO: implement transform
    return MsgCategoryModelDatum(attributes: attributes?.transform(), id: id);
  }
}

@JsonSerializable()
class PurpleAttributesEntity
    extends BaseLayerDataTransformer<PurpleAttributesEntity, PurpleAttributes> {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "createdBy")
  CreatedByEntity? createdBy;
  @JsonKey(name: "updatedBy")
  UpdatedByEntity? updatedBy;

  PurpleAttributesEntity({
    this.name,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
  });

  factory PurpleAttributesEntity.fromJson(Map<String, dynamic> json) =>
      _$PurpleAttributesEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleAttributesEntityToJson(this);

  @override
  PurpleAttributes transform() {
    // TODO: implement transform
    return PurpleAttributes(
        createdAt: createdAt,
        createdBy: createdBy?.transform(),
        name: name,
        updatedAt: updatedAt,
        updatedBy: updatedBy?.transform());
  }
}

@JsonSerializable()
class CreatedByEntity
    extends BaseLayerDataTransformer<CreatedByEntity, CreatedBy> {
  @JsonKey(name: "data")
  DataEntity? data;

  CreatedByEntity({
    this.data,
  });

  factory CreatedByEntity.fromJson(Map<String, dynamic> json) =>
      _$CreatedByEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CreatedByEntityToJson(this);

  @override
  CreatedBy transform() {
    // TODO: implement transform
    return CreatedBy(data: data?.transform());
  }
}

@JsonSerializable()
class DataEntity extends BaseLayerDataTransformer<DataEntity, Data> {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "attributes")
  FluffyAttributesEntity? attributes;

  DataEntity({
    this.id,
    this.attributes,
  });

  factory DataEntity.fromJson(Map<String, dynamic> json) =>
      _$DataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DataEntityToJson(this);

  @override
  Data transform() {
    // TODO: implement transform
    return Data(attributes: attributes?.transform(), id: id);
  }
}

@JsonSerializable()
class FluffyAttributesEntity
    extends BaseLayerDataTransformer<FluffyAttributesEntity, FluffyAttributes> {
  @JsonKey(name: "firstname")
  String? firstname;
  @JsonKey(name: "lastname")
  String? lastname;
  @JsonKey(name: "username")
  String? username;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "resetPasswordToken")
  String? resetPasswordToken;
  @JsonKey(name: "registrationToken")
  String? registrationToken;
  @JsonKey(name: "isActive")
  bool? isActive;
  @JsonKey(name: "roles")
  RolesEntity? roles;
  @JsonKey(name: "blocked")
  bool? blocked;
  @JsonKey(name: "preferedLanguage")
  String? preferedLanguage;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "createdBy")
  UpdatedByEntity? createdBy;
  @JsonKey(name: "updatedBy")
  UpdatedByEntity? updatedBy;

  FluffyAttributesEntity({
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

  factory FluffyAttributesEntity.fromJson(Map<String, dynamic> json) =>
      _$FluffyAttributesEntityFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyAttributesEntityToJson(this);

  @override
  FluffyAttributes transform() {
    // TODO: implement transform
    return FluffyAttributes(
        blocked: blocked,
        createdAt: createdAt,
        createdBy: createdBy?.transform(),
        email: email,
        firstname: firstname,
        isActive: isActive,
        lastname: lastname,
        preferedLanguage: preferedLanguage,
        registrationToken: registrationToken,
        resetPasswordToken: resetPasswordToken,
        roles: roles?.transform(),
        updatedAt: updatedAt,
        updatedBy: updatedBy?.transform(),
        username: username);
  }
}

@JsonSerializable()
class UpdatedByEntity
    extends BaseLayerDataTransformer<UpdatedByEntity, UpdatedBy> {
  @JsonKey(name: "data")
  DatEntity? data;

  UpdatedByEntity({
    this.data,
  });

  factory UpdatedByEntity.fromJson(Map<String, dynamic> json) =>
      _$UpdatedByEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UpdatedByEntityToJson(this);

  @override
  UpdatedBy transform() {
    // TODO: implement transform
    return UpdatedBy(data: data?.transform());
  }
}

@JsonSerializable()
class DatEntity extends BaseLayerDataTransformer<DatEntity, Dat> {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "attributes")
  TentacledAttributesEntity? attributes;

  DatEntity({
    this.id,
    this.attributes,
  });

  factory DatEntity.fromJson(Map<String, dynamic> json) =>
      _$DatEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DatEntityToJson(this);

  @override
  Dat transform() {
    // TODO: implement transform
    return Dat(attributes: attributes?.transform(), id: id);
  }
}

@JsonSerializable()
class TentacledAttributesEntity extends BaseLayerDataTransformer<
    TentacledAttributesEntity, TentacledAttributes> {
  TentacledAttributesEntity();
  factory TentacledAttributesEntity.fromJson(Map<String, dynamic> json) =>
      _$TentacledAttributesEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledAttributesEntityToJson(this);

  @override
  TentacledAttributes transform() {
    // TODO: implement transform
    return TentacledAttributes();
  }
}

@JsonSerializable()
class RolesEntity extends BaseLayerDataTransformer<RolesEntity, Roles> {
  @JsonKey(name: "data")
  List<RolesEntityDatum>? data;

  RolesEntity({
    this.data,
  });

  factory RolesEntity.fromJson(Map<String, dynamic> json) =>
      _$RolesEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RolesEntityToJson(this);

  @override
  Roles transform() {
    // TODO: implement transform
    return Roles(
        data: data
            ?.map(
              (e) => e.transform(),
            )
            .toList());
  }
}

@JsonSerializable()
class RolesEntityDatum
    extends BaseLayerDataTransformer<RolesEntityDatum, RolesDatum> {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "attributes")
  StickyAttributesEntity? attributes;

  RolesEntityDatum({
    this.id,
    this.attributes,
  });

  factory RolesEntityDatum.fromJson(Map<String, dynamic> json) =>
      _$RolesEntityDatumFromJson(json);

  Map<String, dynamic> toJson() => _$RolesEntityDatumToJson(this);

  @override
  RolesDatum transform() {
    // TODO: implement transform
    return RolesDatum(attributes: attributes?.transform(), id: id);
  }
}

@JsonSerializable()
class StickyAttributesEntity
    extends BaseLayerDataTransformer<StickyAttributesEntity, StickyAttributes> {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "code")
  String? code;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "users")
  UsersEntity? users;
  @JsonKey(name: "permissions")
  PermissionsEntity? permissions;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "createdBy")
  UpdatedByEntity? createdBy;
  @JsonKey(name: "updatedBy")
  UpdatedByEntity? updatedBy;

  StickyAttributesEntity({
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

  factory StickyAttributesEntity.fromJson(Map<String, dynamic> json) =>
      _$StickyAttributesEntityFromJson(json);

  Map<String, dynamic> toJson() => _$StickyAttributesEntityToJson(this);

  @override
  StickyAttributes transform() {
    // TODO: implement transform
    return StickyAttributes(
        code: code,
        createdAt: createdAt,
        createdBy: createdBy?.transform(),
        description: description,
        name: name,
        permissions: permissions?.transform(),
        updatedAt: updatedAt,
        updatedBy: updatedBy?.transform(),
        users: users?.transform());
  }
}

@JsonSerializable()
class PermissionsEntity
    extends BaseLayerDataTransformer<PermissionsEntity, Permissions> {
  @JsonKey(name: "data")
  List<PermissionsDatumEntity>? data;

  PermissionsEntity({
    this.data,
  });

  factory PermissionsEntity.fromJson(Map<String, dynamic> json) =>
      _$PermissionsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PermissionsEntityToJson(this);

  @override
  Permissions transform() {
    // TODO: implement transform
    return Permissions(
        data: data
            ?.map(
              (e) => e.transform(),
            )
            .toList());
  }
}

@JsonSerializable()
class PermissionsDatumEntity
    extends BaseLayerDataTransformer<PermissionsDatumEntity, PermissionsDatum> {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "attributes")
  IndigoAttributesEntity? attributes;

  PermissionsDatumEntity({
    this.id,
    this.attributes,
  });

  factory PermissionsDatumEntity.fromJson(Map<String, dynamic> json) =>
      _$PermissionsDatumEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PermissionsDatumEntityToJson(this);

  @override
  PermissionsDatum transform() {
    // TODO: implement transform
    return PermissionsDatum(attributes: attributes?.transform(), id: id);
  }
}

@JsonSerializable()
class IndigoAttributesEntity
    extends BaseLayerDataTransformer<IndigoAttributesEntity, IndigoAttributes> {
  @JsonKey(name: "action")
  String? action;
  @JsonKey(name: "actionParameters")
  String? actionParameters;
  @JsonKey(name: "subject")
  String? subject;
  @JsonKey(name: "properties")
  String? properties;
  @JsonKey(name: "conditions")
  String? conditions;
  @JsonKey(name: "role")
  UpdatedByEntity? role;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "createdBy")
  UpdatedByEntity? createdBy;
  @JsonKey(name: "updatedBy")
  UpdatedByEntity? updatedBy;

  IndigoAttributesEntity({
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

  factory IndigoAttributesEntity.fromJson(Map<String, dynamic> json) =>
      _$IndigoAttributesEntityFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoAttributesEntityToJson(this);

  @override
  IndigoAttributes transform() {
    // TODO: implement transform
    return IndigoAttributes(
        action: action,
        actionParameters: actionParameters,
        conditions: conditions,
        createdAt: createdAt,
        createdBy: createdBy?.transform(),
        properties: properties,
        role: role?.transform(),
        subject: subject,
        updatedAt: updatedAt,
        updatedBy: updatedBy?.transform());
  }
}

@JsonSerializable()
class UsersEntity extends BaseLayerDataTransformer<UsersEntity, Users> {
  @JsonKey(name: "data")
  List<DatEntity>? data;

  UsersEntity({
    this.data,
  });

  factory UsersEntity.fromJson(Map<String, dynamic> json) =>
      _$UsersEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UsersEntityToJson(this);

  @override
  Users transform() {
    // TODO: implement transform
    return Users(
        data: data
            ?.map(
              (e) => e.transform(),
            )
            .toList());
  }
}

@JsonSerializable()
class MetaEntity extends BaseLayerDataTransformer<MetaEntity, MsgCategoryMeta> {
  @JsonKey(name: "pagination")
  PaginationEntity? pagination;

  MetaEntity({
    this.pagination,
  });

  factory MetaEntity.fromJson(Map<String, dynamic> json) =>
      _$MetaEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MetaEntityToJson(this);

  @override
  MsgCategoryMeta transform() {
    // TODO: implement transform
    return MsgCategoryMeta(pagination: pagination?.transform());
  }
}

@JsonSerializable()
class PaginationEntity
    extends BaseLayerDataTransformer<PaginationEntity, MsgCategoryPagination> {
  @JsonKey(name: "page")
  int? page;
  @JsonKey(name: "pageSize")
  int? pageSize;
  @JsonKey(name: "pageCount")
  int? pageCount;
  @JsonKey(name: "total")
  int? total;

  PaginationEntity({
    this.page,
    this.pageSize,
    this.pageCount,
    this.total,
  });

  factory PaginationEntity.fromJson(Map<String, dynamic> json) =>
      _$PaginationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationEntityToJson(this);

  @override
  MsgCategoryPagination transform() {
    // TODO: implement transform
    return MsgCategoryPagination(
        page: page, pageCount: pageCount, pageSize: pageSize, total: total);
  }
}
