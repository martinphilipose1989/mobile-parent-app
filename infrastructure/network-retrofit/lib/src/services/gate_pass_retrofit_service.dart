import 'dart:io';

import 'package:dio/dio.dart';
import 'package:network_retrofit/src/model/request/gatepass/create_gatepass_entity.dart';
import 'package:network_retrofit/src/model/request/gatepass/create_qrcode_request.dart';
import 'package:network_retrofit/src/model/response/gatepass/create_gatepass_entity_response.dart';
import 'package:network_retrofit/src/model/response/gatepass/create_qrcode_response.dart';
import 'package:network_retrofit/src/model/response/gatepass/mdm_coreason_entity.dart';
import 'package:network_retrofit/src/model/response/gatepass/upload_file_response_entity.dart';
import 'package:network_retrofit/src/model/response/gatepass/visitor_details_response_entity.dart';
import 'package:network_retrofit/src/util/network_properties.dart';
import 'package:retrofit/retrofit.dart';

part 'gate_pass_retrofit_service.g.dart';

@RestApi()
abstract class GatePassRetrofitService {
  factory GatePassRetrofitService(Dio dio, {String? gatePassBaseUrl}) {
    return _GatePassRetrofitService(
      dio,
      baseUrl: gatePassBaseUrl,
    );
  }

  /// GATE PASS API ENDPOINTS:
  static const String _createVisitorGatePass = "gate-management/gatepass/create";
  static const String _uploadProfileImage = "gate-management/visitor/upload-profile-image";
  static const String _getVisitorDetails = "gate-management/visitor/{mobile}/{studentId}";

  @POST(NetworkProperties.requestGatePass)
  Future<HttpResponse<CreateQrcodeResponseEntity>> requestGatePass(
      @Body() CreateQrcodeRequestEntity requestBody);

  @POST(_createVisitorGatePass)
  Future<HttpResponse<CreateGatePassResponseEntity>> createVisitorGatePass(
      @Body() CreateGatePassRequestEntity requestBody,
      {@Query('platform') required String platform});

  @POST(_uploadProfileImage)
  @MultiPart()
  Future<HttpResponse<UploadFileResponseEntity>> uploadProfileImage(
      @Part(name: "file") File file,
      {@Query('platform') required String platform});

  @GET(_getVisitorDetails)
  Future<HttpResponse<VisitorDetailsResponseEntity>> getVisitorDetails(
      @Path("mobile") visitorMobileNumber, @Path("studentId") studentId,
      {@Query('platform') required String platform});

  @GET(NetworkProperties.mdmModule)
  Future<HttpResponse<MdmCoReasonEntity>> getPurposeOfVisitList(
      @Query('filters[parent_id]') int id, @Query("fields[0]") String name);
}
