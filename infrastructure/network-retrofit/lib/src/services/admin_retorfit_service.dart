import 'package:dio/dio.dart';
import '../model/response/admin/get_couponse_list/get_coupons_response_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'admin_retorfit_service.g.dart';

@RestApi()
abstract class AdminRetorfitService {
  factory AdminRetorfitService(Dio dio,
      {String? baseUrl, String? mdmBaseUrl, String? adminBaseUrl}) {
    return _AdminRetorfitService(
      dio,
      baseUrl: adminBaseUrl,
    );
  }

  @GET(
      'concession/fetch-coupons?student_id={student_id}&fee_type_ids={fee_type_ids}&fee_category_ids={fee_category_ids}&fee_sub_category_ids={fee_sub_category_ids}')
  Future<HttpResponse<GetCouponsResponseEntity>> getCoupons(
      {@Path('student_id') required String studentId,
      @Path('fee_type_ids') required String feeTypeIds,
      @Path('fee_category_ids') required String feeCategoryIds,
      @Path('fee_sub_category_ids') required String feeSubCategoryIds});
}
