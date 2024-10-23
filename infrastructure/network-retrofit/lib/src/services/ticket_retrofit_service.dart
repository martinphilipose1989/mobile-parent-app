import 'package:dio/dio.dart';
import 'package:network_retrofit/src/model/request/communication/create_communication_log_model_request_entity.dart';
import 'package:network_retrofit/src/model/request/communication/find_by_category_subcategory_request.dart';
import 'package:network_retrofit/src/model/response/communication/create_commincation_entity.dart';
import 'package:network_retrofit/src/model/response/communication/create_communication_log_entity.dart';
import 'package:network_retrofit/src/model/response/communication/find_by_category_sub_category_entity.dart';
import 'package:retrofit/retrofit.dart';
import 'package:network_retrofit/src/model/response/communication/communication_entity.dart';

part 'ticket_retrofit_service.g.dart';

@RestApi()
abstract class TicketRetrofitService {
  factory TicketRetrofitService(Dio dio,
      {String? baseUrl, String? ticketingBaseUrl}) {
    return _TicketRetrofitService(
      dio,
      baseUrl: ticketingBaseUrl,
    );
  }

  @POST('communication/list')
  Future<HttpResponse<CommunicationEntity>> getTicketsList(
      {required int pageSize, required int page});

  @POST('communication')
  Future<HttpResponse<CreateCommunicationEntity>> createCommunication();

  @POST('communication-master/find-by-category-subcategory')
  Future<HttpResponse<FindByCategorySubCategoryEntity>>
      findByCategorySubCategory(
          {required FindByCategorySubCategoryRequest
              findByCategorySubCategoryRequest});

  @POST('communication-log')
  Future<HttpResponse<CreateCommunicationLogEntity>> createCommunicationLog(
      {required CreateCommunicationLogRequestEntity
          createCommunicationLogRequest});
}
