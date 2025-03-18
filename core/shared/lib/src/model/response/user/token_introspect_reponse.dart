// ignore_for_file: public_member_api_docs, sort_constructors_first
class TokenIntrospectionResponse {
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
  final RealmAccess? realmAccess;
  final ResourceAccess? resourceAccess;
  final String? scope;
  final String? sid;
  final String? clientId;
  final String? username;

  TokenIntrospectionResponse({
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

  @override
  String toString() {
    return 'TokenIntrospectionResponse(active: $active, exp: $exp, iat: $iat, authTime: $authTime, jti: $jti, iss: $iss, aud: $aud, sub: $sub, typ: $typ, azp: $azp, nonce: $nonce, sessionState: $sessionState, name: $name, givenName: $givenName, familyName: $familyName, preferredUsername: $preferredUsername, email: $email, emailVerified: $emailVerified, acr: $acr, allowedOrigins: $allowedOrigins, realmAccess: $realmAccess, resourceAccess: $resourceAccess, scope: $scope, sid: $sid, clientId: $clientId, username: $username)';
  }
}

class RealmAccess {
  final List<String> roles;

  RealmAccess({required this.roles});

  @override
  String toString() => 'RealmAccess(roles: $roles)';
}

class ResourceAccess {
  final AccountAccess account;

  ResourceAccess({required this.account});

  @override
  String toString() => 'ResourceAccess(account: $account)';
}

class AccountAccess {
  final List<String> roles;

  AccountAccess({required this.roles});

  @override
  String toString() => 'AccountAccess(roles: $roles)';
}
