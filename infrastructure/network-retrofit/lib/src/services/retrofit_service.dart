import 'dart:io';

import 'package:dio/dio.dart';
import 'package:network_retrofit/src/model/request/fetch_stop_request.dart';
import 'package:network_retrofit/src/model/request/finance/get_academic_year_request.dart';
import 'package:network_retrofit/src/model/request/finance/get_guardian_student_details_request.dart';
import 'package:network_retrofit/src/model/request/finance/get_pending_fees_request.dart';
import 'package:network_retrofit/src/model/request/finance/get_school_name_request.dart';
import 'package:network_retrofit/src/model/request/finance/get_siblings_request.dart';
import 'package:network_retrofit/src/model/request/finance/get_token_generator_request.dart';
import 'package:network_retrofit/src/model/request/finance/get_validate_pay_now_request.dart';
import 'package:network_retrofit/src/model/request/finance/store_payment/get_store_payment_request.dart';
import 'package:network_retrofit/src/model/request/gatepass/create_qrcode_request.dart';
import 'package:network_retrofit/src/model/response/cafeteria_enrollment_detail/cafeteria_enrollment_response_entity.dart';
import 'package:network_retrofit/src/model/response/fetch_stops/fetch_stops_response_entity.dart';
import 'package:network_retrofit/src/model/response/finance/get_academic_year/get_academic_year_response_entity.dart';
import 'package:network_retrofit/src/model/response/finance/get_guardian_student_details/get_guardian_student_details_entity.dart';
import 'package:network_retrofit/src/model/response/finance/get_pending_fees/get_pending_fees_entity.dart';
import 'package:network_retrofit/src/model/response/finance/get_school_names/get_school_names_response.dart';
import 'package:network_retrofit/src/model/response/finance/get_store_payment/get_store_payment_response_entity.dart';
import 'package:network_retrofit/src/model/response/finance/get_token_generator/get_token_generator_response_entity.dart';
import 'package:network_retrofit/src/model/response/finance/get_validate_on_pay/get_validate_on_pay_entity.dart';
import 'package:network_retrofit/src/model/response/gatepass/create_qrcode_response.dart';
import 'package:network_retrofit/src/model/response/get_sibling_detail/sibling_profile_response_entity.dart';
import 'package:network_retrofit/src/model/response/get_subject_list/subject_list_response_entity.dart';
import 'package:network_retrofit/src/model/response/kids_club_enrollment_detail/kids_club_enrollment_response_entity.dart';
import 'package:network_retrofit/src/model/response/mdm_response/mdm_base_response_entity.dart';
import 'package:network_retrofit/src/model/response/psa_enrollment_detail/psa_enrollment_detail_response_entity.dart';
import 'package:network_retrofit/src/model/response/slots_detail/slots_entity.dart';
import 'package:network_retrofit/src/model/response/subject_selection/subject_detail_response_entity.dart';
import 'package:network_retrofit/src/model/response/transport_enrollment_detail/transport_enrollment_response_entity.dart';
import 'package:network_retrofit/src/model/response/user/token_introspection_response.dart';
import 'package:network_retrofit/src/model/response/summer_camp_enrollment_detail/summer_camp_enrollment_response_entity.dart';
import 'package:network_retrofit/src/model/response/vas_option/vas_option_response_entity.dart';
import 'package:network_retrofit/src/util/network_properties.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:network_retrofit/src/model/response/admission_list/admission_list_response_entity.dart';
import 'package:network_retrofit/src/model/response/competency_test_detail/competency_test_detail_response_entity.dart';
import 'package:network_retrofit/src/model/response/enquiry_file_upload/delete_enquiry_file_response_entity.dart';
import 'package:network_retrofit/src/model/response/enquiry_file_upload/download_enquiry_file_response_entity.dart';
import 'package:network_retrofit/src/model/response/enquiry_file_upload/enquiry_file_upload_response_entity.dart';
import 'package:network_retrofit/src/model/response/enquiry_timeline.dart/enquiry_timeline_response_entity.dart';
import 'package:network_retrofit/src/model/response/get_admission_journey/admission_journey_base_entity.dart';
import 'package:network_retrofit/src/model/response/get_enquiry_detail/enquiry_response_entity.dart';
import 'package:network_retrofit/src/model/response/get_ivt_detail/ivt_base_response_entity.dart';
import 'package:network_retrofit/src/model/response/get_new_admission/new_admission_entity.dart';
import 'package:network_retrofit/src/model/response/get_psa_detail/psa_base_response_entity.dart';
import 'package:network_retrofit/src/model/response/schoo_visit/school_visit_entity.dart';

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

  @GET(
      '${NetworkProperties.marketingBaseURL}marketing/app/enquiry/enquiry-list')
  Future<HttpResponse<EnquiryListResponseEntity>> getEnquiryList(
      {@Query('phone') required String phone,
      @Query('pageNumber') required int pageNumber,
      @Query('pageSize') required int pageSize});

  @GET('${NetworkProperties.marketingBaseURL}marketing/app/enquiry/{enquiryID}')
  Future<HttpResponse<EnquiryResponseEntity>> getEnquiryDetail({
    @Path('enquiryID') required String enquiryID,
  });

  @GET(
      '${NetworkProperties.marketingBaseURL}marketing/enquiry/{enquiryID}/timeline')
  Future<HttpResponse<EnquiryTimeLineResponseEntity>> getEnquiryTimeline({
    @Path('enquiryID') required String enquiryID,
  });

  @GET(
      '${NetworkProperties.marketingBaseURL}marketing/app/enquiry/{enquiryID}/admission-journey')
  Future<HttpResponse<AdmissionJourneyBaseEntity>> getAdmissionJourney(
      {@Path('enquiryID') required String enquiryID,
      @Query('type') required String type});

  @GET(
      '${NetworkProperties.marketingBaseURL}marketing/app/enquiry/{enquiryID}/new-admission')
  Future<HttpResponse<NewAdmissionEntity>> getNewAdmissionDetail(
      {@Path('enquiryID') required String enquiryID});

  @PATCH(
      '${NetworkProperties.marketingBaseURL}marketing/app/enquiry/{enquiryID}/new-admission')
  Future<HttpResponse<NewAdmissionEntity>> updateNewAdmissionDetail(
      {@Path('enquiryID') required String enquiryID,
      @Body() required NewAdmissionDetailEntity newAdmissionDetail});

  @GET(
      '${NetworkProperties.marketingBaseURL}marketing/app/enquiry/{enquiryID}/psa')
  Future<HttpResponse<PsaBaseResponseEntity>> getPsaDetail(
      {@Path('enquiryID') required String enquiryID});

  @PATCH(
      '${NetworkProperties.marketingBaseURL}marketing/app/enquiry/{enquiryID}/psa')
  Future<HttpResponse<PsaBaseResponseEntity>> updatePsaDetail(
      {@Path('enquiryID') required String enquiryID,
      @Body() required PsaDetailResponseEntity psaDetail});

  @GET(
      '${NetworkProperties.marketingBaseURL}marketing/app/enquiry/{enquiryID}/ivt')
  Future<HttpResponse<IvtBaseResponseEntity>> getIvtDetail(
      {@Path('enquiryID') required String enquiryID});

  @PATCH(
      '${NetworkProperties.marketingBaseURL}marketing/app/enquiry/{enquiryID}/ivt')
  Future<HttpResponse<IvtBaseResponseEntity>> updateIvtDetail(
      {@Path('enquiryID') required String enquiryID,
      @Body() required IvtDetailResponseEntity ivtDetail});

  @GET(
      '${NetworkProperties.marketingBaseURL}marketing/school-visit/{enquiryID}')
  Future<HttpResponse<SchoolVisitEntity>> getSchoolVisitDetail(
      {@Path('enquiryID') required String enquiryID});

  @POST(
      '${NetworkProperties.marketingBaseURL}marketing/school-visit/{enquiryId}/schedule')
  Future<HttpResponse<SchoolVisitEntity>> createSchoolVisit(
      {@Path('enquiryId') required String enquiryID,
      @Body() required SchoolCreationRequest schoolCreationRequest});

  @POST(
      '${NetworkProperties.marketingBaseURL}marketing/school-visit/{enquiryID}/reschedule')
  Future<HttpResponse<SchoolVisitEntity>> rescheduleSchoolVisit(
      {@Path('enquiryID') required String schoolVisitID,
      @Body() required RescheduleSchoolVisitRequest schoolCreationRequest});

  @POST(
      '${NetworkProperties.marketingBaseURL}marketing/school-visit/{enquiryID}/cancel')
  Future<HttpResponse<SchoolVisitEntity>> cancelSchoolVisit(
      {@Path('enquiryID') required String enquiryID,
      @Body() required SchoolVisitCancelRequest schoolVisitCancelRequest});

  @GET(
      '${NetworkProperties.marketingBaseURL}marketing/app/enquiry/admission-list')
  Future<HttpResponse<AdmissionListResponseEntity>> getAdmissionList(
      {@Query('phone') required String phone,
      @Query('pageNumber') required int pageNumber,
      @Query('pageSize') required int pageSize});

  @GET(
      '${NetworkProperties.marketingBaseURL}marketing/competency-test/{enquiryId}')
  Future<HttpResponse<CompetencyTestDetailResponseEntity>>
      getCompetencyTestDetail({
    @Path('enquiryId') required String enquiryID,
  });

  @POST(
      '${NetworkProperties.marketingBaseURL}marketing/competency-test/{enquiryID}/create')
  Future<HttpResponse<CompetencyTestDetailResponseEntity>> createCompetencyTest(
      {@Path('enquiryID') required String enquiryID,
      @Body()
      required CompetencyTestCreationRequest competencyTestCreationRequest});

  @POST(
      '${NetworkProperties.marketingBaseURL}marketing/competency-test/{enquiryID}/reschedule')
  Future<HttpResponse<CompetencyTestDetailResponseEntity>>
      rescheduleCompetencyTest(
          {@Path('enquiryID') required String enquiryID,
          @Body()
          required CompetencyTestRescheduleRequest
              competencyTestCreationRequest});

  @POST(
      '${NetworkProperties.marketingBaseURL}marketing/competency-test/{enquiryID}/cancel')
  Future<HttpResponse<CompetencyTestDetailResponseEntity>> cancelCompetencyTest(
      {@Path('enquiryID') required String enquiryID,
      @Body()
      required CancelCompetencyTestRequest cancelCompetencyTestRequest});

  @GET(
      '${NetworkProperties.marketingBaseURL}marketing/enquiry/{enquiryID}/document/{documentID}')
  Future<HttpResponse<DownloadEnquiryFileResponseEntity>>
      downloadEnquiryDocument(
          {@Path('enquiryID') required String enquiryID,
          @Path('documentID') required String documentID});

  @GET('{file_url}')
  @DioResponseType(ResponseType.bytes)
  Future<HttpResponse<List<int>>> downloadFile(
      {@Path('file_url') required String fileUrl});

  @PATCH(
      '${NetworkProperties.marketingBaseURL}marketing/enquiry/{enquiryID}/document/{documentID}/delete')
  Future<HttpResponse<DeleteEnquiryFileResponseEntity>> deleteEnquiryDocument(
      {@Path('enquiryID') required String enquiryID,
      @Path('documentID') required String documentID});

  @POST(
      '${NetworkProperties.marketingBaseURL}marketing/enquiry/{enquiryID}/upload-document/{documentID}')
  @MultiPart()
  Future<HttpResponse<EnquiryFileUploadResponseEntity>> uploadEnquiryDocument({
    @Path('enquiryID') required String enquiryID,
    @Path('documentID') required String documentID,
    @Part(name: 'file') required File file,
  });

  @PATCH(
      '${NetworkProperties.marketingBaseURL}marketing/app/registration/{enquiryId}/parent-details')
  Future<HttpResponse<SingleResponse>> updateParentDetails(
      {@Path('enquiryId') required String enquiryId,
      @Body() required ParentInfoEntity parentInfo});

  @PATCH(
      '${NetworkProperties.marketingBaseURL}marketing/app/registration/{enquiryId}/contact-details')
  Future<HttpResponse<SingleResponse>> updateContactDetails(
      {@Path('enquiryId') required String enquiryId,
      @Body() required ContactDetailsEntity contactDetails});

  @PATCH(
      '${NetworkProperties.marketingBaseURL}marketing/app/registration/{enquiryId}/medical-details')
  Future<HttpResponse<SingleResponse>> updateMedicalDetails(
      {@Path('enquiryId') required String enquiryId,
      @Body() required MedicalDetailsEntity medicalDetails});

  @PATCH(
      '${NetworkProperties.marketingBaseURL}marketing/app/registration/{enquiryId}/bank-details')
  Future<HttpResponse<SingleResponse>> updateBankDetails(
      {@Path('enquiryId') required String enquiryId,
      @Body() required BankDetailsEntity bankDetails});

  @GET(
      '${NetworkProperties.marketingBaseURL}marketing/app/registration/{enquiryId}')
  Future<HttpResponse<SingleResponse>> getRegistrationDetail({
    @Path("enquiryId") required String enquiryId,
    @Query("infoType") required String infoType,
  });

  @GET('${NetworkProperties.marketingBaseURL}marketing/school-visit/slots')
  Future<HttpResponse<SlotsEntity>> getSchoolVisitSlots({
    @Query("enquiryId") required String enquiryId,
    @Query("date") required String date,
  });

  @GET('${NetworkProperties.marketingBaseURL}marketing/competency-test/slots')
  Future<HttpResponse<SlotsEntity>> getCompetencyTestSlots({
    @Query("enquiryId") required String enquiryId,
    @Query("date") required String date,
  });

  @GET('${NetworkProperties.mdmBaseUrl}${NetworkProperties.schoolLocation}')
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getSchoolLocation({
    @Header("Authorization") required String token,
    @Query("fields") List<String> field1 = const ["name", "short_name"],
  });

  @GET('${NetworkProperties.mdmBaseUrl}${NetworkProperties.schoolBoard}')
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getSchoolBoard({
    @Header("Authorization") required String token,
    @Query("fields[1]") String field1 = "name",
    @Query("fields[2]") String field2 = "short_name",
    @Query("short") String short = "id",
  });

  @GET('${NetworkProperties.mdmBaseUrl}${NetworkProperties.grade}')
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getGrades({
    @Header("Authorization") required String token,
    @Query("fields[1]") String field1 = "name",
    @Query("fields[2]") String field2 = "short_name",
    @Query("short") String short = "order",
  });

  @GET('${NetworkProperties.mdmBaseUrl}${NetworkProperties.gender}')
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getGender({
    @Header("Authorization") required String token,
    @Query("fields[1]") String field1 = "name",
    @Query("fields[2]") String field2 = "short_name",
    @Query("short") String short = "order",
  });

  @GET('${NetworkProperties.mdmBaseUrl}${NetworkProperties.cources}')
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getCourses({
    @Header("Authorization") required String token,
    @Query("fields[1]") String field1 = "name",
    @Query("fields[2]") String field2 = "short_name",
    @Query("short") String short = "id",
  });

  @GET('${NetworkProperties.mdmBaseUrl}${NetworkProperties.countries}')
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getCountries({
    @Header("Authorization") required String token,
    @Query("fields[1]") String field1 = "name",
    @Query("fields[2]") String field2 = "number_code",
    @Query("short") String short = "id",
    @Query("sort") String sort = "id:asc",
  });

  @GET('${NetworkProperties.mdmBaseUrl}${NetworkProperties.states}')
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getStates({
    @Header("Authorization") required String token,
    @Query("fields[1]") String field1 = "name",
    @Query("fields[2]") String field2 = "Shortform",
  });

  @GET('${NetworkProperties.mdmBaseUrl}${NetworkProperties.city}')
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getCities({
    @Header("Authorization") required String token,
    @Query("fields[1]") String field1 = "name",
    @Query("fields[2]") String field2 = "Shortform",
  });

  @GET('${NetworkProperties.mdmBaseUrl}${NetworkProperties.batch}')
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getBatch({
    @Header("Authorization") required String token,
    @Query("fields[1]") String field1 = "name",
    @Query("fields[2]") String field2 = "short_name",
  });

  @GET('${NetworkProperties.mdmBaseUrl}${NetworkProperties.shifts}')
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getShifts({
    @Header("Authorization") required String token,
    @Query("fields[1]") String field1 = "name",
    @Query("fields[2]") String field2 = "short_name",
    @Query("short") String short = "id",
  });

  @GET('${NetworkProperties.mdmBaseUrl}${NetworkProperties.stream}')
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getStreams({
    @Header("Authorization") required String token,
    @Query("fields[1]") String field1 = "name",
    @Query("fields[2]") String field2 = "short_name",
    @Query("short") String short = "id",
  });

  @GET('${NetworkProperties.mdmBaseUrl}${NetworkProperties.cancelationReason}')
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getCancellationReason({
    @Header("Authorization") required String token,
    @Query("fields") String field1 = "reason",
    @Query("short") String short = "id",
  });

  @GET('${NetworkProperties.mdmBaseUrl}${NetworkProperties.psaSubType}')
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getPsaSubType(
      {@Header("Authorization") required String token});

  @GET('${NetworkProperties.mdmBaseUrl}${NetworkProperties.psaCategory}')
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getPsaCategory(
      {@Header("Authorization") required String token});

  @GET('${NetworkProperties.mdmBaseUrl}${NetworkProperties.psaSubCategory}')
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getPsaSubCategory(
      {@Header("Authorization") required String token});

  @GET('${NetworkProperties.mdmBaseUrl}${NetworkProperties.periodOfService}')
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getPeriodOfService(
      {@Header("Authorization") required String token});

  @GET('${NetworkProperties.mdmBaseUrl}${NetworkProperties.academicYear}')
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getAcademicYearAttribute(
      {@Header("Authorization") required String token});

  @GET('${NetworkProperties.mdmBaseUrl}${NetworkProperties.bloodGroup}')
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getBloodGroupAttribute(
      {@Header("Authorization") required String token});

  @GET('${NetworkProperties.mdmBaseUrl}${NetworkProperties.occupation}')
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getOccupationAttribute(
      {@Header("Authorization") required String token});

  @POST(NetworkProperties.enrollmentDetail)
  Future<HttpResponse<SiblingProfileResponseEntity>> getSiblingDetail(
      {@Body() required GetSiblingDetailRequest getSiblingDetailRequest});

  @POST(
      '${NetworkProperties.marketingBaseURL}marketing/admission/{enquiryId}/subject-details')
  Future<HttpResponse<SubjectDetailResponseEntity>> selectOptionalSubject(
      {@Body() required List<SubjectSelectionRequest> subjectSelectionRequest,
      @Path("enquiryId") required String enquiryID});

  @POST(
      '${NetworkProperties.marketingBaseURL}marketing/admission/{enquiryId}/vas-options')
  Future<HttpResponse<VasOptionResponseEntity>> addVASOption(
      {@Body() required VasOptionRequest vasOptionRequest,
      @Path("enquiryId") required String enquiryID});

  @POST(NetworkProperties.requestGatePass)
  Future<HttpResponse<CreateQrcodeResponseEntity>> requestGatePass(
      @Body() CreateQrcodeRequestEntity requestBody);

  // key cloak
  @POST(NetworkProperties.tokenIntroSpect)
  @FormUrlEncoded()
  Future<HttpResponse<TokenIntrospectionResponseEntity>> introspectToken(
      @Field("token") String token,
      @Field("client_id") String clientId,
      @Field("client_secret") String clientSecret);

  @POST(NetworkProperties.subjetcList)
  Future<HttpResponse<SubjectListResponseEntity>> getSubjectList(
    {@Body() required SubjectListingRequest subjectListingRequest,}
  );

  @POST('${NetworkProperties.mdmBaseUrl}/api/fc-fees-masters/psa-details')
  Future<HttpResponse<PsaEnrollmentDetailResponseEntity>> getPsaEnrollmentDetail(
    {@Body() required VasDetailRequest psaEnrollmentDetailRequest,}
  ); 

  @POST('${NetworkProperties.mdmBaseUrl}/api/fc-fees-masters/cafeteria-details')
  Future<HttpResponse<CafeteriaEnrollmentResponseEntity>> getCafeteriaEnrollmentDetail({
    @Body() required VasDetailRequest cafeteriaEnrollmentDetail
  }); 

  @POST('${NetworkProperties.mdmBaseUrl}/api/fc-fees-masters/summer-camp-details')
  Future<HttpResponse<SummerCampEnrollmentResponseEntity>> getSummerCampEnrollmentDetail({
    @Header("Authorization") required String token,
    @Body() required VasDetailRequest summerCampEnrollmentDetail
  });

  @POST('${NetworkProperties.mdmBaseUrl}/api/fc-fees-masters/kids-club-details')
  Future<HttpResponse<KidsClubEnrollmentResponseEntity>> getKidsClubEnrollmentDetail({
    @Body() required VasDetailRequest kidsClubEnrollmentDetail
  });

  @POST('${NetworkProperties.mdmBaseUrl}/api/fc-fees-masters/transport-details')
  Future<HttpResponse<TransportEnrollmentResponseEntity>> getTransportEnrollmentDetail({
    @Header("Authorization") required String token,
    @Body() required VasDetailRequest transportEnrollmentDetail
  });

  @POST('${NetworkProperties.financeBaseUrl}/finance/fee_payment/finance/calculate')
  Future<HttpResponse<VasOptionResponseEntity>> calculateFee({
    @Body() required VasEnrollmentFeeCalculationRequest feeCalculationRequest
  });

  @POST('${NetworkProperties.marketingBaseURL}marketing/admission/{enquiryId}/vas/add')
  Future<HttpResponse<VasOptionResponseEntity>> addVASDetail(
      {@Body() required VasEnrollmentRequest vasEnrollmentRequest,
      @Path("enquiryId") required String enquiryID,
      @Query("type") required String type});

  @POST('${NetworkProperties.marketingBaseURL}marketing/admission/{enquiryId}/vas/remove')
  Future<HttpResponse<VasOptionResponseEntity>> removeVasDetail(
      {@Path("enquiryId") required String enquiryID,
      @Query("type") required String type});

  @POST('${NetworkProperties.marketingBaseURL}marketing/admission/{enquiryId}/payment-request')
  Future<HttpResponse<VasOptionResponseEntity>> makePaymentRequest(
      {@Path("enquiryId") required String enquiryID,});

  @POST('${NetworkProperties.transportBaseURL}transport-service/route/fetch-stops')
  Future<HttpResponse<FetchStopResponseEntity>> fetchStops({
    @Body() required FetchStopRequest fetchStopRequest
  });
}

