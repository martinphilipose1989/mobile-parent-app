import 'dart:io';

import 'package:dio/dio.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:network_retrofit/src/model/request/move_next_stage_request.dart';
import 'package:network_retrofit/src/model/response/admission_list/admission_list_response_entity.dart';
import 'package:network_retrofit/src/model/response/admission_vas/admission_vas_response_entity.dart';
import 'package:network_retrofit/src/model/response/competency_test_detail/competency_test_detail_response_entity.dart';
import 'package:network_retrofit/src/model/response/enquiry_file_upload/delete_enquiry_file_response_entity.dart';
import 'package:network_retrofit/src/model/response/enquiry_file_upload/download_enquiry_file_response_entity.dart';
import 'package:network_retrofit/src/model/response/enquiry_file_upload/enquiry_file_upload_response_entity.dart';
import 'package:network_retrofit/src/model/response/enquiry_timeline.dart/enquiry_timeline_response_entity.dart';
import 'package:network_retrofit/src/model/response/get_admission_journey/admission_journey_base_entity.dart';
import 'package:network_retrofit/src/model/response/get_enquiry_detail/enquiry_response_entity.dart';
import 'package:network_retrofit/src/model/response/get_enquiry_detail/enquiry_stage_update.dart';
import 'package:network_retrofit/src/model/response/get_ivt_detail/ivt_base_response_entity.dart';
import 'package:network_retrofit/src/model/response/get_new_admission/new_admission_entity.dart';
import 'package:network_retrofit/src/model/response/get_psa_detail/psa_base_response_entity.dart';
import 'package:network_retrofit/src/model/response/schoo_visit/school_visit_entity.dart';
import 'package:network_retrofit/src/model/response/slots_detail/slots_entity.dart';
import 'package:network_retrofit/src/model/response/subject_selection/subject_detail_response_entity.dart';
import 'package:network_retrofit/src/model/response/vas_option/vas_option_response_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'marketing_retrofit_serivce.g.dart';

@RestApi()
abstract class MarketingSerivce {
  factory MarketingSerivce(Dio dio, {String? marketingUrl}) {
    return _MarketingSerivce(dio, baseUrl: marketingUrl);
  }

  @GET('marketing/app/enquiry/enquiry-list')
  Future<HttpResponse<EnquiryListResponseEntity>> getEnquiryList(
      {@Query('phone') required String phone,
      @Query('pageNumber') required int pageNumber,
      @Query('pageSize') required int pageSize,
      @Query('status') required String status});

  @GET('marketing/app/enquiry/{enquiryID}')
  Future<HttpResponse<EnquiryResponseEntity>> getEnquiryDetail({
    @Path('enquiryID') required String enquiryID,
  });

  @GET('marketing/enquiry/{enquiryID}/timeline')
  Future<HttpResponse<EnquiryTimeLineResponseEntity>> getEnquiryTimeline({
    @Path('enquiryID') required String enquiryID,
  });

  @GET('marketing/app/enquiry/{enquiryID}/admission-journey')
  Future<HttpResponse<AdmissionJourneyBaseEntity>> getAdmissionJourney(
      {@Path('enquiryID') required String enquiryID,
      @Query('type') required String type});

  @GET('marketing/app/enquiry/{enquiryID}/new-admission')
  Future<HttpResponse<NewAdmissionEntity>> getNewAdmissionDetail(
      {@Path('enquiryID') required String enquiryID});

  @PATCH('marketing/app/enquiry/{enquiryID}/new-admission')
  Future<HttpResponse<NewAdmissionEntity>> updateNewAdmissionDetail(
      {@Path('enquiryID') required String enquiryID,
      @Body() required NewAdmissionDetailEntity newAdmissionDetail});

  @GET('marketing/app/enquiry/{enquiryID}/psa')
  Future<HttpResponse<PsaBaseResponseEntity>> getPsaDetail(
      {@Path('enquiryID') required String enquiryID});

  @PATCH('marketing/app/enquiry/{enquiryID}/psa')
  Future<HttpResponse<PsaBaseResponseEntity>> updatePsaDetail(
      {@Path('enquiryID') required String enquiryID,
      @Body() required PsaDetailResponseEntity psaDetail});

  @GET('marketing/app/enquiry/{enquiryID}/kids-club')
  Future<HttpResponse<IvtBaseResponseEntity>> getIvtDetail(
      {@Path('enquiryID') required String enquiryID});

  @PATCH('marketing/app/enquiry/{enquiryID}/kids-club')
  Future<HttpResponse<IvtBaseResponseEntity>> updateIvtDetail(
      {@Path('enquiryID') required String enquiryID,
      @Body() required IvtDetailResponseEntity ivtDetail});

  @GET('marketing/school-visit/{enquiryID}')
  Future<HttpResponse<SchoolVisitEntity>> getSchoolVisitDetail(
      {@Path('enquiryID') required String enquiryID,
      @Query('platform') required String platform});

  @POST('marketing/school-visit/{enquiryId}/schedule')
  Future<HttpResponse<SchoolVisitEntity>> createSchoolVisit(
      {@Path('enquiryId') required String enquiryID,
      @Body() required SchoolCreationRequest schoolCreationRequest,
      @Query('platform') required String platform});

  @POST('marketing/school-visit/{enquiryID}/reschedule')
  Future<HttpResponse<SchoolVisitEntity>> rescheduleSchoolVisit(
      {@Path('enquiryID') required String schoolVisitID,
      @Body() required RescheduleSchoolVisitRequest schoolCreationRequest,
      @Query('platform') required String platform});

  @POST('marketing/school-visit/{enquiryID}/cancel')
  Future<HttpResponse<SchoolVisitEntity>> cancelSchoolVisit(
      {@Path('enquiryID') required String enquiryID,
      @Body() required SchoolVisitCancelRequest schoolVisitCancelRequest,
      @Query('platform') required String platform});

  @GET('marketing/app/enquiry/admission-list')
  Future<HttpResponse<AdmissionListResponseEntity>> getAdmissionList(
      {@Query('phone') required String phone,
      @Query('pageNumber') required int pageNumber,
      @Query('pageSize') required int pageSize,
      @Query('status') required String status,
      @Query('platform') required String platform});

  @GET('marketing/competency-test/{enquiryId}')
  Future<HttpResponse<CompetencyTestDetailResponseEntity>>
      getCompetencyTestDetail(
          {@Path('enquiryId') required String enquiryID,
          @Query('platform') required String platform});

  @POST('marketing/competency-test/{enquiryID}/create')
  Future<HttpResponse<CompetencyTestDetailResponseEntity>> createCompetencyTest(
      {@Path('enquiryID') required String enquiryID,
      @Body()
      required CompetencyTestCreationRequest competencyTestCreationRequest,
      @Query('platform') required String platform});

  @POST('marketing/competency-test/{enquiryID}/reschedule')
  Future<HttpResponse<CompetencyTestDetailResponseEntity>>
      rescheduleCompetencyTest(
          {@Path('enquiryID') required String enquiryID,
          @Body()
          required CompetencyTestRescheduleRequest
              competencyTestCreationRequest,
          @Query('platform') required String platform});

  @POST('marketing/competency-test/{enquiryID}/cancel')
  Future<HttpResponse<CompetencyTestDetailResponseEntity>> cancelCompetencyTest(
      {@Path('enquiryID') required String enquiryID,
      @Body() required CancelCompetencyTestRequest cancelCompetencyTestRequest,
      @Query('platform') required String platform});

  @GET('marketing/enquiry/{enquiryID}/document/{documentID}')
  Future<HttpResponse<DownloadEnquiryFileResponseEntity>>
      downloadEnquiryDocument(
          {@Path('enquiryID') required String enquiryID,
          @Path('documentID') required String documentID,
          @Query('download') required String download});

  @GET('{file_url}')
  @DioResponseType(ResponseType.bytes)
  Future<HttpResponse<List<int>>> downloadFile(
      {@Path('file_url') required String fileUrl});

  @PATCH('marketing/enquiry/{enquiryID}/document/{documentID}')
  Future<HttpResponse<DeleteEnquiryFileResponseEntity>> deleteEnquiryDocument(
      {@Path('enquiryID') required String enquiryID,
      @Path('documentID') required String documentID,
      @Query('delete') required String delete,
      @Query('verify') required String verify});

  @POST('marketing/enquiry/{enquiryID}/upload-document/{documentID}')
  @MultiPart()
  Future<HttpResponse<EnquiryFileUploadResponseEntity>> uploadEnquiryDocument({
    @Path('enquiryID') required String enquiryID,
    @Path('documentID') required String documentID,
    @Part(name: 'file') required File file,
  });

  @PATCH('marketing/app/registration/{enquiryId}/parent-details')
  Future<HttpResponse<SingleResponse>> updateParentDetails(
      {@Path('enquiryId') required String enquiryId,
      @Body() required ParentInfoEntity parentInfo});

  @PATCH('marketing/app/registration/{enquiryId}/contact-details')
  Future<HttpResponse<SingleResponse>> updateContactDetails(
      {@Path('enquiryId') required String enquiryId,
      @Body() required ContactDetailsEntity contactDetails});

  @PATCH('marketing/app/registration/{enquiryId}/medical-details')
  Future<HttpResponse<SingleResponse>> updateMedicalDetails(
      {@Path('enquiryId') required String enquiryId,
      @Body() required MedicalDetailsEntity medicalDetails});

  @PATCH('marketing/app/registration/{enquiryId}/bank-details')
  Future<HttpResponse<SingleResponse>> updateBankDetails(
      {@Path('enquiryId') required String enquiryId,
      @Body() required BankDetailsEntity bankDetails});

  @GET('marketing/app/registration/{enquiryId}')
  Future<HttpResponse<SingleResponse>> getRegistrationDetail({
    @Path("enquiryId") required String enquiryId,
    @Query("infoType") required String infoType,
  });

  @GET('marketing/school-visit/slots')
  Future<HttpResponse<SlotsEntity>> getSchoolVisitSlots(
      {@Query("enquiryId") required String enquiryId,
      @Query("date") required String date,
      @Query('platform') required String platform});

  @GET('marketing/competency-test/slots')
  Future<HttpResponse<SlotsEntity>> getCompetencyTestSlots(
      {@Query("enquiryId") required String enquiryId,
      @Query("date") required String date,
      @Query('platform') required String platform});

  @POST('marketing/admission/{enquiryId}/subject-details')
  Future<HttpResponse<SubjectDetailResponseEntity>> selectOptionalSubject(
      {@Body() required List<SubjectSelectionRequest> subjectSelectionRequest,
      @Path("enquiryId") required String enquiryID});

  @POST('marketing/admission/{enquiryId}/vas-options')
  Future<HttpResponse<VasOptionResponseEntity>> addVASOption(
      {@Body() required VasOptionRequest vasOptionRequest,
      @Path("enquiryId") required String enquiryID});

  @POST('marketing/admission/{enquiryId}/vas/add')
  Future<HttpResponse<VasOptionResponseEntity>> addVASDetail(
      {@Body() required VasEnrollmentRequest vasEnrollmentRequest,
      @Path("enquiryId") required String enquiryID,
      @Query("type") required String type});

  @POST('marketing/admission/{enquiryId}/vas/remove')
  Future<HttpResponse<VasOptionResponseEntity>> removeVasDetail(
      {@Path("enquiryId") required String enquiryID,
      @Query("type") required String type});

  @POST('marketing/admission/{enquiryId}/payment-request')
  Future<HttpResponse<VasOptionResponseEntity>> makePaymentRequest({
    @Path("enquiryId") required String enquiryID,
  });

  @PATCH("marketing/enquiry/{enquiryId}/move-to-next-stage")
  Future<HttpResponse<MoveToNextStageEnquiryResponseEntity>>
      moveToNextStageEnquiry(@Path("enquiryId") String enquiryId,
          @Body() MoveToNextStageEnquiryRequestEntity body);

  @GET("marketing/admission/{enquiryId}")
  Future<HttpResponse<AdmissionVasDetailsResponseEntity>>
      fetchadmissionVasDetails(@Path("enquiryId") String enquiryId);
}
