import 'package:dio/dio.dart';

import '../model/request/finance/get_guardian_student_details_request.dart';
import '../model/request/finance/get_siblings_request.dart';
import '../model/request/finance/get_token_generator_request.dart';
import '../model/response/communication/msg_category_entity.dart';
import '../model/response/communication/msg_sub_category_entity.dart';
import '../model/response/finance/get_guardian_student_details/get_guardian_student_details_entity.dart';
import '../model/response/finance/get_token_generator/get_token_generator_response_entity.dart';
import 'package:network_retrofit/network_retrofit.dart';

import 'package:network_retrofit/src/model/request/user/user_role_permission_request_entity.dart';

import 'package:network_retrofit/src/model/response/brand/brand_response_entity.dart';
import 'package:network_retrofit/src/model/response/cafeteria_enrollment_detail/cafeteria_enrollment_response_entity.dart';

import 'package:network_retrofit/src/model/response/gatepass/mdm_coreason_entity.dart';

import 'package:network_retrofit/src/model/response/kids_club_enrollment_detail/kids_club_enrollment_response_entity.dart';
import 'package:network_retrofit/src/model/response/mdm_response/city_and_state_response_entity.dart';
import 'package:network_retrofit/src/model/response/mdm_response/mdm_base_response_entity.dart';
import 'package:network_retrofit/src/model/response/psa_enrollment_detail/psa_enrollment_detail_response_entity.dart';

import 'package:network_retrofit/src/model/response/summer_camp_enrollment_detail/summer_camp_enrollment_response_entity.dart';
import 'package:network_retrofit/src/model/response/transport_enrollment_detail/transport_enrollment_response_entity.dart';

import 'package:network_retrofit/src/model/response/user/user_role_permission_response_entity.dart';

import 'package:network_retrofit/src/util/network_properties.dart';
import 'package:retrofit/retrofit.dart';

import '../model/response/finance/get_sibling_list/get_sibling_list_response_entity.dart';

part 'retrofit_service.g.dart';

@RestApi()
abstract class RetrofitService {
  factory RetrofitService(Dio dio,
      {String? baseUrl, String? mdmBaseUrl, String? financeBaseUrl}) {
    return _RetrofitService(dio, baseUrl: mdmBaseUrl);
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
          @Header('Authorization') token,
          @Body()
          GetGuardianStudentDetailsRequest getGuardianStudentDetailsRequest);

  @GET('/api/msg-categories')
  Future<HttpResponse<MsgCategoryEntity>> createCategory();

  @GET('/api/msg-sub-categories')
  Future<HttpResponse<MsgSubCategoryEntity>> createSubCategory();

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
    @Query("filters[id]") int? id,
  });

  @GET('${NetworkProperties.mdmBaseUrl}${NetworkProperties.city}')
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getCities({
    @Header("Authorization") required String token,
    @Query("filters[id]") int? id,
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

  @GET('${NetworkProperties.mdmBaseUrl}${NetworkProperties.qualifications}')
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getQualifications(
      {@Header("Authorization") required String token});

  @GET('${NetworkProperties.mdmBaseUrl}${NetworkProperties.religions}')
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getReligions(
      {@Header("Authorization") required String token});

  @GET('${NetworkProperties.mdmBaseUrl}${NetworkProperties.castes}')
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getCastes(
      {@Header("Authorization") required String token});

  @GET('${NetworkProperties.mdmBaseUrl}${NetworkProperties.subCastes}')
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getSubCastes(
      {@Header("Authorization") required String token});

  @GET('${NetworkProperties.mdmBaseUrl}${NetworkProperties.motherTongue}')
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getMotherTongue(
      {@Header("Authorization") required String token});

  @GET('${NetworkProperties.mdmBaseUrl}${NetworkProperties.organization}')
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getOrganizations(
      {@Header("Authorization") required String token});

  @GET('${NetworkProperties.mdmBaseUrl}${NetworkProperties.designation}')
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getDesignation(
      {@Header("Authorization") required String token});

  @GET('${NetworkProperties.mdmBaseUrl}${NetworkProperties.nationality}')
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getNationality(
      {@Header("Authorization") required String token});

  @GET(
      '${NetworkProperties.mdmBaseUrl}${NetworkProperties.personalisedLearningNeedsDescription}')
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getPersonalizedLearningNeeds(
      {@Header("Authorization") required String token});

  @GET("${NetworkProperties.mdmBaseUrl}${NetworkProperties.cityAndState}")
  Future<HttpResponse<CityAndStateResponseEntity>> getCityAndStateByPincode({
    @Header("Authorization") required String token,
    @Query('filters[Pincode][\$eq]') required String pincode,
  });

  @GET("${NetworkProperties.mdmBaseUrl}${NetworkProperties.relationWithChild}")
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getRelationWithChild({
    @Header("Authorization") required String token,
  });

  @POST('${NetworkProperties.mdmBaseUrl}/api/fc-fees-masters/psa-details')
  Future<HttpResponse<PsaEnrollmentDetailResponseEntity>>
      getPsaEnrollmentDetail({
    @Body() required VasDetailRequest psaEnrollmentDetailRequest,
  });

  @POST('${NetworkProperties.mdmBaseUrl}/api/fc-fees-masters/cafeteria-details')
  Future<HttpResponse<CafeteriaEnrollmentResponseEntity>>
      getCafeteriaEnrollmentDetail(
          {@Body() required VasDetailRequest cafeteriaEnrollmentDetail});

  @POST(
      '${NetworkProperties.mdmBaseUrl}/api/fc-fees-masters/summer-camp-details')
  Future<HttpResponse<SummerCampEnrollmentResponseEntity>>
      getSummerCampEnrollmentDetail(
          {@Header("Authorization") required String token,
          @Body() required VasDetailRequest summerCampEnrollmentDetail});

  @POST('${NetworkProperties.mdmBaseUrl}/api/fc-fees-masters/kids-club-details')
  Future<HttpResponse<KidsClubEnrollmentResponseEntity>>
      getKidsClubEnrollmentDetail(
          {@Body() required VasDetailRequest kidsClubEnrollmentDetail});

  @POST('${NetworkProperties.mdmBaseUrl}/api/fc-fees-masters/transport-details')
  Future<HttpResponse<TransportEnrollmentResponseEntity>>
      getTransportEnrollmentDetail(
          {@Header("Authorization") required String token,
          @Body() required VasDetailRequest transportEnrollmentDetail});

  @POST(
      '${NetworkProperties.mdmBaseUrl}/api/rbac-role-permissions/role-permissions-for-external')
  Future<HttpResponse<UserRolePermissionResponseEntity>> getUserRolePermissions(
      @Header("Authorization") token,
      @Body() UserRolePermissionRequestEntity body);

  @GET(NetworkProperties.mdmModule)
  Future<HttpResponse<MdmCoReasonEntity>> getPurposeOfVisitList(
      @Query('filters[parent_id]') int id,
      @Query("fields[0]") String name,
      @Header("Authorization") token);

  @GET(NetworkProperties.getBrandList)
  Future<HttpResponse<BrandResponseEntity>> getBrandList(
      @Header("Authorization") token);
}
