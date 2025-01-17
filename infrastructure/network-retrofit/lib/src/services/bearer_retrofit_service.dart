
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';


import '../model/response/transport/bearer_list_response_entity.dart';
part 'bearer_retrofit_service.g.dart';

const String _getBearerList =
    "/transport-service/mobile-app/bearer-list/{studentId}";





@RestApi()
abstract class BearerRetorfitService {
  factory BearerRetorfitService(Dio dio, {String? bearerBaseUrl}) {
    return _BearerRetorfitService(
      dio,
      baseUrl: bearerBaseUrl,
    );
  }


  @GET(_getBearerList)
  Future<HttpResponse<GetBearerListResponseEntity>> getBearerList(
      @Path('studentId') int studentId);

}