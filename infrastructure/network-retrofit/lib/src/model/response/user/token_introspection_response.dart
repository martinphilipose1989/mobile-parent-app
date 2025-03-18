import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token_introspection_response.g.dart';

@JsonSerializable()
class TokenIntrospectionResponseEntity
    implements
        BaseLayerDataTransformer<TokenIntrospectionResponseEntity,
            TokenIntrospectionResponse> {
  final bool active;
  final int? exp;
  final int? iat;
  final int? authTime;
  final String? jti;
  final String? iss;
  final String? aud;
  final String? sub;
  final String? typ;
  final String? azp;
  final String? nonce;
  final String? sessionState;
  final String? name;
  final String? givenName;
  final String? familyName;
  final String? preferredUsername;
  final String? email;
  final bool? emailVerified;
  final String? acr;
  final List<String>? allowedOrigins;
  final RealmAccessEntity? realmAccess;
  final ResourceAccessEntity? resourceAccess;
  final String? scope;
  final String? sid;
  final String? clientId;
  final String? username;

  TokenIntrospectionResponseEntity({
    required this.active,
    this.exp,
    this.iat,
    this.authTime,
    this.jti,
    this.iss,
    this.aud,
    this.sub,
    this.typ,
    this.azp,
    this.nonce,
    this.sessionState,
    this.name,
    this.givenName,
    this.familyName,
    this.preferredUsername,
    this.email,
    this.emailVerified,
    this.acr,
    this.allowedOrigins,
    this.realmAccess,
    this.resourceAccess,
    this.scope,
    this.sid,
    this.clientId,
    this.username,
  });

  factory TokenIntrospectionResponseEntity.fromJson(
          Map<String, dynamic> json) =>
      _$TokenIntrospectionResponseEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TokenIntrospectionResponseEntityToJson(this);

  @override
  TokenIntrospectionResponseEntity restore(TokenIntrospectionResponse data) {
    return TokenIntrospectionResponseEntity(
      active: data.active,
      exp: data.exp,
      iat: data.iat,
      authTime: data.authTime,
      jti: data.jti,
      iss: data.iss,
      aud: data.aud,
      sub: data.sub,
      typ: data.typ,
      azp: data.azp,
      nonce: data.nonce,
      sessionState: data.sessionState,
      name: data.name,
      givenName: data.givenName,
      familyName: data.familyName,
      preferredUsername: data.preferredUsername,
      email: data.email,
      emailVerified: data.emailVerified,
      acr: data.acr,
      allowedOrigins: data.allowedOrigins,
      realmAccess: RealmAccessEntity(roles: data.realmAccess?.roles ?? []),
      resourceAccess: ResourceAccessEntity(
        account: AccountAccessEntity(
          roles: data.resourceAccess?.account.roles ?? [],
        ),
      ),
      scope: data.scope,
      sid: data.sid,
      clientId: data.clientId,
      username: data.username,
    );
  }

  @override
  TokenIntrospectionResponse transform() {
    return TokenIntrospectionResponse(
      active: active,
      exp: exp,
      iat: iat,
      authTime: authTime,
      jti: jti,
      iss: iss,
      aud: aud,
      sub: sub,
      typ: typ,
      azp: azp,
      nonce: nonce,
      sessionState: sessionState,
      name: name,
      givenName: givenName,
      familyName: familyName,
      preferredUsername: preferredUsername,
      email: email,
      emailVerified: emailVerified,
      acr: acr,
      allowedOrigins: allowedOrigins,
      realmAccess: realmAccess?.transform(),
      resourceAccess: resourceAccess?.transform(),
      scope: scope,
      sid: sid,
      clientId: clientId,
      username: username,
    );
  }
}

@JsonSerializable()
class RealmAccessEntity
    implements BaseLayerDataTransformer<RealmAccessEntity, RealmAccess> {
  final List<String> roles;

  RealmAccessEntity({required this.roles});

  factory RealmAccessEntity.fromJson(Map<String, dynamic> json) =>
      _$RealmAccessEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RealmAccessEntityToJson(this);

  @override
  RealmAccessEntity restore(RealmAccess data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  RealmAccess transform() {
    return RealmAccess(roles: roles);
  }
}

@JsonSerializable()
class ResourceAccessEntity
    implements BaseLayerDataTransformer<ResourceAccessEntity, ResourceAccess> {
  final AccountAccessEntity account;

  ResourceAccessEntity({required this.account});

  factory ResourceAccessEntity.fromJson(Map<String, dynamic> json) =>
      _$ResourceAccessEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceAccessEntityToJson(this);

  @override
  ResourceAccessEntity restore(ResourceAccess data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  ResourceAccess transform() {
    return ResourceAccess(account: account.transform());
  }
}

@JsonSerializable()
class AccountAccessEntity
    implements BaseLayerDataTransformer<AccountAccessEntity, AccountAccess> {
  final List<String> roles;

  AccountAccessEntity({required this.roles});

  factory AccountAccessEntity.fromJson(Map<String, dynamic> json) =>
      _$AccountAccessEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AccountAccessEntityToJson(this);

  @override
  AccountAccessEntity restore(AccountAccess data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  AccountAccess transform() {
    return AccountAccess(roles: roles);
  }
}
