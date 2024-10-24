import 'package:dio/dio.dart';
import 'package:network_retrofit/src/model/request/communication/create_communication_log_model_request_entity.dart';
import 'package:network_retrofit/src/model/request/communication/create_ticket_request_entity.dart';
import 'package:network_retrofit/src/model/request/communication/find_by_category_subcategory_request.dart';
import 'package:network_retrofit/src/model/request/communication/get_ticket_list_request.dart';
import 'package:network_retrofit/src/model/response/communication/create_commincation_entity.dart';
import 'package:network_retrofit/src/model/response/communication/create_communiaction_entity.dart';
import 'package:network_retrofit/src/model/response/communication/get_communcation_details.dart';
import 'package:network_retrofit/src/model/response/communication/find_by_category_sub_category_entity.dart';
import 'package:network_retrofit/src/model/response/communication/send_communication_entity.dart';
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
      {@Body() required GetTicketListRequest getTicketListRequest});

  @POST('communication')
  Future<HttpResponse<CreateCommunicationEntity>> createCommunication();

  @POST('communication-master/find-by-category-subcategory')
  Future<HttpResponse<FindByCategorySubCategoryEntity>>
      findByCategorySubCategory(
          {@Body()
          required FindByCategorySubCategoryRequest
              findByCategorySubCategoryRequest});

  @GET('communication/detalis/{communocationId}')
  Future<HttpResponse<GetCommunicationEntity>> createCommunicationLog(
      {@Path() required String communocationId});

  @POST('communication-log')
  Future<HttpResponse<SendCommunicationEntity>> sendCommunication(
      {@Body()
      required CreateCommunicationLogRequestEntity
          createCommunicationLogRequestEntity});

  @POST('communication')
  Future<HttpResponse<CreateTicketEntity>> createTicket(
      {@Body() required CreateTicketRequestEntity createTicketRequestEntity});
}
