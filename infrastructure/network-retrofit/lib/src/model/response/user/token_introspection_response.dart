import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token_introspection_response.g.dart';

@JsonSerializable()
class TokenIntrospectionResponseEntity
    implements
        BaseLayerDataTransformer<TokenIntrospectionResponseEntity,
            TokenIntrospectionResponse> {
  final bool active;
  final String? username;
  final String? exp;
  final String? sub;

  TokenIntrospectionResponseEntity(
      {required this.active, this.username, this.exp, this.sub});

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
        sub: data.sub,
        username: data.username);
  }

  @override
  TokenIntrospectionResponse transform() {
    return TokenIntrospectionResponse(
        active: active, exp: exp, sub: sub, username: username);
  }
}
