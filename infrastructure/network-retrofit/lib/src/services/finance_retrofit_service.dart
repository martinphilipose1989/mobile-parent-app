import 'dart:io';

import 'package:dio/dio.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:network_retrofit/src/model/request/finance/cancel_payment_order_request.dart';
import 'package:network_retrofit/src/model/request/finance/download_student_ledger/download_student_ledger.dart';
import 'package:network_retrofit/src/model/request/finance/new_enrolment/new_enrolment_create.dart';
import 'package:network_retrofit/src/model/request/undertaking/undertaking.dart';
import 'package:network_retrofit/src/model/response/new_enrolment/new_enrolment_response.dart';
import 'package:network_retrofit/src/model/response/terms_and_condition/term_and_condition.dart';
import 'package:network_retrofit/src/model/response/undertaking/undertaking.dart';
import 'package:network_retrofit/src/model/response/vas_option/vas_option_response_entity.dart';
import '../model/request/finance/get_academic_year_request.dart';
import 'package:network_retrofit/src/model/request/finance/get_payment_status_request.dart';
import 'package:network_retrofit/src/model/request/finance/get_pending_fees_request.dart';
import 'package:network_retrofit/src/model/request/finance/get_school_name_request.dart';
import 'package:network_retrofit/src/model/request/finance/get_transaction_type_fees_collectes_request.dart';
import 'package:network_retrofit/src/model/request/finance/get_validate_pay_now_request.dart';
import 'package:network_retrofit/src/model/request/finance/payment_order/payment_order_request.dart';
import 'package:network_retrofit/src/model/request/finance/store_payment/get_store_payment_request.dart';
import 'package:network_retrofit/src/model/response/finance/get_academic_year/get_academic_year_response_entity.dart';
import 'package:network_retrofit/src/model/response/finance/get_payment_order/get_payment_order_entity.dart';
import 'package:network_retrofit/src/model/response/finance/get_pending_fees/get_pending_fees_entity.dart';
import 'package:network_retrofit/src/model/response/finance/get_school_names/get_school_names_response.dart';
import 'package:network_retrofit/src/model/response/finance/get_store_image/get_store_image_entity.dart';
import 'package:network_retrofit/src/model/response/finance/get_store_payment/get_store_payment_response_entity.dart';
import 'package:network_retrofit/src/model/response/finance/get_transaction_fees_collected/get_transaction_fees_collected_entity.dart';
import 'package:network_retrofit/src/model/response/finance/get_transaction_type/get_transaction_type_entity.dart';
import 'package:network_retrofit/src/model/response/finance/get_validate_on_pay/get_validate_on_pay_entity.dart';
import 'package:network_retrofit/src/model/response/finance/payment_status/payment_status_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'finance_retrofit_service.g.dart';

@RestApi()
abstract class FinanceRetrofitService {
  factory FinanceRetrofitService(Dio dio, {String? financeBaseUrl}) {
    return _FinanceRetrofitService(dio, baseUrl: financeBaseUrl);
  }
  @POST('/finance/fee_collection/get-academic-years?platform=app')
  Future<HttpResponse<GetAcademicYearResponseEntity>> getAcademicYear(
      @Body() GetAcademicYearRequest getAcademicYearRequest);

  @POST('/finance/fee_payment/validate_payment_for_fees?platform=app')
  Future<HttpResponse<GetValidateOnPayEntity>> getValidatePayNow(
      @Body() GetValidatePayNowRequest getValidatePayNowRequest);

  @POST('/finance/fee_payment/store_fee_payment?platform=app')
  Future<HttpResponse<GetStorePaymentResponseEntity>> getStorePayment(
      @Body() GetStorePaymentRequest getStorePaymentRequest);

  @POST('/finance/fee_collection/fee_details?platform=app')
  Future<HttpResponse<GetPendingFeesEntity>> getPendingFees(
      @Body() GetPendingFeesRequest getPendingFeesRequest);

  @POST('/finance/transactions/brand_codes/mobile/list?platform=app')
  Future<HttpResponse<SchoolNamesEntity>> getSchoolNames(
      @Body() SchoolNamesRequest schoolNamesRequest);

  @GET('/finance/transactions/payments/{id}')
  Future<HttpResponse<GetTransactionTypeEntity>> getTransactionType(
      @Path('id') int id, @Query('platform') String app);

  @POST('/finance/transactions/fees_collected?platform=app')
  Future<HttpResponse<GetTransactiontypefeesCollectedEntity>>
      getTransactionTypeFeesCollected(
          @Body()
          GetTransactionTypeFeesCollectesRequest
              getTransactionTypeFeesCollectesRequest);

  @POST('/finance/payment/order?platform=app')
  Future<HttpResponse<GetPaymentOrderEntity>> getPaymentOrder(
      @Body() PaymentOrderRequestModel paymentOrderRequestModel);

  @POST('/finance/transactions/store_file?platform=app')
  @MultiPart()
  Future<HttpResponse<GetStoreImageEntity>> setStoreImage(
      {@Part(name: 'file') required File file,
      @Part(name: 'fileName') required String fileName});

  @POST('/finance/payment/fetch-status/orderId?platform=app')
  Future<HttpResponse<PaymentStatusEntity>> getPaymentStatus(
      @Body() GetPaymentStatusRequest getPaymentStatusRequest);

  @POST('/finance/fee_payment/finance/calculate?platform=app')
  Future<HttpResponse<VasOptionResponseEntity>> calculateFee(
      {@Body()
      required VasEnrollmentFeeCalculationRequest feeCalculationRequest});

  @POST('/finance/payment/failure')
  Future<HttpResponse<dynamic>> cancelPaymentRequest(
      @Query('paymentgateway') String paymentGateway,
      @Body() CancelPaymentRequestEntity cancelPaymentRequestEntity);

  // ************* Payment History ************ //

  // Transaction Type
  @GET("/finance/transactions/receipt/{id}")
  @DioResponseType(ResponseType.bytes)
  Future<HttpResponse<List<int>>> downloadTransactionHistory(
      @Path("id") String id, @Query("file_type") String fileType);

  // Fee Type Transactions
  @GET("/finance/student-fees/transactions/{url_key}")
  @DioResponseType(ResponseType.bytes)
  Future<HttpResponse<List<int>>> downloadFeeTypeTransactions(
      @Path("url_key") String urlKey);

  // Ledger
  @POST("/finance/student-fees/export-data")
  @DioResponseType(ResponseType.bytes)
  Future<HttpResponse<List<int>>> downloadStudentLedger(
      @Body() StudentLedgerDownloadRequestEntity body);

  // ************* new enrolment ************ //
  @POST('/finance/transactions/student/fee/bulk-create')
  Future<HttpResponse<NewEnrolmentResponseEntity>> newEnrolment(
      @Body() NewEnrolmentCreateEntity request);

  // ************ terms and condition ******** //
  @GET('/finance/transactions/link/file')
  Future<HttpResponse<TermsAndConditionsFileEntity>> getTermsAndConditionFile(
      @Query("fileName") String fileName);

  @POST("/finance/transactions/undertakingTaken")
  Future<HttpResponse<UndertakingResponseEntity>> underTakingStudent(
      @Body() UndertakingRequestEntity body);
}
