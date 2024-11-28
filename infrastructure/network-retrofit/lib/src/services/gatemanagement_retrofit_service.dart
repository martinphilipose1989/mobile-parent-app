import 'dart:io';

import 'package:dio/dio.dart';
import 'package:network_retrofit/src/model/request/gatepass/create_gatepass_entity.dart';
import 'package:network_retrofit/src/model/request/gatepass/create_qrcode_request.dart';
import 'package:network_retrofit/src/model/response/gatepass/create_gatepass_entity_response.dart';
import 'package:network_retrofit/src/model/response/gatepass/create_qrcode_response.dart';
import 'package:network_retrofit/src/model/response/gatepass/upload_file_response_entity.dart';
import 'package:network_retrofit/src/model/response/gatepass/visitor_details_response_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'gatemanagement_retrofit_service.g.dart';

@RestApi()
abstract class GatemanagementService {
  static const String _createVisitorGatePass =
      "gate-management/gatepass/cross-platform/create";

  static const String _uploadProfileImage =
      "gate-management/visitor/upload-profile-image";

  static const String _getVisitorDetails = "gate-management/gatepass";

  static const String _getGatePassDetails =
      "gate-management/gatepass/{gatepassId}";

  factory GatemanagementService(Dio dio, {String? gateUrl}) {
    return _GatemanagementService(dio, baseUrl: gateUrl);
  }

  @POST(_createVisitorGatePass)
  Future<HttpResponse<CreateGatePassResponseEntity>> createVisitorGatePass(
      @Body() CreateGatePassRequestEntity requestBody,
      {@Query('platform') required String platform});

  @GET(_getVisitorDetails)
  Future<HttpResponse<VisitorDetailsResponseEntity>> getVisitorDetails(
      @Query("mobile") String visitorMobileNumber,
      @Query("studentId") String? studentId,
      {@Query('platform') required String platform});

  @GET(_getGatePassDetails)
  Future<HttpResponse<VisitorDetailsResponseEntity>> getGatepassDetailsById(
      @Path("gatepassId") String getpassID, @Query('platform') String platform);

  @POST(_uploadProfileImage)
  @MultiPart()
  Future<HttpResponse<UploadFileResponseEntity>> uploadProfileImage(
      @Part(name: "file") File file,
      {@Query('platform') required String platform});

  @POST(_createVisitorGatePass)
  Future<HttpResponse<CreateQrcodeResponseEntity>> requestGatePass(
      @Body() CreateQrcodeRequestEntity requestBody);
}
