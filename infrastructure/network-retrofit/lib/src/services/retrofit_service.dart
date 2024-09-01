import 'package:dio/dio.dart';
import 'package:network_retrofit/src/model/request/gatepass/create_qrcode_request.dart';
import 'package:network_retrofit/src/model/response/gatepass/create_qrcode_response.dart';
import 'package:network_retrofit/src/util/network_properties.dart';
import 'package:retrofit/retrofit.dart';

part 'retrofit_service.g.dart';

@RestApi()
abstract class RetrofitService {
  factory RetrofitService(Dio dio, {String? baseUrl}) {
    return _RetrofitService(dio, baseUrl: dio.options.baseUrl);
  }

  @POST(NetworkProperties.requestGatePass)
  Future<HttpResponse<CreateQrcodeResponseEntity>> requestGatePass(
      @Body() CreateQrcodeRequestEntity requestBody);
}
