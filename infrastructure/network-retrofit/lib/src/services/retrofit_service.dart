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

import 'package:retrofit/retrofit.dart';

import '../model/response/finance/get_sibling_list/get_sibling_list_response_entity.dart';

part 'retrofit_service.g.dart';

//**
// MDM MODULE APIS
// */

@RestApi()
abstract class RetrofitService {
  factory RetrofitService(Dio dio, {String? mdmBaseUrl}) {
    return _RetrofitService(dio, baseUrl: mdmBaseUrl);
  }

  static const String _schoolBoard = '/api/ac-boards';
  static const String _grade = '/api/ac-grades';
  static const String _gender = '/api/genders';
  static const String _cources = '/api/ac-courses';
  static const String _stream = '/api/ac-streams';
  static const String _shifts = '/api/ac-shifts';
  static const String _cancelationReason = '/api/ad-followup-reasons';
  static const String _countries = '/api/countries';
  static const String _states = '/api/states';
  static const String _city = '/api/cities';
  static const String _schoolLocation = '/api/ac-schools';
  static const String _batch = '/api/ac-batches';
  static const String _academicYear =
      '/api/ac-academic-years?fields[1]=name&fields[2]=short_name&fields[3]=short_name_two_digit:ASC';
  static const String _psaSubType =
      '/api/ac-spa-activity-types?fields[1]=name&fields[2]=short_name';
  static const String _psaCategory =
      '/api/ac-spa-categories?fields[1]=name&fields[2]=short_name';
  static const String _psaSubCategory =
      '/api/ac-spa-subjects?fields[1]=name&fields[2]=short_name';
  static const String _periodOfService =
      '/api/fc-period-of-services?fields[1]=name';
  static const String _bloodGroup = '/api/blood-groups?fields=group';
  static const String _occupation =
      '/api/co-occupations?fields[1]=Name&fields[2]=Short_Name&fields[3]=Order';
  static const String _qualifications =
      '/api/co-qualifications?fields[1]=Education&fields[2]=Description';
  static const String _religions = '/api/religions?fields[1]=name';
  static const String _castes =
      '/api/castes?fields[1]=name&fields[2]=short_name';
  static const String _subCastes = '/api/sub-castes?fields[1]=name';
  static const String _motherTongue = '/api/mother-tongues?fields[1]=name';
  static const String _organization = '/api/organizations?fields[1]=name';
  static const String _designation = '/api/ps-designations';
  static const String _nationality =
      '/api/countries?sort[0]=id:asc&fields[1]=nationality&fields[2]=name';
  static const String _personalisedLearningNeedsDescription =
      '/api/ac-personalise-learning-needs?fields[1]=name';
  static const String _cityAndState =
      '/api/co-pincodes?populate[0]=District_Or_City&populate[1]=State';
  static const String _relationWithChild =
      '/api/co-guardian-relationships?fields[1]=name';

  // Marketing

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

  @GET(_schoolLocation)
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getSchoolLocation({
    @Header("Authorization") required String token,
    @Query("fields") List<String> field1 = const ["name", "short_name"],
  });

  @GET(_schoolBoard)
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getSchoolBoard({
    @Header("Authorization") required String token,
    @Query("fields[1]") String field1 = "name",
    @Query("fields[2]") String field2 = "short_name",
    @Query("short") String short = "id",
  });

  @GET(_grade)
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getGrades({
    @Header("Authorization") required String token,
    @Query("fields[1]") String field1 = "name",
    @Query("fields[2]") String field2 = "short_name",
    @Query("short") String short = "order",
  });

  @GET(_gender)
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getGender({
    @Header("Authorization") required String token,
    @Query("fields[1]") String field1 = "name",
    @Query("fields[2]") String field2 = "short_name",
    @Query("short") String short = "order",
  });

  @GET(_cources)
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getCourses({
    @Header("Authorization") required String token,
    @Query("fields[1]") String field1 = "name",
    @Query("fields[2]") String field2 = "short_name",
    @Query("short") String short = "id",
  });

  @GET(_countries)
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getCountries({
    @Header("Authorization") required String token,
    @Query("fields[1]") String field1 = "name",
    @Query("fields[2]") String field2 = "number_code",
    @Query("short") String short = "id",
    @Query("sort") String sort = "id:asc",
  });

  @GET(_states)
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getStates({
    @Header("Authorization") required String token,
    @Query("filters[id]") int? id,
  });

  @GET(_city)
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getCities({
    @Header("Authorization") required String token,
    @Query("filters[id]") int? id,
  });

  @GET(_batch)
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getBatch({
    @Header("Authorization") required String token,
    @Query("fields[1]") String field1 = "name",
    @Query("fields[2]") String field2 = "short_name",
  });

  @GET(_shifts)
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getShifts({
    @Header("Authorization") required String token,
    @Query("fields[1]") String field1 = "name",
    @Query("fields[2]") String field2 = "short_name",
    @Query("short") String short = "id",
  });

  @GET(_stream)
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getStreams({
    @Header("Authorization") required String token,
    @Query("fields[1]") String field1 = "name",
    @Query("fields[2]") String field2 = "short_name",
    @Query("short") String short = "id",
  });

  @GET(_cancelationReason)
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getCancellationReason({
    @Header("Authorization") required String token,
    @Query("fields") String field1 = "reason",
    @Query("short") String short = "id",
  });

  @GET(_psaSubType)
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getPsaSubType(
      {@Header("Authorization") required String token});

  @GET(_psaCategory)
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getPsaCategory(
      {@Header("Authorization") required String token});

  @GET(_psaSubCategory)
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getPsaSubCategory(
      {@Header("Authorization") required String token});

  @GET(_periodOfService)
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getPeriodOfService(
      {@Header("Authorization") required String token});

  @GET(_academicYear)
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getAcademicYearAttribute(
      {@Header("Authorization") required String token});

  @GET(_bloodGroup)
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getBloodGroupAttribute(
      {@Header("Authorization") required String token});

  @GET(_occupation)
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getOccupationAttribute(
      {@Header("Authorization") required String token});

  @GET(_qualifications)
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getQualifications(
      {@Header("Authorization") required String token});

  @GET(_religions)
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getReligions(
      {@Header("Authorization") required String token});

  @GET(_castes)
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getCastes(
      {@Header("Authorization") required String token});

  @GET(_subCastes)
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getSubCastes(
      {@Header("Authorization") required String token});

  @GET(_motherTongue)
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getMotherTongue(
      {@Header("Authorization") required String token});

  @GET(_organization)
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getOrganizations(
      {@Header("Authorization") required String token});

  @GET(_designation)
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getDesignation(
      {@Header("Authorization") required String token});

  @GET(_nationality)
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getNationality(
      {@Header("Authorization") required String token});

  @GET(_personalisedLearningNeedsDescription)
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getPersonalizedLearningNeeds(
      {@Header("Authorization") required String token});

  @GET(_cityAndState)
  Future<HttpResponse<CityAndStateResponseEntity>> getCityAndStateByPincode({
    @Header("Authorization") required String token,
    @Query('filters[Pincode][\$eq]') required String pincode,
  });

  @GET(_relationWithChild)
  Future<HttpResponse<MdmBaseResponseBaseEntity>> getRelationWithChild({
    @Header("Authorization") required String token,
  });

  @POST('/api/fc-fees-masters/psa-details')
  Future<HttpResponse<PsaEnrollmentDetailResponseEntity>>
      getPsaEnrollmentDetail({
    @Body() required VasDetailRequest psaEnrollmentDetailRequest,
  });

  @POST('/api/fc-fees-masters/cafeteria-details')
  Future<HttpResponse<CafeteriaEnrollmentResponseEntity>>
      getCafeteriaEnrollmentDetail(
          {@Body() required VasDetailRequest cafeteriaEnrollmentDetail});

  @POST('/api/fc-fees-masters/summer-camp-details')
  Future<HttpResponse<SummerCampEnrollmentResponseEntity>>
      getSummerCampEnrollmentDetail(
          {@Header("Authorization") required String token,
          @Body() required VasDetailRequest summerCampEnrollmentDetail});

  @POST('/api/fc-fees-masters/kids-club-details')
  Future<HttpResponse<KidsClubEnrollmentResponseEntity>>
      getKidsClubEnrollmentDetail(
          {@Body() required VasDetailRequest kidsClubEnrollmentDetail});

  @GET('/api/ac-brands')
  Future<HttpResponse<BrandResponseEntity>> getBrandList(
      @Header("Authorization") token);

  // TRANSPORT
  @POST('/api/fc-fees-masters/transport-details')
  Future<HttpResponse<TransportEnrollmentResponseEntity>>
      getTransportEnrollmentDetail({
    @Header("Authorization") required String token,
    @Body() VasDetailRequest? transportEnrollmentDetail,
  });

  // RBAC
  @POST('/api/rbac-role-permissions/role-permissions-for-external')
  Future<HttpResponse<UserRolePermissionResponseEntity>> getUserRolePermissions(
      @Header("Authorization") token,
      @Body() UserRolePermissionRequestEntity body);

  // GATE MANAGMENT
  @GET('/api/co-reasons')
  Future<HttpResponse<MdmCoReasonEntity>> getPurposeOfVisitList(
      @Query('filters[parent_id]') int id,
      @Query("fields[0]") String name,
      @Header("Authorization") token);
}
