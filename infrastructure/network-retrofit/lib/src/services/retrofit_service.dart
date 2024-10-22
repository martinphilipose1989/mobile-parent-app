import 'package:dio/dio.dart';
import 'package:network_retrofit/src/model/request/finance/get_guardian_student_details_request.dart';
import 'package:network_retrofit/src/model/request/finance/get_siblings_request.dart';
import 'package:network_retrofit/src/model/request/finance/get_token_generator_request.dart';
import 'package:network_retrofit/src/model/response/communication/msg_category_entity.dart';
import 'package:network_retrofit/src/model/response/communication/msg_sub_category_entity.dart';
import 'package:network_retrofit/src/model/response/finance/get_guardian_student_details/get_guardian_student_details_entity.dart';
import 'package:network_retrofit/src/model/response/finance/get_token_generator/get_token_generator_response_entity.dart';
import 'package:network_retrofit/src/util/network_properties.dart';
import 'package:retrofit/retrofit.dart';

import '../model/response/finance/get_sibling_list/get_sibling_list_response_entity.dart';

part 'retrofit_service.g.dart';

@RestApi()
abstract class RetrofitService {
  factory RetrofitService(Dio dio,
      {String? baseUrl, String? mdmBaseUrl, String? financeBaseUrl}) {
    return _RetrofitService(
      dio,
      baseUrl: mdmBaseUrl,
    );
  }

  @POST('/api/ac-students/list-siblings')
  Future<HttpResponse<GetsibglingListResponseEntity>> getSiblingsList(
      @Body() GetSiblingsRequest getSiblingsRequest);

  @POST('/api/global-number-generators/3/generator')
  Future<HttpResponse<GetTokenGeneratorResponseEntity>> getTokenGenerator(
      @Body() GetTokenGeneratorRequest getTokenGeneratorRequest);

  @POST('/api/guardian-student-details')
  Future<HttpResponse<GetGuardianStudentDetailsEntity>>
      getGuardianStudentDetails(
          @Body()
          GetGuardianStudentDetailsRequest getGuardianStudentDetailsRequest);

  @GET('/api/msg-categories')
  Future<HttpResponse<MsgCategoryEntity>>
  createCategory();

  @GET('/api/msg-sub-categories')
  Future<HttpResponse<MsgSubCategoryEntity>>
  createSubCategory();
}
