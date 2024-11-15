import 'dart:io';

import 'package:dio/dio.dart';
import '../model/request/attendance/attendance_count_request_entity.dart';
import '../model/request/attendance/attendance_details_request_entity.dart';
import '../model/response/attendance/attendance_count_response_entity.dart';
import 'package:retrofit/retrofit.dart';

import '../model/response/attendance/attendance_details_response_entity.dart';

part 'attendance_retrofit_service.g.dart';
@RestApi()
abstract class AttendanceRetorfitService {
  factory AttendanceRetorfitService(Dio dio,
      {String? baseUrl, String? mdmBaseUrl, String? attendanceBaseUrl}) {
    return _AttendanceRetorfitService(
      dio,
      baseUrl: attendanceBaseUrl,
    );
  }
 @POST( "academics/attendance/get-attendance-summary")
  Future<HttpResponse<AttendanceCountResponseEntity>> getattendanceCount(
      @Body() AttendanceCountRequestEntity attendanceCountRequestEntity);

  @POST( "academics/attendance/list")
  Future<HttpResponse<AttendanceDetailsResponseEntity>> getattendanceDetail(
      @Body() AttendanceDetailsRequestEntity attendanceDetailsResponeEntity);


}