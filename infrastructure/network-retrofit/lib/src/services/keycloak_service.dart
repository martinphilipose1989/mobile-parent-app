import 'package:dio/dio.dart';
import 'package:network_retrofit/src/model/response/user/token_introspection_response.dart';
import 'package:retrofit/retrofit.dart';

part 'keycloak_service.g.dart';

@RestApi()
abstract class KeyCloakService {
  static const _introSpect = "token/introspect";

  factory KeyCloakService(Dio dio, {String? keyCloak}) {
    return _KeyCloakService(dio, baseUrl: keyCloak);
  }

  @POST(_introSpect)
  @FormUrlEncoded()
  Future<HttpResponse<TokenIntrospectionResponseEntity>> introspectToken(
      @Field("token") String token,
      @Field("client_id") String clientId,
      @Field("client_secret") String clientSecret);
}
