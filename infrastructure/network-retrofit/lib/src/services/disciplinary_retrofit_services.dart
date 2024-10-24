import 'dart:io';

import 'package:dio/dio.dart';
import '../model/request/disciplinary_slip/acknowledge_request_entity.dart';
import '../model/response/disciplinarySlip/co_reasons_list_response_entity.dart';
import '../model/request/disciplinary_slip/disciplinary_list_request.dart';
import '../model/response/disciplinarySlip/acknowledge_response_entity.dart';
import '../model/response/disciplinarySlip/disciplinary_list_response.dart';
import 'package:retrofit/retrofit.dart';
part 'disciplinary_retrofit_services.g.dart';

@RestApi()
abstract class DisciplinaryRetorfitService {
  factory DisciplinaryRetorfitService(Dio dio,
      {String? baseUrl, String? mdmBaseUrl, String? disciplinaryBaseUrl}) {
    return _DisciplinaryRetorfitService(
      dio,
      baseUrl: disciplinaryBaseUrl,
    );
  }
  @POST('/academics/warning/get-warning-acknowledgement-list')
  Future<HttpResponse<DisciplinaryListEntity>> getDisciplinaryList(
      @Body() DisciplinaryListRequest disciplinaryListRequest);



  @POST('/academics/warning/create-acknowledgement')
  Future<HttpResponse<AcknowlegementResponseEntity>> postAcknowledge(
      @Body() AcknowlegementRequestEntity acknowledgeRequestEntity);


  @GET('https://ampersand-r26sp3mibq-uc.a.run.app/api/co-reasons?filters%5Bslug%5D=academic_remark_disciplinary_slip')
  Future<HttpResponse<CoReasonsListResponseEntity>> getCoReasonsList();

}