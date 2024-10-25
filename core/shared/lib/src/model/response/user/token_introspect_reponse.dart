class TokenIntrospectionResponse {
  final bool active;
  final String? username;
  final String? exp;
  final String? sub;

  TokenIntrospectionResponse(
      {required this.active, this.username, this.exp, this.sub});
}
