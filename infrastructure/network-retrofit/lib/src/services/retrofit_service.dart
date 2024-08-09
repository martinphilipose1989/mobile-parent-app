import 'dart:io';

import 'package:dio/dio.dart';
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
import 'package:network_retrofit/src/model/response/get_registreation_info/contact_details_entity.dart';
import 'package:network_retrofit/src/model/response/get_registreation_info/medical_details_entity.dart';
import 'package:network_retrofit/src/model/response/schoo_visit/school_visit_entity.dart';

import 'package:retrofit/retrofit.dart';

import '../model/response/get_registreation_info/bank_details_entity.dart';
import '../model/response/get_registreation_info/parent_registration_entity.dart';

part 'retrofit_service.g.dart';

@RestApi()
abstract class RetrofitService {
  factory RetrofitService(Dio dio, {String? baseUrl}) {
    return _RetrofitService(dio, baseUrl: dio.options.baseUrl);
  }

 
  @GET('marketing/app/enquiry/enquiry-list')
  Future<HttpResponse<EnquiryListResponseEntity>> getEnquiryList(
    {@Query('phone')  String phone,
    @Query('pageNumber')  int pageNumber,
    @Query('pageSize')  int pageSize}
  );

  @GET('marketing/app/enquiry/')
  Future<HttpResponse<EnquiryResponseEntity>> getEnquiryDetail(
    {@Path('enquiryID')  String enquiryID,}
  );

  @GET('marketing/enquiry/{enquiryID}/timeline')
  Future<HttpResponse<EnquiryTimeLineResponseEntity>> getEnquiryTimeline(
    {@Path('enquiryID')  String enquiryID,}
  );

  @GET('marketing/app/enquiry/{enquiryID}/admission-journey') 
  Future<HttpResponse<AdmissionJourneyBaseEntity>> getAdmissionJourney(
    {@Path('enquiryID') String enquiryID}
  );

  @GET('marketing/app/enquiry/{enquiryID}/new-admission') 
  Future<HttpResponse<NewAdmissionEntity>> getNewAdmissionDetail(
    {@Path('enquiryID') String enquiryID}
  );

  @GET('marketing/app/enquiry/{enquiryID}/psa') 
  Future<HttpResponse<PsaBaseResponseEntity>> getPsaDetail(
    {@Path('enquiryID') String enquiryID}
  );

  @GET('marketing/app/enquiry/{enquiryID}/ivt')
  Future<HttpResponse<IvtBaseResponseEntity>> getItvDetail(
    {@Path('enquiryID') String enquiryID}
  );
  @GET('marketing/school-visit/{enquiryId}')
  Future<HttpResponse<SchoolVisitEntity>> getSchoolVisitDetail(
    {@Path('enquiryID') String enquiryID}
  );

  @POST('marketing/school-visit/{enquiryId}/create')
  Future<HttpResponse<SchoolVisitEntity>> createSchoolVisit(
    {@Path('enquiryID') String enquiryID,
    @Body() SchoolCreationRequest schoolCreationRequest}
  );

  @POST('marketing/school-visit/{enquiryId}/reschedule')
  Future<HttpResponse<SchoolVisitEntity>> rescheduleSchoolVisit(
    {@Path('schoolVisitID') String schoolVisitID,
    @Body() SchoolCreationRequest schoolCreationRequest}
  );

  @POST('marketing/school-visit/{enquiryId}/cancel')
  Future<HttpResponse<SchoolVisitEntity>> cancelSchoolVisit(
    {@Path('schoolVisitID') String schoolVisitID,
    @Body() SchoolVisitCancelRequest schoolVisitCancelRequest}
  );

  @GET('marketing/app/enquiry/')
  Future<HttpResponse<AdmissionListResponseEntity>> getAdmissionList(
    {@Query('phone')  String phone,
    @Query('pageNumber')  int pageNumber,
    @Query('pageSize')  int pageSize}
  );

  @GET('marketing/competency-test/')
  Future<HttpResponse<CompetencyTestDetailResponseEntity>> getCompetencyTestDetail(
    {@Path('enquiryID') String enquiryID,}
  );

  @POST('marketing/competency-test/{enquiryId}/create')
  Future<HttpResponse<CompetencyTestDetailResponseEntity>> createCompetencyTest(
    {@Path('enquiryID') String enquiryID,
    @Body() CompetencyTestCreationRequest competencyTestCreationRequest}
  );

  @POST('marketing/competency-test/{enquiryId}/reschedule')
  Future<HttpResponse<CompetencyTestDetailResponseEntity>> rescheduleCompetencyTest(
    {@Path('competencyTest') String competencyTest,
    @Body() CompetencyTestCreationRequest competencyTestCreationRequest}
  );

  @POST('marketing/competency-test/{enquiryId}/cancel')
  Future<HttpResponse<CompetencyTestDetailResponseEntity>> cancelCompetencyTest(
    {@Path('competencyTest') String competencyTest,
    @Body() CancelCompetencyTestRequest cancelCompetencyTestRequest}
  );
@GET('marketing/enquiry/{enquiryID}/document/{documentID}')
  Future<HttpResponse<DownloadEnquiryFileResponseEntity>> downloadEnquiryDocument(
    {@Path('enquiryID') String enquiryID,
    @Path('documentID') String documentID
    }
  );

  @PATCH('marketing/enquiry/{enquiryID}/document/{documentID}/delete')
  Future<HttpResponse<DeleteEnquiryFileResponseEntity>> deleteEnquiryDocument(
    {@Path('enquiryID') String enquiryID,
    @Path('documentID') String documentID
    }
  );

  @POST('marketing/enquiry/{enquiryID}/upload-document/{documentID}')
  @MultiPart()
  Future<HttpResponse<EnquiryFileUploadResponseEntity>> uploadEnquiryDocument(
    {@Path('enquiryID') String enquiryID,
      @Path('documentID') String documentID,
      @Part(name: 'file') required File file,
    }
  );

  //registration
  /*
  @GET('/marketing/app/registration/{enquiryId}')
  Future<HttpResponse<CompetencyTestCreationEntity>> registration(
      {@Path('competencyTest') String competencyTest,
        @Body() CancelCompetencyTestRequest cancelCompetencyTestRequest}
      );

   */

  @POST('/marketing/app/registration/{enquiryId}/parent-details')
  Future<HttpResponse<ParentRegistrationDetailEntity>> parentDetails(
      {@Path('enquiryId') String enquiryId}
      );

  @POST('/marketing/app/registration/{enquiryId}/contact-details')
  Future<HttpResponse<ContactDetailsEntity>> contactDetails(
      {@Path('enquiryId') String enquiryId}
      );

  @POST('/marketing/app/registration/{enquiryId}/contact-details')
  Future<HttpResponse<MedicalDetailsEntity>> medicalDetails(
      {@Path('enquiryId') String enquiryId}
      );

  @POST('/marketing/app/registration/{enquiryId}/contact-details')
  Future<HttpResponse<BankDetailsEntity>> bankDetails(
      {@Path('enquiryId') String enquiryId}
      );

  // @GET('marketing/app/registration/{enquiryId}') 
  // Future<HttpResponse<IvtBaseResponseEntity>> getRegistrationDetail(
  //   {@Path("enquiryId") String enquiryId,
  //   @Query("infoType") String infoType,}
  // );
}
