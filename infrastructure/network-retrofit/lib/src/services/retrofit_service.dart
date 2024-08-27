import 'package:dio/dio.dart';
import 'package:network_retrofit/src/model/request/finance/get_academic_year_request.dart';
import 'package:network_retrofit/src/model/request/finance/get_guardian_student_details_request.dart';
import 'package:network_retrofit/src/model/request/finance/get_pending_fees_request.dart';
import 'package:network_retrofit/src/model/request/finance/get_school_name_request.dart';
import 'package:network_retrofit/src/model/request/finance/get_siblings_request.dart';
import 'package:network_retrofit/src/model/request/finance/get_token_generator_request.dart';
import 'package:network_retrofit/src/model/request/finance/get_validate_pay_now_request.dart';
import 'package:network_retrofit/src/model/request/finance/store_payment/get_store_payment_request.dart';
import 'package:network_retrofit/src/model/response/finance/get_academic_year/get_academic_year_response_entity.dart';
import 'package:network_retrofit/src/model/response/finance/get_guardian_student_details/get_guardian_student_details_entity.dart';
import 'package:network_retrofit/src/model/response/finance/get_pending_fees/get_pending_fees_entity.dart';
import 'package:network_retrofit/src/model/response/finance/get_school_names/get_school_names_response.dart';
import 'package:network_retrofit/src/model/response/finance/get_store_payment/get_store_payment_response_entity.dart';
import 'package:network_retrofit/src/model/response/finance/get_token_generator/get_token_generator_response_entity.dart';
import 'package:network_retrofit/src/model/response/finance/get_transaction_type/get_transaction_type_entity.dart';
import 'package:network_retrofit/src/model/response/finance/get_validate_on_pay/get_validate_on_pay_entity.dart';
import 'package:network_retrofit/src/util/network_properties.dart';
import 'package:retrofit/retrofit.dart';

import '../model/response/finance/get_sibling_list/get_sibling_list_response_entity.dart';

part 'retrofit_service.g.dart';

@RestApi()
abstract class RetrofitService {
  factory RetrofitService(Dio dio, {String? baseUrl}) {
    return _RetrofitService(dio, baseUrl: dio.options.baseUrl);
  }

  @POST('${NetworkProperties.mdmBaseUrl}/api/ac-students/list-siblings')
  Future<HttpResponse<GetsibglingListResponseEntity>> getSiblingsList(
      @Body() GetSiblingsRequest getSiblingsRequest);

  @POST(
      '${NetworkProperties.financeBaseUrl}/finance/fee_collection/get-academic-years')
  Future<HttpResponse<GetAcademicYearResponseEntity>> getAcademicYear(
      @Body() GetAcademicYearRequest getAcademicYearRequest);

  @POST(
      '${NetworkProperties.mdmBaseUrl}/api/global-number-generators/3/generator')
  Future<HttpResponse<GetTokenGeneratorResponseEntity>> getTokenGenerator(
      @Body() GetTokenGeneratorRequest getTokenGeneratorRequest);

  @POST(
      '${NetworkProperties.financeBaseUrl}/finance/fee_payment/validate_payment_for_fees')
  Future<HttpResponse<GetValidateOnPayEntity>> getValidatePayNow(
      @Body() GetValidatePayNowRequest getValidatePayNowRequest);

  @POST(
      '${NetworkProperties.financeBaseUrl}/finance/fee_payment/store_fee_payment')
  Future<HttpResponse<GetStorePaymentResponseEntity>> getStorePayment(
      @Body() GetStorePaymentRequest getStorePaymentRequest);

  @POST('${NetworkProperties.mdmBaseUrl}/api/guardian-student-details')
  Future<HttpResponse<GetGuardianStudentDetailsEntity>>
      getGuardianStudentDetails(
          @Body()
          GetGuardianStudentDetailsRequest getGuardianStudentDetailsRequest);

  @POST(
      '${NetworkProperties.financeBaseUrl}/finance/fee_collection/fee_details')
  Future<HttpResponse<GetPendingFeesEntity>> getPendingFees(
      @Body() GetPendingFeesRequest getPendingFeesRequest);

  @POST(
      '${NetworkProperties.financeBaseUrl}/finance/transactions/brand_codes/mobile/list')
  Future<HttpResponse<SchoolNamesEntity>> getSchoolNames(
      @Body() SchoolNamesRequest schoolNamesRequest);

  @GET('${NetworkProperties.financeBaseUrl}/finance/transactions/payments/{id}')
  Future<HttpResponse<GetTransactionTypeEntity>> getTransactionType(
      @Path('id') int id);
}
