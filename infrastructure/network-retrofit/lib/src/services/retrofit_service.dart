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
import 'package:network_retrofit/src/model/response/get_registreation_info/base_info_entity.dart';
import 'package:network_retrofit/src/model/response/schoo_visit/school_visit_entity.dart';

import 'package:retrofit/retrofit.dart';

import '../model/response/get_registreation_info/parent_registration_entity.dart';

part 'retrofit_service.g.dart';

@RestApi()
abstract class RetrofitService {
  factory RetrofitService(Dio dio, {String? baseUrl}) {
    return _RetrofitService(dio, baseUrl: dio.options.baseUrl);
  }

 
  @GET('marketing/app/enquiry/enquiry-list')
  Future<HttpResponse<EnquiryListResponseEntity>> getEnquiryList(
    {@Query('phone') required String phone,
    @Query('pageNumber') required int pageNumber,
    @Query('pageSize') required int pageSize}
  );

  @GET('marketing/app/enquiry/')
  Future<HttpResponse<EnquiryResponseEntity>> getEnquiryDetail(
    {@Path('enquiryID') required String enquiryID,}
  );

  @GET('marketing/enquiry/{enquiryID}/timeline')
  Future<HttpResponse<EnquiryTimeLineResponseEntity>> getEnquiryTimeline(
    {@Path('enquiryID') required String enquiryID,}
  );

  @GET('marketing/app/enquiry/{enquiryID}/admission-journey') 
  Future<HttpResponse<AdmissionJourneyBaseEntity>> getAdmissionJourney(
    {@Path('enquiryID') required String enquiryID}
  );

  @GET('marketing/app/enquiry/{enquiryID}/new-admission') 
  Future<HttpResponse<NewAdmissionEntity>> getNewAdmissionDetail(
    {@Path('enquiryID') required String enquiryID}
  );

  @GET('marketing/app/enquiry/{enquiryID}/psa') 
  Future<HttpResponse<PsaBaseResponseEntity>> getPsaDetail(
    {@Path('enquiryID') required String enquiryID}
  );

  @GET('marketing/app/enquiry/{enquiryID}/ivt')
  Future<HttpResponse<IvtBaseResponseEntity>> getItvDetail(
    {@Path('enquiryID') required String enquiryID}
  );
  @GET('marketing/school-visit/{enquiryId}')
  Future<HttpResponse<SchoolVisitEntity>> getSchoolVisitDetail(
    {@Path('enquiryID') required String enquiryID}
  );

  @POST('marketing/school-visit/{enquiryId}/create')
  Future<HttpResponse<SchoolVisitEntity>> createSchoolVisit(
    {@Path('enquiryID') required String enquiryID,
    @Body() required SchoolCreationRequest schoolCreationRequest}
  );

  @POST('marketing/school-visit/{enquiryId}/reschedule')
  Future<HttpResponse<SchoolVisitEntity>> rescheduleSchoolVisit(
    {@Path('schoolVisitID') required String schoolVisitID,
    @Body() required SchoolCreationRequest schoolCreationRequest}
  );

  @POST('marketing/school-visit/{enquiryId}/cancel')
  Future<HttpResponse<SchoolVisitEntity>> cancelSchoolVisit(
    {@Path('schoolVisitID') required String schoolVisitID,
    @Body() required SchoolVisitCancelRequest schoolVisitCancelRequest}
  );

  @GET('marketing/app/enquiry/')
  Future<HttpResponse<AdmissionListResponseEntity>> getAdmissionList(
    {@Query('phone') required String phone,
    @Query('pageNumber') required int pageNumber,
    @Query('pageSize') required int pageSize}
  );

  @GET('marketing/competency-test/')
  Future<HttpResponse<CompetencyTestDetailResponseEntity>> getCompetencyTestDetail(
    {@Path('enquiryID') required String enquiryID,}
  );

  @POST('marketing/competency-test/{enquiryId}/create')
  Future<HttpResponse<CompetencyTestDetailResponseEntity>> createCompetencyTest(
    {@Path('enquiryID') required String enquiryID,
    @Body() required CompetencyTestCreationRequest competencyTestCreationRequest}
  );

  @POST('marketing/competency-test/{enquiryId}/reschedule')
  Future<HttpResponse<CompetencyTestDetailResponseEntity>> rescheduleCompetencyTest(
    {@Path('competencyTest') required String competencyTest,
    @Body() required CompetencyTestCreationRequest competencyTestCreationRequest}
  );

  @POST('marketing/competency-test/{enquiryId}/cancel')
  Future<HttpResponse<CompetencyTestDetailResponseEntity>> cancelCompetencyTest(
    {@Path('competencyTest') required String competencyTest,
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
  Future<HttpResponse<ParentRegistrationDetailEntity>> parentDetails(
      {@Path('enquiryId') required String enquiryId}
      );

  @PATCH('/marketing/app/registration/{enquiryId}/contact-details')
  Future<HttpResponse<ContactDetailsEntity>> contactDetails(
      {@Path('enquiryId') required String enquiryId}
      );

  @PATCH('/marketing/app/registration/{enquiryId}/contact-details')
  Future<HttpResponse<MedicalDetailsEntity>> medicalDetails(
      {@Path('enquiryId') required String enquiryId}
      );

  @PATCH('/marketing/app/registration/{enquiryId}/contact-details')
  Future<HttpResponse<BankDetailsEntity>> bankDetails(
      {@Path('enquiryId') required String enquiryId}
      );

  @GET('marketing/app/registration/{enquiryId}') 
  Future<HttpResponse<BaseInfoEntity>> getRegistrationDetail(
    {@Path("enquiryId") required String enquiryId,
    @Query("infoType") required String infoType,}
  );
}
