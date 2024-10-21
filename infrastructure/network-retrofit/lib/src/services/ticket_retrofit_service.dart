import 'package:dio/dio.dart';
import 'package:network_retrofit/src/model/response/communication/communication_entity.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

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
}
