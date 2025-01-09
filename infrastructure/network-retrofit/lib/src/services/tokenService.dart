import 'package:dio/dio.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:network_retrofit/src/model/request/notification/sendTokenRequestEntity.dart';
import 'package:network_retrofit/src/model/response/admin/student_detail/student_detail_response_entity.dart';
import 'package:network_retrofit/src/model/response/get_sibling_detail/sibling_profile_response_entity.dart';
import 'package:network_retrofit/src/model/response/get_subject_list/subject_list_response_entity.dart';
import 'package:network_retrofit/src/model/response/notification/sendTokenResponseEntity.dart';
import '../model/response/admin/get_couponse_list/get_coupons_response_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'tokenService.g.dart';

@RestApi()
abstract class TokenRetrofitService {
  factory TokenRetrofitService(Dio dio,
      {String? baseUrl, String? mdmBaseUrl}) {
    return _TokenRetrofitService(
      dio,
      baseUrl: mdmBaseUrl,
    );
  }





  @PUT('/api/co-global-users/{id}')
  Future<HttpResponse<SendTokenResponseEntity>> sendToken(

      {    @Path('id') required int userId,

        @Body() required SendTokenRequestEntity sendTokenRequestEntity});


}
