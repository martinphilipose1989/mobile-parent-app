import 'dart:io';

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
import 'package:network_retrofit/src/model/response/finance/get_validate_on_pay/get_validate_on_pay_entity.dart';
import 'package:network_retrofit/src/model/response/slots_detail/slots_entity.dart';
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

 
  @GET('marketing/app/enquiry/enquiry-list')
  Future<HttpResponse<EnquiryListResponseEntity>> getEnquiryList(
    {@Query('phone') required String phone,
    @Query('pageNumber') required int pageNumber,
    @Query('pageSize') required int pageSize}
  );

  @GET('marketing/app/enquiry/{enquiryID}')
  Future<HttpResponse<EnquiryResponseEntity>> getEnquiryDetail(
    {@Path('enquiryID') required String enquiryID,}
  );

  @GET('marketing/enquiry/{enquiryID}/timeline')
  Future<HttpResponse<EnquiryTimeLineResponseEntity>> getEnquiryTimeline(
    {@Path('enquiryID') required String enquiryID,}
  );

  @GET('marketing/app/enquiry/{enquiryID}/admission-journey') 
  Future<HttpResponse<AdmissionJourneyBaseEntity>> getAdmissionJourney(
    {@Path('enquiryID') required String enquiryID,
      @Query('type') required String type
    }
  );

  @GET('marketing/app/enquiry/{enquiryID}/new-admission') 
  Future<HttpResponse<NewAdmissionEntity>> getNewAdmissionDetail(
    {@Path('enquiryID') required String enquiryID}
  );

  @PATCH('marketing/app/enquiry/{enquiryID}/new-admission')
  Future<HttpResponse<NewAdmissionEntity>> updateNewAdmissionDetail(
    {@Path('equiryID') required String enquiryID,
      @Body() required NewAdmissionDetailEntity newAdmissionDetail
    }
  );

  @GET('marketing/app/enquiry/{enquiryID}/psa') 
  Future<HttpResponse<PsaBaseResponseEntity>> getPsaDetail(
    {@Path('enquiryID') required String enquiryID}
  );

  @PATCH('marketing/app/enquiry/{enquiryID}/psa')
  Future<HttpResponse<PsaBaseResponseEntity>> updatePsaDetail(
    {@Path('equiryID') required String enquiryID,
      @Body() required PsaDetailResponseEntity psaDetail
    }
  );

  @GET('marketing/app/enquiry/{enquiryID}/ivt')
  Future<HttpResponse<IvtBaseResponseEntity>> getIvtDetail(
    {@Path('enquiryID') required String enquiryID}
  );

  @PATCH('marketing/app/enquiry/{enquiryID}/ivt')
  Future<HttpResponse<IvtBaseResponseEntity>> updateIvtDetail(
    {@Path('equiryID') required String enquiryID,
      @Body() required IvtDetailResponseEntity ivtDetail
    }
  );

  @GET('marketing/school-visit/{enquiryID}')
  Future<HttpResponse<SchoolVisitEntity>> getSchoolVisitDetail(
    {@Path('enquiryID') required String enquiryID}
  );

  @POST('marketing/school-visit/{enquiryId}/schedule')
  Future<HttpResponse<SchoolVisitEntity>> createSchoolVisit(
    {@Path('enquiryId') required String enquiryID,
    @Body() required SchoolCreationRequest schoolCreationRequest}
  );

  @POST('marketing/school-visit/{enquiryID}/reschedule')
  Future<HttpResponse<SchoolVisitEntity>> rescheduleSchoolVisit(
    {@Path('enquiryID') required String schoolVisitID,
    @Body() required SchoolCreationRequest schoolCreationRequest}
  );

  @POST('marketing/school-visit/{enquiryID}/cancel')
  Future<HttpResponse<SchoolVisitEntity>> cancelSchoolVisit(
    {@Path('enquiryID') required String enquiryID,
    @Body() required SchoolVisitCancelRequest schoolVisitCancelRequest}
  );

  @GET('marketing/app/enquiry/admission-list')
  Future<HttpResponse<AdmissionListResponseEntity>> getAdmissionList(
    {@Query('phone') required String phone,
    @Query('pageNumber') required int pageNumber,
    @Query('pageSize') required int pageSize}
  );

  @GET('marketing/competency-test/{enquiryId}')
  Future<HttpResponse<CompetencyTestDetailResponseEntity>> getCompetencyTestDetail(
    {@Path('enquiryId') required String enquiryID,}
  );

  @POST('marketing/competency-test/{enquiryID}/create')
  Future<HttpResponse<CompetencyTestDetailResponseEntity>> createCompetencyTest(
    {@Path('enquiryID') required String enquiryID,
    @Body() required CompetencyTestCreationRequest competencyTestCreationRequest}
  );

  @POST('marketing/competency-test/{enquiryID}/reschedule')
  Future<HttpResponse<CompetencyTestDetailResponseEntity>> rescheduleCompetencyTest(
    {@Path('enquiryID') required String enquiryID,
    @Body() required CompetencyTestCreationRequest competencyTestCreationRequest}
  );

  @POST('marketing/competency-test/{enquiryID}/cancel')
  Future<HttpResponse<CompetencyTestDetailResponseEntity>> cancelCompetencyTest(
    {@Path('enquiryID') required String enquiryID,
    @Body() required CancelCompetencyTestRequest cancelCompetencyTestRequest}
  );
@GET('marketing/enquiry/{enquiryID}/document/{documentID}')
  Future<HttpResponse<DownloadEnquiryFileResponseEntity>> downloadEnquiryDocument(
    {@Path('enquiryID') required String enquiryID,
    @Path('documentID') required String documentID
    }
  );

  @PATCH('marketing/enquiry/{enquiryID}/document/{documentID}/delete')
  Future<HttpResponse<DeleteEnquiryFileResponseEntity>> deleteEnquiryDocument(
    {@Path('enquiryID') required String enquiryID,
    @Path('documentID') required String documentID
    }
  );

  @POST('marketing/enquiry/{enquiryID}/upload-document/{documentID}')
  @MultiPart()
  Future<HttpResponse<EnquiryFileUploadResponseEntity>> uploadEnquiryDocument(
    {@Path('enquiryID') required String enquiryID,
      @Path('documentID') required String documentID,
      @Part(name: 'file') required File file,
    }
  );

  @PATCH('/marketing/app/registration/{enquiryId}/parent-details')
  Future<HttpResponse<SingleResponse<ParentInfoEntity>>> updateParentDetails(
      {@Path('enquiryId') required String enquiryId,
        @Body() required ParentInfoEntity parentInfo}
      );

  @PATCH('/marketing/app/registration/{enquiryId}/contact-details')
  Future<HttpResponse<SingleResponse<ContactDetailsEntity>>> updateContactDetails(
      {@Path('enquiryId') required String enquiryId,
        @Body() required ContactDetailsEntity contactDetails
      }
      );

  @PATCH('/marketing/app/registration/{enquiryId}/medical-details')
  Future<HttpResponse<SingleResponse<MedicalDetailsEntity>>> updateMedicalDetails(
      {@Path('enquiryId') required String enquiryId,
        @Body() required MedicalDetailsEntity medicalDetails
      }
      );

  @PATCH('/marketing/app/registration/{enquiryId}/bank-details')
  Future<HttpResponse<SingleResponse<BankDetailsEntity>>> updateBankDetails(
      {@Path('enquiryId') required String enquiryId,
        @Body() required BankDetailsEntity bankDetails
      }
      );

  @GET('marketing/app/registration/{enquiryId}') 
  Future<HttpResponse<SingleResponse>> getRegistrationDetail(
    {@Path("enquiryId") required String enquiryId,
      @Query("infoType") required String infoType,
    }
  );

  @GET('marketing/school-visit/slots') 
  Future<HttpResponse<SlotsEntity>> getSchoolVisitSlots(
    {@Query("enquiryId") required String enquiryId,
    @Query("date") required String date,}
  );

  @GET('marketing/competency-test/slots') 
  Future<HttpResponse<SlotsEntity>> getCompetencyTestSlots(
    {@Query("enquiryId") required String enquiryId,
    @Query("date") required String date,}
  );


}

