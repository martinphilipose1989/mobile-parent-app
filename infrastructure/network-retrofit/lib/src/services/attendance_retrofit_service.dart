import 'dart:io';

import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:network_retrofit/src/model/request/transport/create_intimation_request_entity.dart';
import 'package:network_retrofit/src/model/response/transport/upload_intimation_file_response_entity.dart';

import '../model/request/attendance/attendance_count_request_entity.dart';
import '../model/request/attendance/attendance_details_request_entity.dart';
import '../model/response/attendance/attendance_count_response_entity.dart';
import 'package:retrofit/retrofit.dart';

import '../model/response/attendance/attendance_details_response_entity.dart';
import '../model/response/transport/create_intimation_response_entity.dart';
import '../model/response/transport/student_attendance_response_entity.dart';

part 'attendance_retrofit_service.g.dart';

@RestApi()
abstract class AttendanceRetorfitService {
  factory AttendanceRetorfitService(Dio dio, {String? attendanceBaseUrl}) {
    return _AttendanceRetorfitService(
      dio,
      baseUrl: attendanceBaseUrl,
    );
  }
  @POST("academics/attendance/get-mobile-attendance-summary")
  Future<HttpResponse<AttendanceCountResponseEntity>> getattendanceCount(
      @Body() AttendanceCountRequestEntity attendanceCountRequestEntity,
      @Query('platform') String app);

  @POST("academics/attendance/get-transport-attendance-list")
  Future<HttpResponse<AttendanceDetailsResponseEntity>> getattendanceDetail(
      @Body() AttendanceDetailsRequestEntity attendanceDetailsResponeEntity,
      @Query('platform') String app
      );
  @POST("academics/attendance/get-transport-attendance-list")
  Future<HttpResponse<StudentAttendanceResponseEntity>> getStudentAttendance(
      @Body() AttendanceDetailsRequestEntity studentEntity,
      @Query('platform') String app
      );

  @POST('academics/intimation/create')
  Future<HttpResponse<CreateIntimationResponseEntity>> createIntimation(
      @Body() CreateIntimationRequestEntity createIntimationRequestEntity);

  @POST('academics/intimation/file-upload')
  @MultiPart()
  Future<HttpResponse<UploadIntimationFileResponseEntity>> uploadIntimation({
    @Path('documentID') int? documentID,
    @Part(name: 'file') required File file,
  });
}
