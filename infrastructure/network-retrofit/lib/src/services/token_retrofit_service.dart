import 'package:dio/dio.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:network_retrofit/src/model/request/notification/sendTokenRequestEntity.dart';

import 'package:network_retrofit/src/model/response/notification/sendTokenResponseEntity.dart';

import 'package:retrofit/retrofit.dart';

part 'token_retrofit_service.g.dart';

@RestApi()
abstract class TokenRetrofitService {
  factory TokenRetrofitService(Dio dio, {String? baseUrl, String? mdmBaseUrl}) {
    return _TokenRetrofitService(dio, baseUrl: mdmBaseUrl);
  }

  @PUT('/api/co-global-users/{id}')
  Future<HttpResponse<SendTokenResponseEntity>> sendToken(
      {@Path('id') required int userId,
      @Body() required SendTokenRequestEntity sendTokenRequestEntity});
}
