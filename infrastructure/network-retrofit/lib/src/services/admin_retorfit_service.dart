import 'package:dio/dio.dart';
import 'package:network_retrofit/network_retrofit.dart';

import 'package:network_retrofit/src/model/response/admin/student_detail/student_detail_response_entity.dart';
import 'package:network_retrofit/src/model/response/get_sibling_detail/sibling_profile_response_entity.dart';
import 'package:network_retrofit/src/model/response/get_subject_list/subject_list_response_entity.dart';

import '../model/response/admin/get_couponse_list/get_coupons_response_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'admin_retorfit_service.g.dart';

@RestApi()
abstract class AdminRetorfitService {
  factory AdminRetorfitService(Dio dio,
      {String? baseUrl, String? mdmBaseUrl, String? adminBaseUrl}) {
    return _AdminRetorfitService(dio, baseUrl: adminBaseUrl);
  }

  @GET(
      'admin/concession/fetch-coupons?student_id={student_id}&fee_type_ids={fee_type_ids}&fee_category_ids={fee_category_ids}&fee_sub_category_ids={fee_sub_category_ids}&fee_sub_type_ids={fee_sub_type_ids}&academic_yrs_id={academic_yrs_id}&platform=app')
  Future<HttpResponse<GetCouponsResponseEntity>> getCoupons({
    @Path('student_id') required String studentId,
    @Path('fee_type_ids') required String feeTypeIds,
    @Path('fee_category_ids') required String feeCategoryIds,
    @Path('fee_sub_category_ids') required String feeSubCategoryIds,
    @Path('fee_sub_type_ids') required String feeSubTypeIds,
    @Path('academic_yrs_id') required String academicYrsId,
  });

  @GET('admin/studentProfile/{id}')
  Future<HttpResponse<StudentDetailsResponseEntity>> getStudentDetails(
      {@Path('id') required int studentId,
      @Query('platform') required String app});

  @POST('admin/school-subject/fetch-school-subjects')
  Future<HttpResponse<SubjectListResponseEntity>> getSubjectList(
      {@Body() required SubjectListingRequest subjectListingRequest,
      @Query('platform') required String app});

  @POST('admin/studentProfile/getEnrollmentDetail')
  Future<HttpResponse<SiblingProfileResponseEntity>> getSiblingDetail(
      {@Body() required GetSiblingDetailRequest getSiblingDetailRequest,
      @Query('platform') required String app});
}
